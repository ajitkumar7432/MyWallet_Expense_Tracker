# Fly.io + PlanetScale Deployment Script
# Run this script after adding payment info to PlanetScale

Write-Host "=== Fly.io + PlanetScale Deployment Script ===" -ForegroundColor Cyan
Write-Host ""

# Check if pscale is available
try {
    pscale version | Out-Null
} catch {
    Write-Host "❌ PlanetScale CLI not found. Please install it first." -ForegroundColor Red
    exit 1
}

# Check if flyctl is available
try {
    flyctl version | Out-Null
} catch {
    Write-Host "❌ Fly.io CLI not found. Please install it first." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Required CLIs found" -ForegroundColor Green
Write-Host ""

# Step 1: Create PlanetScale database
Write-Host "📦 Step 1: Creating PlanetScale database..." -ForegroundColor Yellow
Write-Host "Running: pscale database create myappdb --region us-east --cluster-size PS-10"
$dbCreate = pscale database create myappdb --region us-east --cluster-size PS-10 2>&1

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to create database. Error:" -ForegroundColor Red
    Write-Host $dbCreate
    Write-Host ""
    Write-Host "⚠️  IMPORTANT: You need to add payment information to PlanetScale first!" -ForegroundColor Yellow
    Write-Host "   1. Go to https://planetscale.com/" -ForegroundColor Yellow
    Write-Host "   2. Log in and add payment information" -ForegroundColor Yellow
    Write-Host "   3. Run this script again" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Database created successfully!" -ForegroundColor Green
Write-Host ""

# Wait for database to be ready
Write-Host "⏳ Waiting for database to be ready..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Step 2: Create password
Write-Host "🔑 Step 2: Creating database password..." -ForegroundColor Yellow
Write-Host "Running: pscale password create myappdb main --name fly-credential"
$passwordOutput = pscale password create myappdb main --name fly-credential --format json | ConvertFrom-Json

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to create password" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Password created successfully!" -ForegroundColor Green
Write-Host ""

# Extract credentials
$dbHost = $passwordOutput.access_host_url
$dbUser = $passwordOutput.username
$dbPass = $passwordOutput.plain_text
$dbName = "myappdb"
$jdbcUrl = "jdbc:mysql://$dbHost/$dbName?sslMode=REQUIRED"

Write-Host "📋 Database Credentials:" -ForegroundColor Cyan
Write-Host "   Host: $dbHost"
Write-Host "   Username: $dbUser"
Write-Host "   Password: $dbPass"
Write-Host "   JDBC URL: $jdbcUrl"
Write-Host ""

# Step 3: Setup Fly.io
Write-Host "🚀 Step 3: Setting up Fly.io..." -ForegroundColor Yellow

# Navigate to backend directory
Set-Location -Path "backend"

# Login to Fly.io
Write-Host "Logging in to Fly.io..."
flyctl auth login

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to login to Fly.io" -ForegroundColor Red
    exit 1
}

# Launch app (without deploying)
Write-Host "Creating Fly.io app..."
flyctl launch --name my-spring-app --no-deploy --region iad

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to create Fly.io app" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Fly.io app created!" -ForegroundColor Green
Write-Host ""

# Step 4: Set secrets
Write-Host "🔐 Step 4: Setting environment variables..." -ForegroundColor Yellow

# Prompt for additional secrets
Write-Host "Please provide additional configuration:"
$jwtSecret = Read-Host "Enter JWT Secret (or press Enter for default)"
if ([string]::IsNullOrWhiteSpace($jwtSecret)) {
    $jwtSecret = "======================expense=tracker=mywallet==========================="
}

$mailUsername = Read-Host "Enter SMTP Email (or press Enter to skip)"
$mailPassword = Read-Host "Enter SMTP Password (or press Enter to skip)" -AsSecureString
$mailPasswordText = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($mailPassword))

# Set secrets
Write-Host "Setting secrets..."
$secretsCmd = @"
flyctl secrets set `
  SPRING_DATASOURCE_URL="$jdbcUrl" `
  SPRING_DATASOURCE_USERNAME="$dbUser" `
  SPRING_DATASOURCE_PASSWORD="$dbPass" `
  PORT=8080 `
  JWT_SECRET="$jwtSecret"
"@

if (-not [string]::IsNullOrWhiteSpace($mailUsername)) {
    $secretsCmd += " MAIL_USERNAME=`"$mailUsername`""
}
if (-not [string]::IsNullOrWhiteSpace($mailPasswordText)) {
    $secretsCmd += " MAIL_PASSWORD=`"$mailPasswordText`""
}

Invoke-Expression $secretsCmd

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Failed to set secrets" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Secrets set successfully!" -ForegroundColor Green
Write-Host ""

# Step 5: Deploy
Write-Host "🚀 Step 5: Deploying application..." -ForegroundColor Yellow
Write-Host "This may take several minutes..."
flyctl deploy

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Deployment failed" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "✅ ============================================" -ForegroundColor Green
Write-Host "✅  DEPLOYMENT SUCCESSFUL!" -ForegroundColor Green
Write-Host "✅ ============================================" -ForegroundColor Green
Write-Host ""

# Get app info
$appInfo = flyctl info --json | ConvertFrom-Json
$appUrl = "https://$($appInfo.Hostname)"

Write-Host "📱 Application URL: $appUrl" -ForegroundColor Cyan
Write-Host "📊 Status: flyctl status" -ForegroundColor Cyan
Write-Host "📋 Logs: flyctl logs" -ForegroundColor Cyan
Write-Host ""

Write-Host "🎉 Your Spring Boot application is now live!" -ForegroundColor Green

# Automated Deployment Guide - Fly.io + PlanetScale

## ⚠️ Important: PlanetScale Setup Required

PlanetScale requires payment information to be added before creating databases. This must be done through their web UI:

1. Go to https://planetscale.com/
2. Log in to your account
3. Add payment information in Settings
4. Once payment info is added, continue with the steps below

---

## Step-by-Step Deployment Instructions

### 1. PlanetScale Database Setup (CLI)

Once payment information is added to your PlanetScale account:

```powershell
# Already authenticated with: pscale auth login

# Create the database
pscale database create myappdb --region us-east --cluster-size PS-10

# Wait for database to be ready (check with)
pscale database show myappdb

# Create a password for the main branch
pscale password create myappdb main --name fly-credential

# The output will show:
# - NAME (username)
# - PLAIN TEXT (password)
# - ACCESS HOST URL (hostname)
# - DATABASE (database name)

# Save these credentials - you'll need them!
```

**Expected Output Example:**
```
NAME                 USERNAME         PLAIN TEXT                    ACCESS HOST URL
fly-credential       xxxxxxxxxxxxxx   pscale_pw_xxxxxxxxxxxxxxx    xxxxxxx.us-east-3.psdb.cloud
```

### 2. Construct JDBC URL

Based on the credentials from step 1, construct the JDBC URL:

```
jdbc:mysql://<ACCESS_HOST_URL>/<DATABASE_NAME>?sslMode=REQUIRED
```

**Example:**
```
jdbc:mysql://aws.connect.psdb.cloud/myappdb?sslMode=REQUIRED
```

### 3. Deploy to Fly.io

```powershell
# Navigate to backend directory
cd backend

# Login to Fly.io
flyctl auth login

# Create the app (without deploying yet)
flyctl launch --name my-spring-app --no-deploy

# Set environment variables with your PlanetScale credentials
flyctl secrets set `
  SPRING_DATASOURCE_URL="jdbc:mysql://<YOUR_HOST>/myappdb?sslMode=REQUIRED" `
  SPRING_DATASOURCE_USERNAME="<YOUR_USERNAME>" `
  SPRING_DATASOURCE_PASSWORD="<YOUR_PASSWORD>" `
  PORT=8080 `
  JWT_SECRET="your-super-secret-jwt-key-change-this-in-production" `
  MAIL_USERNAME="your-email@gmail.com" `
  MAIL_PASSWORD="your-app-password"

# Deploy the application
flyctl deploy

# Check the deployment status
flyctl status

# View logs
flyctl logs

# Get the app URL
flyctl info
```

---

## Environment Variables Reference

| Variable | Description | Example |
|----------|-------------|---------|
| `SPRING_DATASOURCE_URL` | JDBC connection URL | `jdbc:mysql://host.psdb.cloud/myappdb?sslMode=REQUIRED` |
| `SPRING_DATASOURCE_USERNAME` | PlanetScale username | From `pscale password create` output |
| `SPRING_DATASOURCE_PASSWORD` | PlanetScale password | From `pscale password create` output |
| `PORT` | Application port | `8080` |
| `JWT_SECRET` | JWT signing secret | Strong random string |
| `MAIL_USERNAME` | SMTP email address | `your-email@gmail.com` |
| `MAIL_PASSWORD` | SMTP app password | Gmail app password |

---

## Files Created

### 1. `backend/Dockerfile` (Multi-stage Production Build)

- **Stage 1**: Maven build with dependency caching
- **Stage 2**: Minimal JRE runtime with Alpine Linux
- Security: Non-root user
- Optimization: Separate dependency download layer
- Memory: Configured for 512MB max heap
- Health check: Built-in health endpoint monitoring

### 2. `backend/.dockerignore`

Excludes unnecessary files from Docker build for faster builds and smaller images.

### 3. `backend/fly.toml`

Fly.io configuration:
- HTTP service on port 8080
- Auto-scaling: 0-1 machines
- Health checks every 30s
- 1GB RAM, 1 shared CPU
- Auto HTTPS enabled

---

## Post-Deployment

### Access Your Application

Your app will be available at:
```
https://my-spring-app.fly.dev
```

### Useful Commands

```powershell
# View logs in real-time
flyctl logs -a my-spring-app

# SSH into the running container
flyctl ssh console -a my-spring-app

# Scale the app
flyctl scale memory 2048 -a my-spring-app

# Check app status
flyctl status -a my-spring-app

# List all secrets
flyctl secrets list -a my-spring-app

# Update a secret
flyctl secrets set SPRING_DATASOURCE_PASSWORD="new-password" -a my-spring-app

# Connect to PlanetScale database
pscale shell myappdb main
```

---

## Troubleshooting

### Common Issues

1. **App won't start**: Check logs with `flyctl logs`
2. **Database connection failed**: Verify JDBC URL format and credentials
3. **Out of memory**: Increase VM memory with `flyctl scale memory 2048`
4. **Health check failing**: Ensure actuator endpoint is accessible

### Database Issues

```powershell
# Check database status
pscale database show myappdb

# List all passwords
pscale password list myappdb main

# Create a new password if needed
pscale password create myappdb main --name new-credential
```

---

## Production Optimizations Applied

✅ Multi-stage Docker build (smaller image size)
✅ Non-root user for security
✅ Health checks configured
✅ Connection pooling (HikariCP)
✅ Memory limits set
✅ SSL/TLS enabled for database
✅ Environment-based configuration
✅ Production logging level

---

## Cleanup Commands

```powershell
# Destroy Fly.io app
flyctl apps destroy my-spring-app

# Delete PlanetScale database
pscale database delete myappdb
```

---

## Next Steps

1. **Add payment info to PlanetScale** (required)
2. **Run the PlanetScale commands** to create database and credentials
3. **Run the Fly.io commands** to deploy the application
4. **Test your deployment** at the provided URL
5. **Set up monitoring** and alerts as needed

---

## Security Notes

⚠️ **Important Security Recommendations:**

1. Change the default JWT_SECRET to a strong random string
2. Use Gmail App Passwords (not your actual password)
3. Enable 2FA on both Fly.io and PlanetScale accounts
4. Regularly rotate database passwords
5. Monitor access logs and set up alerts
6. Use Fly.io secrets (never commit credentials to git)

---

## Cost Estimates

- **Fly.io**: Free tier includes 3 shared-cpu VMs with 256MB RAM each
- **PlanetScale**: Starting at $29/month for production databases

---

## Support

- Fly.io Docs: https://fly.io/docs/
- PlanetScale Docs: https://planetscale.com/docs
- Spring Boot Docs: https://spring.io/projects/spring-boot

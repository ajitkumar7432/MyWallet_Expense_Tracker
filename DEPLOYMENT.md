# 🚀 MyWallet Deployment Guide - Render.com

## Deploy to Render.com - **FREE FOREVER** ⭐

**Render.com** offers a **100% free tier that never expires** - perfect for your full-stack Spring Boot + React application!

### ✅ Why Render.com?

- **FREE Forever**: No credit card required, no expiration
- **PostgreSQL Database**: 1GB free database included
- **Java Support**: Native Spring Boot support
- **Auto HTTPS**: Free SSL certificates
- **GitHub Integration**: Auto-deploy on every push
- **Trusted**: Used by 500,000+ developers
- **750 Hours/Month**: Enough to run your app 24/7

**Only Limitation**: App sleeps after 15 minutes of inactivity (wakes in ~30 seconds when accessed)

---

## 📋 Step-by-Step Deployment (20 Minutes)

### **Step 1: Push Code to GitHub**

Open PowerShell and run:

```powershell
cd "d:\Extras\Fullstack-Expense-Tracker-main"
git init
git add .
git commit -m "Initial commit - MyWallet for Render"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/mywallet.git
git push -u origin main
```

_(Replace `YOUR_USERNAME` with your GitHub username)_

---

### **Step 2: Create Render Account**

1. Go to **https://render.com/**
2. Click **"Get Started"**
3. Click **"Sign Up with GitHub"**
4. Authorize Render to access your repositories
5. **No credit card required!** ✅

---

### **Step 3: Create PostgreSQL Database**

1. Click **"New +"** → **"PostgreSQL"**
2. Fill in:
   - **Name**: `mywallet-db`
   - **Database**: `mywallet`
   - **User**: `mywallet`
   - **Region**: Choose closest to you
   - **Plan**: **Free** ✅
3. Click **"Create Database"**
4. Wait 2-3 minutes for database to provision
5. **Important**: Copy the **Internal Database URL** from the database info page

---

### **Step 4: Create Web Service**

1. Click **"New +"** → **"Web Service"**
2. Click **"Build and deploy from a Git repository"**
3. Click **"Connect"** next to your GitHub repository
4. Configure:

   **Basic Settings:**

   - **Name**: `mywallet-app`
   - **Region**: Same as database
   - **Branch**: `main`
   - **Root Directory**: Leave empty
   - **Runtime**: **Java**

   **Build Settings:**

   - **Build Command**:

     ```
     cd frontend && npm install && npm run build && cd ../backend && mvn clean package -DskipTests
     ```

   - **Start Command**:
     ```
     cd backend && java -jar target/expenseTracker-0.0.1-SNAPSHOT.jar
     ```

   **Plan:**

   - Select **"Free"** ✅

---

### **Step 5: Configure Environment Variables**

Click **"Advanced"** and add these environment variables:

| Key                          | Value                                          |
| ---------------------------- | ---------------------------------------------- |
| `SPRING_DATASOURCE_URL`      | Your PostgreSQL Internal URL from Step 3       |
| `SPRING_DATASOURCE_USERNAME` | `mywallet`                                     |
| `SPRING_DATASOURCE_PASSWORD` | Copy from database credentials                 |
| `DATABASE_PLATFORM`          | `org.hibernate.dialect.PostgreSQLDialect`      |
| `JWT_SECRET`                 | `MyWalletSecretKey2024ExpenseTrackerJWT123456` |
| `MAIL_USERNAME`              | `your_email@gmail.com`                         |
| `MAIL_PASSWORD`              | Your Gmail app password (see below)            |
| `PORT`                       | `8080`                                         |
| `UPLOAD_DIR`                 | `/tmp/uploads/user/profile`                    |

**To get Database URL:**

- Go to your `mywallet-db` database
- Scroll to **"Connections"** section
- Copy **"Internal Database URL"**
- Format: `postgresql://mywallet:password@host/mywallet`

---

### **Step 6: Deploy**

1. Click **"Create Web Service"**
2. Render starts building (takes 10-15 minutes first time)
3. Watch progress in **"Logs"** tab
4. Wait for **"Your service is live 🎉"**

---

### **Step 7: Access Your App**

Your live URL: `https://mywallet-app.onrender.com`

Test it:

- ✅ Register new user
- ✅ Test password reset
- ✅ Create transactions
- ✅ Upload profile picture

---

## 📧 Gmail App Password Setup

1. Go to **https://myaccount.google.com/**
2. **Security** → Enable **"2-Step Verification"**
3. Search **"App passwords"**
4. Generate for **Mail** app
5. Copy 16-character password
6. Use as `MAIL_PASSWORD`

---

## ⚡ Keep App Awake (Optional)

Free tier apps sleep after 15 min. To keep awake:

1. Go to **https://uptimerobot.com/** (free)
2. Add monitor: `https://mywallet-app.onrender.com`
3. Interval: 5 minutes
4. App stays awake 24/7!

---

## 💰 100% FREE Features

- ✅ 750 hours/month (24/7 for one app)
- ✅ PostgreSQL database (1GB)
- ✅ Free SSL/HTTPS
- ✅ Auto-deploy from GitHub
- ✅ Custom domain support
- ✅ Never expires
- ✅ No credit card needed

---

## 🛠️ Troubleshooting

**Build fails?**

- Check logs for errors
- Verify build command is correct

**Can't connect to database?**

- Use Internal Database URL (not External)
- Check database is running

**Frontend not loading?**

- Ensure `npm run build` succeeded
- Check Spring Boot serves static files

**Email not working?**

- Verify 16-char Gmail app password
- Enable 2-Step Verification

---

## 🔄 Auto-Deployment

Every `git push` to main:

- ✅ Auto-rebuild
- ✅ Auto-deploy
- ✅ Zero downtime

---

## 🎉 You're Live!

Your app is now:

- ✅ **FREE forever** on Render.com
- ✅ Using PostgreSQL (free 1GB)
- ✅ HTTPS secured
- ✅ Auto-deploying
- ✅ Accessible worldwide

**URL**: `https://mywallet-app.onrender.com`

Enjoy! 🚀💰

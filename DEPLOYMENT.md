> This guide is deprecated. To keep the repo clean and easy to grasp, deployment instructions now live in a single place.

# 📦 Deployment

See the short “Quick Commands” and “Config” sections in the root [README.md](./README.md). They cover local dev and production JAR.

If you want a managed cloud:

- Render (free tier) — create a Web Service and PostgreSQL DB, set env vars, and run the production JAR.
- Railway — provision MySQL/PostgreSQL, set env vars, and run the production JAR.

All platform-specific steps are straightforward variations of the same build/run flow documented in README.

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

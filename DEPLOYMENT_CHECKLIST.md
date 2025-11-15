# ✅ Render.com Deployment - Ready to Deploy!

## 🎯 Platform: Render.com - **FREE FOREVER**

### Why Render.com?

- ✅ **100% FREE** - No credit card, never expires
- ✅ **750 hours/month** - Runs 24/7 for free
- ✅ **PostgreSQL database** - 1GB free included
- ✅ **Auto HTTPS** - Free SSL certificates
- ✅ **No sleep** (with UptimeRobot)
- ✅ **Trusted** by 500K+ developers

---

## 📝 Files Configured for Render

### ✅ Created/Updated:

- `render.yaml` - Render infrastructure configuration
- `build.sh` - Build script (frontend + backend)
- `start.sh` - Start script for Java app
- `pom.xml` - Added PostgreSQL dependency
- `application.properties` - Auto-detect MySQL/PostgreSQL
- `DEPLOYMENT.md` - Complete step-by-step guide

### ❌ Removed:

- `railway.json` - Not needed
- `nixpacks.toml` - Not needed
- Unnecessary .md files

---

## 🚀 Quick Deployment Steps

### 1️⃣ Push to GitHub (5 min)

```powershell
git init
git add .
git commit -m "Deploy to Render"
git push -u origin main
```

### 2️⃣ Create Render Account (2 min)

- Go to https://render.com
- Sign up with GitHub
- No credit card needed!

### 3️⃣ Create PostgreSQL Database (3 min)

- New + → PostgreSQL
- Name: `mywallet-db`
- Plan: Free
- Copy Internal Database URL

### 4️⃣ Create Web Service (5 min)

- New + → Web Service
- Connect GitHub repo
- Build command: `cd frontend && npm install && npm run build && cd ../backend && mvn clean package -DskipTests`
- Start command: `cd backend && java -jar target/expenseTracker-0.0.1-SNAPSHOT.jar`

### 5️⃣ Add Environment Variables (3 min)

```
SPRING_DATASOURCE_URL = [PostgreSQL URL]
SPRING_DATASOURCE_USERNAME = mywallet
SPRING_DATASOURCE_PASSWORD = [DB Password]
DATABASE_PLATFORM = org.hibernate.dialect.PostgreSQLDialect
JWT_SECRET = MyWalletSecretKey2024
MAIL_USERNAME = your_email@gmail.com
MAIL_PASSWORD = [Gmail App Password]
PORT = 8080
```

### 6️⃣ Deploy & Wait (15 min)

- Click "Create Web Service"
- Watch logs
- Wait for "Your service is live 🎉"

### 7️⃣ Your App is LIVE!

URL: `https://mywallet-app.onrender.com`

**Total Time: ~35 minutes**

---

## 📧 Gmail App Password

Required for password reset emails:

1. Google Account → Security
2. Enable 2-Step Verification
3. App passwords → Mail
4. Copy 16-char password
5. Use as MAIL_PASSWORD

---

## ⚡ Keep App Awake (Optional)

Free tier sleeps after 15 min. Solution:

1. Go to https://uptimerobot.com (free)
2. Add monitor for your Render URL
3. Ping every 5 minutes
4. App never sleeps!

---

## 💰 Cost Breakdown

### Free Tier:

- Web Service: FREE (750 hrs/month)
- PostgreSQL: FREE (1GB)
- SSL/HTTPS: FREE
- Bandwidth: FREE (100GB/month)
- **Total: $0/month FOREVER** 🎉

### If You Upgrade (Optional):

- Starter: $7/month (no sleep, faster)
- Pro: $25/month (autoscaling)

**Free tier is perfect for portfolio projects!**

---

## 🎯 What Changed?

### Database:

- ❌ MySQL (not free on cloud)
- ✅ PostgreSQL (free 1GB on Render)

### Configuration:

- Auto-detects MySQL (local dev) or PostgreSQL (production)
- Works on both without code changes
- Single codebase for dev & production

---

## 📂 Project Structure

```
Fullstack-Expense-Tracker-main/
├── backend/
│   ├── src/
│   ├── pom.xml (✅ PostgreSQL added)
│   └── application.properties (✅ DB auto-detect)
├── frontend/
│   ├── src/
│   └── package.json
├── render.yaml (✅ Render config)
├── build.sh (✅ Build script)
├── start.sh (✅ Start script)
├── DEPLOYMENT.md (✅ Complete guide)
└── .gitignore
```

---

## 🆘 Troubleshooting

| Issue                | Solution                                    |
| -------------------- | ------------------------------------------- |
| Build fails          | Check logs, verify Node.js & Maven versions |
| DB connection error  | Use Internal DB URL, check credentials      |
| Email not working    | Verify Gmail app password (16 chars)        |
| App is slow          | Normal for free tier cold starts (~30s)     |
| Frontend not loading | Check if npm build succeeded                |

---

## 🎉 You're Ready!

Everything is configured for **FREE deployment** on Render.com!

**Next Steps:**

1. Open `DEPLOYMENT.md`
2. Follow the step-by-step guide
3. Your app will be live in 35 minutes!

**Free Features:**

- ✅ Full-stack app hosting
- ✅ PostgreSQL database
- ✅ HTTPS/SSL
- ✅ Auto-deployment
- ✅ Custom domain support
- ✅ Never expires

**Live URL**: `https://mywallet-app.onrender.com`

Good luck! 🚀💰

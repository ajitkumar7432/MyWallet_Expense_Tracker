> This guide is now summarized. Follow the README and use the same production JAR.

# 🚂 Railway (Short)

1) Create project from GitHub repo  
2) Add MySQL or PostgreSQL service  
3) Set `SPRING_DATASOURCE_*`, mail vars  
4) Build React → package Spring Boot → run the JAR  

See [README.md](./README.md) → Quick Commands / Config.

---

### **Step 6: Configure Build Settings**

Railway auto-detects your build, but verify these settings:

1. Click your service → **"Settings"** tab
2. **Root Directory**: Leave blank (uses project root)
3. **Build Command**: Auto-detected from `nixpacks.toml`
4. **Start Command**: Auto-detected from `railway.json`

---

### **Step 7: Deploy!**

1. Railway will **automatically deploy** when you push to GitHub
2. Watch the **"Deployments"** tab for build logs
3. Build takes ~5-10 minutes (first time)

---

### **Step 8: Get Your App URL**

1. Click your service → **"Settings"** tab
2. Scroll to **"Networking"** section
3. Click **"Generate Domain"**
4. Railway gives you a URL like: `https://mywallet-production.up.railway.app`

---

### **Step 9: Update Frontend API URL**

After getting Railway URL, update your frontend:

**File:** `frontend/src/services/auth.config.js`

```javascript
const API_BASE_URL = "https://your-railway-url.up.railway.app";
```

**Commit and push:**
```bash
git add frontend/src/services/auth.config.js
git commit -m "Update API URL to Railway"
git push origin main
```

Railway auto-deploys on every push!

---

## 🔍 Monitor Your Deployment

### **View Logs**
1. Click your service → **"Deployments"** tab
2. Click latest deployment → See real-time logs

### **Database Access**
1. Click MySQL service → **"Data"** tab
2. View tables and records
3. Or use **"Connect"** tab for MySQL Workbench connection

---

## ✅ Verify Deployment

1. Open your Railway URL: `https://your-app.up.railway.app`
2. You should see the **Login page**
3. Click **"Create Account"** → Register a new user
4. Check your email for verification link
5. Login and test all features:
   - ✅ Dashboard loads
   - ✅ Add transactions
   - ✅ View statistics
   - ✅ Upload profile image

---

## 🐛 Troubleshooting

### **Build Failed?**
- Check **Deployments** → **Build logs**
- Ensure Java 17 in `pom.xml` ✅ (already done)
- Verify `nixpacks.toml` exists in root

### **Database Connection Error?**
- Verify MySQL service is running (green status)
- Check environment variables reference Railway's MySQL vars
- Ensure `SPRING_DATASOURCE_URL` format is correct

### **Email Not Sending?**
- Verify Gmail App Password (16 digits, no spaces)
- Check `MAIL_USERNAME` is your full Gmail address
- Ensure 2-Step Verification is enabled on Google Account

### **App Crashes After Deploy?**
- Check logs: Click service → Deployments → View logs
- Common issues:
  - Missing environment variables
  - Incorrect `DATABASE_PLATFORM` value
  - Port not using `$PORT` variable

---

## 💡 Pro Tips

1. **Auto-Deploy**: Railway deploys automatically on every GitHub push
2. **Free Credits**: $5/month = ~500 hours of runtime (plenty for small apps)
3. **Custom Domain**: You can add your own domain in Settings → Networking
4. **Rollback**: Click any previous deployment → "Redeploy" to rollback
5. **Environment per Branch**: Create staging/production environments

---

## 📊 Railway Dashboard Overview

```
MyWallet Project
├── Spring Boot Service (Java 17)
│   ├── Environment Variables
│   ├── Deployments
│   └── Settings
└── MySQL Database
    ├── Data (view tables)
    ├── Variables (connection info)
    └── Metrics
```

---

## 🎯 Quick Commands

```bash
# View Railway CLI (optional - for advanced users)
npm i -g @railway/cli
railway login
railway link
railway logs

# Push changes and auto-deploy
git add .
git commit -m "Update feature"
git push origin main
```

---

## 🔐 Security Checklist

- ✅ Never commit `.env` files
- ✅ Use Railway's environment variables
- ✅ Keep `JWT_SECRET` secure (min 256 bits)
- ✅ Use Gmail App Password (not account password)
- ✅ Enable HTTPS (Railway provides free SSL)

---

## 📞 Support

- Railway Docs: https://docs.railway.app/
- Railway Discord: https://discord.gg/railway
- GitHub Issues: Your repository issues tab

---

**🎉 Congratulations! Your MyWallet app is now live on Railway with MySQL!**

Access your app at: `https://your-app.up.railway.app`

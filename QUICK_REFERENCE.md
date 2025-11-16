# 🚀 QUICK DEPLOYMENT REFERENCE CARD

## ONE-COMMAND DEPLOYMENT

```powershell
.\deploy-flyio-planetscale.ps1
```

---

## MANUAL DEPLOYMENT (3 Steps)

### 1️⃣ Create PlanetScale Database
```powershell
pscale database create myappdb --region us-east --cluster-size PS-10
pscale password create myappdb main --name fly-credential
```
**Save:** Host, Username, Password

### 2️⃣ Set Fly.io Secrets
```powershell
cd backend
flyctl auth login
flyctl launch --name my-spring-app --no-deploy

flyctl secrets set `
  SPRING_DATASOURCE_URL="jdbc:mysql://<HOST>/myappdb?sslMode=REQUIRED" `
  SPRING_DATASOURCE_USERNAME="<USERNAME>" `
  SPRING_DATASOURCE_PASSWORD="<PASSWORD>" `
  PORT=8080
```

### 3️⃣ Deploy
```powershell
flyctl deploy
```

---

## YOUR DEPLOYMENT URL
```
https://my-spring-app.fly.dev
```

---

## JDBC URL FORMAT
```
jdbc:mysql://<HOST>/myappdb?sslMode=REQUIRED
```

---

## QUICK COMMANDS

```powershell
# Logs
flyctl logs -a my-spring-app

# Status
flyctl status -a my-spring-app

# Restart
flyctl apps restart my-spring-app

# Database shell
pscale shell myappdb main
```

---

## FILES CREATED
- ✅ `backend/Dockerfile` (Production multi-stage build)
- ✅ `backend/.dockerignore` (Build optimization)
- ✅ `backend/fly.toml` (Fly.io config)
- ✅ `deploy-flyio-planetscale.ps1` (Automated deployment)
- ✅ `DEPLOYMENT_SUMMARY.md` (Full documentation)
- ✅ `DEPLOYMENT_GUIDE_FLYIO_PLANETSCALE.md` (Step-by-step guide)

---

## ENVIRONMENT VARIABLES
```
✅ SPRING_DATASOURCE_URL
✅ SPRING_DATASOURCE_USERNAME
✅ SPRING_DATASOURCE_PASSWORD
✅ PORT
✅ JWT_SECRET
✅ MAIL_USERNAME (optional)
✅ MAIL_PASSWORD (optional)
```

---

## ⚠️ BEFORE DEPLOYING
1. Add payment info to PlanetScale: https://planetscale.com/
2. Change JWT_SECRET to a strong random string
3. Use Gmail App Password for MAIL_PASSWORD

---

## 💰 COST
- Fly.io: ~$0-10/month (free tier available)
- PlanetScale: $29/month (Scaler plan)

**Total: ~$29-40/month**

---

## 📊 ARCHITECTURE
```
Internet → Fly.io (HTTPS) → Spring Boot → PlanetScale (MySQL/SSL)
```

---

## 🔐 SECURITY
✅ SSL/TLS on database  
✅ HTTPS auto-enabled  
✅ Non-root container  
✅ Secrets management  
✅ Health checks

---

## 📞 TROUBLESHOOTING

**App won't start?**
```powershell
flyctl logs -a my-spring-app
```

**DB connection failed?**
- Check JDBC URL format
- Verify credentials: `pscale password list myappdb main`

**Out of memory?**
```powershell
flyctl scale memory 2048 -a my-spring-app
```

---

**Generated:** November 16, 2025  
**Ready to deploy!** 🎉

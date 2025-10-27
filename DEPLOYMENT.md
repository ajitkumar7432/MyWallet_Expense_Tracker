# Deployment Guide - Vercel

## Prerequisites

- GitHub account
- Vercel account (sign up at https://vercel.com with GitHub)

## Quick Deploy Steps

### Option 1: Deploy via Vercel Dashboard (Recommended)

1. **Push to GitHub** (run in PowerShell):

```powershell
cd D:\Extras\Fullstack-Expense-Tracker-main
git init
git add .
git commit -m "Initial commit - Expense Tracker"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git branch -M main
git push -u origin main
```

2. **Deploy on Vercel**:

   - Go to https://vercel.com/new
   - Import your GitHub repository
   - Vercel will auto-detect the configuration from `vercel.json`
   - Click **Deploy**

3. **Set Environment Variables** (in Vercel Dashboard):

   - Go to your project → Settings → Environment Variables
   - Add these variables for the backend:
     ```
     SPRING_DATASOURCE_URL=your_database_url
     SPRING_DATASOURCE_USERNAME=your_db_username
     SPRING_DATASOURCE_PASSWORD=your_db_password
     JWT_SECRET=your_jwt_secret_key
     ```

4. **Get Your Live URL**:
   - Vercel will provide a URL like: `https://your-app-name.vercel.app`

---

### Option 2: Deploy via Vercel CLI

```powershell
# Install Vercel CLI globally
npm install -g vercel

# Navigate to project root
cd D:\Extras\Fullstack-Expense-Tracker-main

# Login to Vercel (opens browser)
vercel login

# Deploy to production
vercel --prod
```

---

## Backend Configuration Notes

### Database Setup

For production, you'll need a hosted database:

- **Free options**:
  - Supabase (PostgreSQL)
  - PlanetScale (MySQL)
  - MongoDB Atlas
  - Railway (PostgreSQL)

### Update Backend Configuration

1. Go to `backend/src/main/resources/application.properties`
2. Use environment variables:

```properties
spring.datasource.url=${SPRING_DATASOURCE_URL}
spring.datasource.username=${SPRING_DATASOURCE_USERNAME}
spring.datasource.password=${SPRING_DATASOURCE_PASSWORD}
```

---

## Frontend Configuration

Update API base URL in `frontend/src/services/auth.config.js`:

```javascript
const API_URL =
  process.env.REACT_APP_API_URL || "https://your-app-name.vercel.app/api";
```

Add to `frontend/.env.production`:

```
REACT_APP_API_URL=https://your-app-name.vercel.app/api
```

---

## Troubleshooting

**Issue**: Backend doesn't start

- Check Vercel logs: Project → Deployments → View Function Logs
- Verify Java version in `backend/pom.xml` matches Vercel's support

**Issue**: CORS errors

- Add CORS configuration in backend Spring Boot config
- Ensure frontend origin is whitelisted

**Issue**: Database connection failed

- Verify environment variables are set correctly
- Check database allows external connections

---

## Post-Deployment

Your app will be live at: `https://your-app-name.vercel.app`

- Frontend: `https://your-app-name.vercel.app`
- Backend API: `https://your-app-name.vercel.app/api`

Every push to `main` branch will trigger automatic redeployment.

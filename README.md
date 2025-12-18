<div align="center">

<img src="frontend/src/assets/images/logo.png" alt="MyWallet Logo" height="84" />

# MyWallet — Expense Tracker

Smart, simple personal finance — built with **Spring Boot 3** and **React 18**. One‑command dev, one‑jar production.

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
![Java](https://img.shields.io/badge/Java-17-orange.svg)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.1-brightgreen.svg)
![React](https://img.shields.io/badge/React-18.2.0-blue.svg)
![Build](https://img.shields.io/badge/Build-Maven%20%2B%20npm-6f42c1.svg)

<a href="#-quick-commands"><b>Run Locally</b></a> • <a href="#-quick-commands"><b>Production JAR</b></a>

</div>

---

## ✨ At a Glance

- 🔐 Secure auth (JWT), password reset via email
- 💸 Track income/expenses with categories + budgets
- 📊 Dashboard charts and monthly summaries
- 👤 Profile with avatar upload
- 🌙 Light/Dark themes, fully responsive

---

## 🖼️ Screenshots

- Landing — instant overview with a clear CTA  
  ![Landing](Pages/website/landpage.png)

- Login — secure email/password with validation  
  ![Login](Pages/website/login.png)

- Dashboard — quick income/expense summary  
  ![Dashboard](Pages/user_pages/Screenshot%202025-12-18%20121755.png)

- Transactions — searchable list with filters  
  ![Transactions](Pages/user_pages/Screenshot%202025-12-18%20121814.png)

- Add/Edit — category, type, amount, note  
  ![Add/Edit](Pages/user_pages/Screenshot%202025-12-18%20121828.png)

- Analytics — charts for spending insights  
  ![Analytics](Pages/user_pages/Screenshot%202025-12-18%20121849.png)

- Profile — user details and avatar upload  
  ![Profile](Pages/user_pages/Screenshot%202025-12-18%20121908.png)

- Admin — users and categories management  
  ![Admin Users](Pages/admin_pages/Screenshot%202025-12-18%20122024.png)
  ![Admin Categories](Pages/admin_pages/Screenshot%202025-12-18%20122048.png)

---

## 🧰 Tech

- Backend: Spring Boot, Spring Security, JPA/Hibernate, JavaMail
- Frontend: React, React Router, Axios, Recharts
- Database: MySQL (local), PostgreSQL/MySQL (prod)
- Build: Maven + npm

Create dev DB (MySQL): `CREATE DATABASE expensetracker;`

---

## 🚀 How I run it

Local dev (two terminals):
- Backend API: from `backend` → `.\mvnw.cmd spring-boot:run`
- Frontend UI: from `frontend` → `npm install` (first time) then `npm start`

Production (single JAR):
- Build React: from `frontend` → `npm ci` then `npm run build`
- Package API: from `backend` → `.\mvnw.cmd clean package -DskipTests`
- Run app: from `backend` → `java -jar target\expenseTracker-0.0.1-SNAPSHOT.jar`

App runs at `http://localhost:8080`.

---

## 🔧 Config (env vars)

Use env vars instead of editing `application.properties`.

```powershell
# MySQL local
$env:SPRING_DATASOURCE_URL="jdbc:mysql://localhost:3306/expensetracker"; $env:SPRING_DATASOURCE_USERNAME="root"; $env:SPRING_DATASOURCE_PASSWORD="yourpassword"

# Mail (for password reset)
$env:SPRING_MAIL_USERNAME="your_email@gmail.com"; $env:SPRING_MAIL_PASSWORD="your_gmail_app_password"

# Optional
$env:SERVER_PORT="8080"; $env:APP_USER_PROFILE_UPLOAD_DIR="./uploads/user/profile"
```

PostgreSQL (prod): `SPRING_DATASOURCE_URL=jdbc:postgresql://HOST:5432/DB` with user/password.

---

---

## 📁 Project Structure

```
MyWallet_Expense_Tracker/
├─ backend/
│  ├─ src/main/java/com/...
│  ├─ src/main/resources/
│  └─ pom.xml
├─ frontend/
│  ├─ src/assets/images/
│  ├─ src/components/
│  ├─ src/pages/
│  └─ package.json
├─ railway.json
├─ nixpacks.toml
└─ README.md
```

---

## 🤝 Contributing

1. Fork the project
2. Create a branch: `git checkout -b feat/your-change`
3. Commit: `git commit -m "feat: your change"`
4. Push: `git push origin feat/your-change`
5. Open a PR

---

## 📄 License

MIT — see [LICENSE](LICENSE).

---

## 👤 Author

- GitHub: [@ajitkumar7432](https://github.com/ajitkumar7432)

---

Made with ❤️

# 💰 MyWallet — Expense Tracker (Spring Boot + React)

Full‑stack personal finance tracker built with **Spring Boot 3** and **React 18**. Production flow packages the React build into Spring Boot so the app can be served from a single executable JAR.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Java](https://img.shields.io/badge/Java-17-orange.svg)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.1-brightgreen.svg)
![React](https://img.shields.io/badge/React-18.2.0-blue.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.x-blue.svg)

---

## ✨ Highlights

- 🔐 JWT auth, password reset via email
- 💸 Track income/expenses with categories and budgets
- 📊 Dashboard with charts and summaries
- 👤 Profile + image upload
- 🌙 Light/Dark themes; responsive UI

---

## 🖼️ Screenshots

> Images are stored in `frontend/src/assets/images`.

| | |
|---|---|
| ![Logo](frontend/src/assets/images/logo.png) | ![Dashboard](frontend/src/assets/images/transaction.png) |
| ![Income](frontend/src/assets/images/income.png) | ![Expense](frontend/src/assets/images/expense.png) |
| ![User](frontend/src/assets/images/user.png) | ![Cash](frontend/src/assets/images/cashInHand.png) |
| ![Dark Mode](frontend/src/assets/images/dark%20mode.png) | ![Light Mode](frontend/src/assets/images/light%20mode.png) |
| ![Success](frontend/src/assets/images/success.gif) |  |

### More Screenshots

| | |
|---|---|
| ![Landing](Pages/website/landpage.png) | ![Login](Pages/website/login.png) |
| ![Admin 1](Pages/admin_pages/Screenshot%202025-12-18%20122024.png) | ![Admin 2](Pages/admin_pages/Screenshot%202025-12-18%20122048.png) |
| ![User A](Pages/user_pages/Screenshot%202025-12-18%20121755.png) | ![User B](Pages/user_pages/Screenshot%202025-12-18%20121814.png) |
| ![User C](Pages/user_pages/Screenshot%202025-12-18%20121828.png) | ![User D](Pages/user_pages/Screenshot%202025-12-18%20121849.png) |
| ![User E](Pages/user_pages/Screenshot%202025-12-18%20121908.png) | ![User F](Pages/user_pages/Screenshot%202025-12-18%20121929.png) |

---

## 📦 Tech Stack

- **Backend:** Spring Boot, Spring Security, JWT, JPA/Hibernate, JavaMail
- **DB:** MySQL (local) • PostgreSQL/MySQL (production)
- **Frontend:** React, React Router, Axios, Recharts, React Hook Form
- **Build:** Maven, npm

---

## ⚙️ Prerequisites

- Java 17+
- Node.js 18+
- Maven (or use `mvnw` wrapper)
- MySQL running locally (for dev)

Create the dev database:

```sql
CREATE DATABASE expensetracker;
```

---

## 🚀 Production Build & Run

The backend is configured to copy the React build into `static/` during Maven build. Use this flow for a single JAR deployment.

### 1) Build frontend

```powershell
cd frontend
npm ci
npm run build
```

### 2) Build backend (packages UI inside the JAR)

```powershell
cd ..\backend
.\mvnw.cmd clean package -DskipTests
```

### 3) Run the JAR

```powershell
java -jar target\expenseTracker-0.0.1-SNAPSHOT.jar
```

App serves on `http://localhost:8080`.

---

## 🔧 Configuration (env vars)

Prefer environment variables instead of editing `application.properties`:

```powershell
$env:SPRING_DATASOURCE_URL="jdbc:mysql://localhost:3306/expensetracker"
$env:SPRING_DATASOURCE_USERNAME="root"
$env:SPRING_DATASOURCE_PASSWORD="yourpassword"
$env:SPRING_MAIL_USERNAME="your_email@gmail.com"
$env:SPRING_MAIL_PASSWORD="your_gmail_app_password"
$env:APP_VERIFICATIONCODEEXPIRATIONMS="60000"
```

For PostgreSQL in production, set:

```powershell
$env:SPRING_DATASOURCE_URL="jdbc:postgresql://HOST:5432/DBNAME"
$env:SPRING_DATASOURCE_USERNAME="USER"
$env:SPRING_DATASOURCE_PASSWORD="PASSWORD"
```

Optional:

```powershell
$env:SERVER_PORT="8080"
$env:APP_USER_PROFILE_UPLOAD_DIR="./uploads/user/profile"
```

---

## 🧪 Useful Commands

```powershell
# Backend (dev)
cd backend
.\mvnw.cmd spring-boot:run

# Backend tests
.\mvnw.cmd test

# Frontend install
cd ..\frontend
npm ci

# Frontend dev
npm start
```

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

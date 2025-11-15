# 💰 MyWallet - Expense Tracker

A full-stack expense tracking application built with **Spring Boot** and **React**, ready for **FREE deployment** on Render.com!

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Java](https://img.shields.io/badge/Java-17-orange.svg)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.1-brightgreen.svg)
![React](https://img.shields.io/badge/React-18.2.0-blue.svg)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-blue.svg)

---

## ✨ Features

- 🔐 **User Authentication** - JWT-based secure login/registration
- 💸 **Track Expenses & Income** - Categorize and monitor transactions
- 📊 **Statistics & Charts** - Visual insights with Recharts
- 💰 **Budget Management** - Set and track spending limits
- 📝 **Saved Templates** - Quick transaction creation
- 👤 **Profile Management** - Custom profile with image upload
- 📧 **Password Recovery** - Email-based password reset
- 🌙 **Dark Theme** - Modern fintech UI with yellow/orange accents
- 📱 **Mobile Responsive** - Works on all devices

---

## 🛠️ Tech Stack

### Backend

- **Spring Boot 3.2.1** - Java web framework
- **Spring Security** - Authentication & authorization
- **JWT** - Token-based security
- **JPA/Hibernate** - ORM for database
- **PostgreSQL** - Production database
- **MySQL** - Local development database
- **Spring Mail** - Email notifications

### Frontend

- **React 18** - UI library
- **React Router** - Client-side routing
- **Axios** - HTTP client
- **Recharts** - Data visualization
- **React Hook Form** - Form handling
- **React Hot Toast** - Notifications

---

## 🚀 Quick Start

### Prerequisites

- Java 17+
- Node.js 18+
- Maven 3.8+
- MySQL (for local dev)

### Local Development

1. **Clone the repository**

   ```bash
   git clone https://github.com/YOUR_USERNAME/mywallet.git
   cd mywallet
   ```

2. **Setup Backend**

   ```bash
   cd backend
   # Update application.properties with your MySQL credentials
   mvn spring-boot:run
   ```

   Backend runs on: `http://localhost:8080`

3. **Setup Frontend**

   ```bash
   cd frontend
   npm install
   npm start
   ```

   Frontend runs on: `http://localhost:3000`

4. **Create MySQL Database**
   ```sql
   CREATE DATABASE expensetracker;
   ```

---

## 🌐 Deploy to Render.com - **FREE FOREVER**

This app is configured for **100% free deployment** on Render.com!

### Quick Deploy Steps:

1. **Push to GitHub**
2. **Create Render account** (no credit card)
3. **Create PostgreSQL database** (free)
4. **Create Web Service** from GitHub
5. **Add environment variables**
6. **Deploy!**

**Detailed Guide**: See [`DEPLOYMENT.md`](./DEPLOYMENT.md) for complete step-by-step instructions.

**Time to deploy**: ~35 minutes  
**Cost**: $0/month forever  
**Live URL**: `https://mywallet-app.onrender.com`

---

## 🔧 Environment Variables

### Required for Deployment:

```env
SPRING_DATASOURCE_URL=postgresql://user:pass@host/db
SPRING_DATASOURCE_USERNAME=mywallet
SPRING_DATASOURCE_PASSWORD=your_db_password
DATABASE_PLATFORM=org.hibernate.dialect.PostgreSQLDialect
JWT_SECRET=your_jwt_secret_key
MAIL_USERNAME=your_email@gmail.com
MAIL_PASSWORD=gmail_app_password
PORT=8080
UPLOAD_DIR=/tmp/uploads/user/profile
```

See [`DEPLOYMENT.md`](./DEPLOYMENT.md) for detailed setup.

---

## 📂 Project Structure

```
mywallet/
├── backend/                 # Spring Boot backend
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/fullStack/
│   │   │   └── resources/
│   │   └── test/
│   └── pom.xml
├── frontend/                # React frontend
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   ├── contexts/
│   │   └── assets/
│   └── package.json
├── render.yaml              # Render deployment config
├── build.sh                 # Build script
├── start.sh                 # Start script
└── DEPLOYMENT.md            # Deployment guide
```

---

## 🎨 UI Features

- **Modern Dark Theme** - Sleek black background
- **Yellow/Orange Accents** - Fintech-inspired color scheme
- **Responsive Design** - Mobile-first approach
- **Smooth Animations** - Hover effects and transitions
- **Chart Visualizations** - Income vs Expense graphs
- **Category Management** - Custom expense categories
- **Transaction History** - Searchable and filterable
- **Budget Tracking** - Visual budget progress

---

## 🔐 Security Features

- JWT token authentication
- Password hashing with BCrypt
- CORS protection
- SQL injection prevention (JPA)
- XSS protection
- HTTPS encryption (on Render)
- Secure file uploads

---

## 📧 Email Features

- Password reset via email
- Email verification codes
- Gmail SMTP integration
- Customizable email templates

---

## 🧪 API Endpoints

### Authentication

- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/verify-code` - Verify reset code
- `POST /api/auth/reset-password` - Reset password

### Transactions

- `GET /api/transactions` - Get all transactions
- `POST /api/transactions` - Create transaction
- `PUT /api/transactions/{id}` - Update transaction
- `DELETE /api/transactions/{id}` - Delete transaction

### Categories

- `GET /api/categories` - Get all categories
- `POST /api/categories` - Create category (admin)

### User

- `GET /api/user/profile` - Get user profile
- `PUT /api/user/profile` - Update profile
- `POST /api/user/profile/image` - Upload profile picture

---

## 💰 Render.com Free Tier

### What's Included:

- ✅ **750 hours/month** - Enough for 24/7 operation
- ✅ **PostgreSQL database** - 1GB storage
- ✅ **100GB bandwidth/month**
- ✅ **Free SSL/HTTPS**
- ✅ **Auto-deploy from GitHub**
- ✅ **Custom domain support**
- ✅ **Never expires**

### Limitations:

- App sleeps after 15 minutes of inactivity
- Wakes up in ~30 seconds when accessed
- Use UptimeRobot (free) to keep app awake

---

## 🛠️ Development

### Run Tests

```bash
cd backend
mvn test
```

### Build Production

```bash
# Build frontend
cd frontend
npm run build

# Build backend
cd ../backend
mvn clean package
```

### Run Production Build

```bash
cd backend
java -jar target/expenseTracker-0.0.1-SNAPSHOT.jar
```

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Your Name**

- GitHub: [@ajitkumar7432](https://github.com/ajitkumar7432)

---

## 🙏 Acknowledgments

- Spring Boot team for the amazing framework
- React team for the powerful UI library
- Render.com for free hosting
- All open-source contributors

---

## 📞 Support

For deployment help, see [`DEPLOYMENT.md`](./DEPLOYMENT.md)

For quick reference, see [`DEPLOYMENT_CHECKLIST.md`](./DEPLOYMENT_CHECKLIST.md)

---

## 🎉 Ready to Deploy!

Your app is **fully configured** for free deployment on Render.com.

**Next Steps:**

1. Read [`DEPLOYMENT.md`](./DEPLOYMENT.md)
2. Push to GitHub
3. Deploy to Render.com
4. Share your live app!

**Estimated deployment time**: 35 minutes  
**Cost**: $0/month forever

---

Made with ❤️ and ☕

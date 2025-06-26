# 🍕 Online Food Delivery Management System

> A full-stack **Java Web Application** for seamless food ordering, built using **JSP**, **Servlets**, and **MySQL**.  
> Users can browse menus, manage carts, and place orders — all through a smooth, responsive interface.

---

## 📖 Overview

This web-based food ordering system allows users to:

- 👤 Register and log in securely  
- 🍽️ Browse available food items  
- 🛒 Add items to cart  
- 📦 Place orders  
- ✅ Receive instant confirmation  
- 🔓 Log out when done

The system is powered by **Java Servlets**, uses **MySQL** as the database, and runs on **Apache Tomcat**.

---

## 🖼️ Screenshots & UI Walkthrough

### 🏠 Home Page (`index.html`)
![Home Page](screenshots/homepage.png)  
➡️ Welcome screen with a **"Get Started"** button that guides users to log in or register.

---

### 🔐 Login Page (`login.html`)
![Login Page](screenshots/login.png)  
➡️ Secure login form with friendly UI and redirection to signup for new users.

---

### 📝 Sign-Up Page (`signup.html`)
![Sign-Up Page](screenshots/signup.png)  
➡️ Allows new users to register by providing username, email, and password.

---

### 🍱 Menu Page (`home1.jsp`)
![Menu Page](screenshots/food_items.png)  
➡️ Displays a list of food items from the database with **Add to Cart** functionality.

---

### 🛒 Cart Page (`mycart.jsp`)
![Cart Page](screenshots/cart.png)  
➡️ View selected items, total price, and proceed to **Place Order**.

---

### ✅ Order Confirmation
![Confirmation Page](screenshots/order_confirmation.png)  
➡️ Displays confirmation message and stores order in the database.

---

### 🔓 Logout Flow
![Logout Page](screenshots/logout.png)  
➡️ Ends the user session and redirects to the homepage with a logout success message.

---

## ⚙️ Tech Stack

| Layer       | Technology              |
|-------------|--------------------------|
| 🎨 Frontend  | HTML, CSS, JSP           |
| 🧠 Backend   | Java Servlets (Jakarta)  |
| 🗃️ Database  | MySQL                    |
| 🔥 Server    | Apache Tomcat            |
| 💻 IDE       | NetBeans                 |

---

## 🗂️ Project Structure

```
OnlineFoodDeliveryApp/
├── nbproject/           # NetBeans configuration
├── src/                 # Java Servlets
│   ├── SignupServlet.java
│   ├── LoginServlet.java
│   ├── HomeServlet.java
│   ├── AddToCartServlet.java
│   └── CartServlet.java
├── web/                 # HTML, JSP, and static assets
│   ├── images/
│   ├── index.html
│   ├── login.html
│   ├── signup.html
│   ├── home1.jsp
│   ├── mycart.jsp
│   └── OrderConfirmation.jsp
├── screenshots/         # UI screenshots for README
├── .gitignore
└── README.md
```

---

## 🚀 How to Run the Project

### 📦 Prerequisites

- Java JDK 11 or higher  
- Apache Tomcat 9+  
- MySQL Server  
- NetBeans IDE (with Java EE support)  
- Git (optional)

### 🛠️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/YourUsername/OnlineFoodDeliveryApp.git
   cd OnlineFoodDeliveryApp
   ```

2. **Open the project in NetBeans**

3. **Configure MySQL Database**
   - Create the database:
     ```sql
     CREATE DATABASE food_delivery;
     ```
   - Create tables: `users`, `food_items`, `cart`, `orders`

4. **Check database connection in Servlets**
   ```java
   Connection conn = DriverManager.getConnection(
       "jdbc:mysql://localhost:3306/food_delivery", "root", "your-password"
   );
   ```

5. **Build and Deploy**
   - Right-click the project → `Clean and Build`
   - Right-click again → `Run` (deploys to Tomcat)

6. **Visit the application**
   ```
   http://localhost:8080/OnlineFoodDeliveryApp
   ```

---

## 🧪 User Journey

- 🏠 Launch welcome page  
- 🔐 Login or 📝 Register  
- 🍽️ Browse food menu  
- ➕ Add items to cart  
- 🛍️ Review and place order  
- ✅ Get confirmation  
- 🔓 Logout securely

---

## 🙋 Author(s)

- 👩‍💻 **Abhinaya Chalamalasetti**


---


## ✨ Feedback & Contributions

If you found this project helpful or want to enhance it:

- ⭐ Star the repository  
- 🍴 Fork and contribute  
- 🛠️ Submit a pull request  

Let’s make food ordering smarter together! 🍽️💻

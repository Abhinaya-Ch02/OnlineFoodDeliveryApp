# 🍕🧑‍🍳 Online Food Delivery Management System

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

### 🏠 Home Page (`index.html`)
<div align="center" style="border: 1px solid #ccc; padding: 8px; display: inline-block;">
  <img src="screenshots/homepage.png" alt="Home Page" width="60%">
</div>

📝 <strong>Description:</strong>  
➡️ A clean welcome screen featuring the app’s name and a <strong>"Get Started"</strong> button. It leads users to log in or register and start their food journey.

---
### 🔐 Login Page (`login.html`)
<div align="center" style="border: 1px solid #ccc; padding: 8px; display: inline-block;">
  <img src="screenshots/login.png" alt="Login Page" width="60%">
</div>

📝 <strong>Description:</strong>  
➡️Secure login form with a clean UI. If the user doesn’t have an account, they are redirected to the sign-up page.

---

### 📝 Sign-Up Page (`signup.html`)
<div align="center" style="border: 1px solid #ccc; padding: 8px; display: inline-block;">
  <img src="screenshots/signup.png" alt="Sign-Up Page" width="60%">
</div>

📝 <strong>Description:</strong>  
➡️New users can register by providing a username, email, and password. Data is stored in the `users` table.

---

### 🍱 Menu Page (`home1.jsp`)
<div align="center" style="border: 1px solid #ccc; padding: 8px; display: inline-block;">
  <img src="screenshots/food_items.png" alt="Menu Page" width="60%">
</div>

📝 <strong>Description:</strong>  
➡️Displays food items retrieved from the `food_items` table in the database, each with an image, name, price, and an **Add to Cart** button.

---

### 🛒 Cart Page (`mycart.jsp`)
<div align="center" style="border: 1px solid #ccc; padding: 8px; display: inline-block;">
  <img src="screenshots/cart.png" alt="Cart Page" width="60%">
</div>

📝 <strong>Description:</strong>  
➡️Shows the selected items in the cart, calculates the total price, and provides a **Place Order** button to confirm the order.

---

### ✅ Order Confirmation
<div align="center" style="border: 1px solid #ccc; padding: 8px; display: inline-block;">
  <img src="screenshots/order_confirmation.png?v=2" alt="Order Confirmation Page" width="60%">
</div>

📝 <strong>Description:</strong>  
➡️Displays a confirmation message once the order is placed. Order details are stored in the `orders` table, and users can continue shopping or log out.


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
   git clone https://github.com/Abhinaya-Ch02/OnlineFoodDeliveryApp.git
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

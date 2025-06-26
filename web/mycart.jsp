<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart - Foodie Delight</title>
    <!-- Import Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Roboto:wght@700&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        /* Navbar */
        .navbar {
            background-color: #2c3e50;
            overflow: hidden;
            padding: 10px 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: flex-end; /* Align links to the right */
        }

        .navbar a {
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            font-size: 18px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #3498db;
            color: white;
        }

        /* Cart Container */
        .cart-container {
            width: 80%;
            max-width: 800px;
            margin: 40px auto;
            text-align: center;
        }

        .cart-container h2 {
            font-size: 28px;
            color: #2c3e50;
            font-family: 'Roboto', sans-serif;
            margin-bottom: 20px;
        }

        /* Cart Item */
        .cart-item {
            border: 1px solid #ddd;
            padding: 20px;
            margin: 20px auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .cart-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .cart-item img {
            width: 100px;
            height: 100px;
            border-radius: 10px;
            object-fit: cover;
        }

        .cart-details {
            flex-grow: 1;
            padding: 0 20px;
            text-align: left;
        }

        .cart-details h3 {
            margin: 0;
            font-size: 20px;
            color: #2c3e50;
            font-family: 'Roboto', sans-serif;
        }

        .cart-details p {
            margin: 5px 0;
            font-size: 16px;
            color: #555;
        }

        .cart-actions {
            text-align: right;
        }

        /* Enhanced Buttons */
        .cart-actions button {
            border: none;
            padding: 12px 24px; /* Bigger size */
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px; /* Bigger font size */
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-left: 10px;
        }

        .remove-btn {
            background-color: #ff6f61;
            color: white;
        }

        .remove-btn:hover {
            background-color: #ff4a3d;
            transform: translateY(-2px);
        }

        .place-order-btn {
            background-color: #28a745;
            color: white;
            margin-top: 20px; /* Added margin for spacing */
        }

        .place-order-btn:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        /* Total Price */
        .total-price {
            font-size: 24px;
            font-weight: bold;
            color: #28a745;
            margin-top: 30px;
        }

        /* Empty Cart Message */
        .empty-cart {
            font-size: 18px;
            color: #555;
            margin-top: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .cart-container {
                width: 90%;
            }

            .cart-item {
                flex-direction: column;
                text-align: center;
            }

            .cart-details {
                padding: 10px 0;
                text-align: center;
            }

            .cart-actions {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="HomeServlet">Home</a>
        <a href="CartServlet">My Cart</a>
        <a href="LogoutServlet">Logout</a>
    </div>

    <!-- Cart Container -->
    <div class="cart-container">
        <h2>Your Cart</h2>
        <div>
            <% 
                List<String> cartItems = (List<String>) request.getAttribute("cartItems");
                Double totalPrice = (Double) request.getAttribute("totalPrice");
                if (cartItems != null && !cartItems.isEmpty()) {
                    for (String item : cartItems) {
                        out.println(item);
                    }
            %>
            <p class="total-price">Total Price: ₹<%= String.format("%.2f", totalPrice) %></p>
            
            <% } else { %>
                <p class="empty-cart">Your cart is empty.</p>
            <% } %>
        </div>
    </div>
</body>
</html>
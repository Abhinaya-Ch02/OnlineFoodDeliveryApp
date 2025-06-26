<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Placed - Foodie Delight</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Roboto:wght@700&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; text-align: center; }
        .success { font-size: 28px; color: #28a745; margin-top: 40px; font-family: 'Roboto', sans-serif; }
        h3 { font-size: 24px; color: #2c3e50; margin-top: 30px; font-family: 'Roboto', sans-serif; }
        .order-list { margin-top: 20px; display: inline-block; text-align: left; width: 80%; max-width: 600px; }
        .order-item { background-color: #fff; border: 1px solid #ddd; border-radius: 10px; padding: 20px; margin: 10px auto; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); text-align: center; }
        .order-item img { width: 100px; height: 100px; border-radius: 10px; object-fit: cover; margin: 0 auto 15px; }
        .continue-shopping { display: inline-block; margin-top: 30px; padding: 12px 24px; background-color: #3498db; color: white; text-decoration: none; border-radius: 8px; font-size: 16px; }
        .continue-shopping:hover { background-color: #2980b9; }
    </style>
</head>
<body>
    <h2 class="success">Your order has been placed successfully! 🎉</h2>
    <h3>Your Ordered Items:</h3>
    <div class="order-list">
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                // Get the logged-in user ID from the session (without redeclaring session)
                Integer userIdObj = (Integer) session.getAttribute("user_id");

                if (userIdObj == null) {
                    response.sendRedirect("login.html"); // Redirect if user is not logged in
                    return;
                }
                int userId = userIdObj;

                // Connect to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery", "root", "");

                // Fetch only orders for the logged-in user
                String query = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC LIMIT 10";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, userId);
                rs = stmt.executeQuery();

                // Display user-specific orders
                boolean hasOrders = false;
                while (rs.next()) {
                    hasOrders = true;
                    out.println("<div class='order-item'>");
                    out.println("<img src='" + rs.getString("image_url") + "' alt='" + rs.getString("name") + "'>");
                    out.println("<h4>" + rs.getString("name") + "</h4>");
                    out.println("<p>Price: ₹" + rs.getDouble("price") + "</p>");
                    out.println("</div>");
                }

                // Show message if no orders exist
                if (!hasOrders) {
                    out.println("<p>No recent orders found.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
    <br>
    <a href="HomeServlet" class="continue-shopping">Continue Shopping</a>
</body></html>

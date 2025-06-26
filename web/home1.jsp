<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>  <%-- ✅ Import SQL classes --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Foodie Delight</title>
    
    <!-- Import Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Roboto:wght@700&display=swap" rel="stylesheet">
    
    <style>
        /* General Styles */
        body { font-family: 'Poppins', sans-serif; margin: 0; padding: 0; background-color: #f8f9fa; }
        .navbar { background-color: #2c3e50; overflow: hidden; padding: 10px 20px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); display: flex; justify-content: flex-end; }
        .navbar a { color: #f2f2f2; text-align: center; padding: 14px 20px; text-decoration: none; font-size: 18px; transition: background-color 0.3s ease, color 0.3s ease; }
        .navbar a:hover { background-color: #3498db; color: white; }
        .page-heading { text-align: center; margin: 50px 0; }
        .page-heading h1 { font-size: 40px; color: #2c3e50; font-family: 'Roboto', sans-serif; margin-bottom: 10px; }
        .page-heading p { font-size: 20px; color: #555; }
        .food-container { display: flex; flex-wrap: wrap; justify-content: center; padding: 20px; gap: 20px; }
        .food-item { background-color: #fff; border: 1px solid #ddd; border-radius: 10px; padding: 20px; width: 250px; text-align: center; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); transition: transform 0.3s ease, box-shadow 0.3s ease; display: flex; flex-direction: column; align-items: center; }
        .food-item:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); }
        .food-item img { width: 100%; height: 150px; object-fit: cover; border-radius: 10px; margin-bottom: 15px; }
        .food-item h3 { margin: 10px 0; font-size: 20px; color: #2c3e50; font-family: 'Roboto', sans-serif; }
        .food-item p { color: #28a745; font-weight: bold; font-size: 18px; margin: 10px 0; }
        .food-item button { background-color: #3498db; color: white; border: none; padding: 12px 24px; border-radius: 8px; cursor: pointer; font-size: 16px; transition: background-color 0.3s ease, transform 0.3s ease; margin-top: auto; }
        .food-item button:hover { background-color: #2980b9; transform: translateY(-2px); }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="HomeServlet">Home</a>
        <a href="CartServlet">My Cart</a>
        <a href="LogoutServlet">Logout</a>
    </div>

    <!-- Page Heading -->
    <div class="page-heading">
        <h1>FOODIE DELIGHT</h1>
        <p>Delivery in 5 mins</p>
    </div>

    <!-- Food Container -->
    <div class="food-container">
        <% 
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery", "root", "");

                // Fetch food items from the database
                String query = "SELECT * FROM food_items";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();

                while (rs.next()) {
        %>
                    <div class="food-item">
                        <img src="<%= rs.getString("image_url") %>" alt="<%= rs.getString("name") %>">
                        <h3><%= rs.getString("name") %></h3>
                        <p>₹<%= rs.getDouble("price") %></p>
                        <form action="AddToCartServlet" method="post">
                            <input type="hidden" name="food_item_id" value="<%= rs.getInt("id") %>">
                            <button type="submit">Add to Cart</button>
                        </form>
                    </div>
        <% 
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

    <!-- JavaScript for Alert Message -->
    <script>
        // Show alert if ?added=true is in the URL
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('added')) {
                alert("Item added to cart successfully! ✅");
                window.history.replaceState(null, null, window.location.pathname); // Removes ?added=true from URL
            }
        };
    </script>
</body>
</html>

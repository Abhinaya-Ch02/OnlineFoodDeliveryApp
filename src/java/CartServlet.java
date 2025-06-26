import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> cartItems = new ArrayList<>();
        double totalPrice = 0.0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery", "root", "");

            // Retrieve all items from the cart
           HttpSession session = request.getSession();
           int userId = (int) session.getAttribute("user_id"); // Get logged-in user ID

           String query = "SELECT * FROM cart WHERE user_id = ?";
           stmt = conn.prepareStatement(query);
           stmt.setInt(1, userId);

            
            rs = stmt.executeQuery();

            // Store cart item details
            while (rs.next()) {
                String cartItem = String.format(
                    "<div class='cart-item'>" +
                    "<img src='%s' alt='%s'>" +
                    "<h3>%s</h3>" +
                    "<p>Price: ₹%.2f</p>" +
                    "<form action='RemoveFromCartServlet' method='post'>" +
                    "<input type='hidden' name='cart_id' value='%d'>" +
                    "<button type='submit'>Remove</button>" +
                    "</form>" +
                    "</div>",
                    rs.getString("image_url"), rs.getString("name"),
                    rs.getString("name"), rs.getDouble("price"),
                    rs.getInt("id") // Cart item ID
                );
                cartItems.add(cartItem);
                totalPrice += rs.getDouble("price"); // Calculate total price
            }

            // Add Place Order button if cart is not empty
            if (!cartItems.isEmpty()) {
                cartItems.add(
                    "<form action='PlaceOrderServlet' method='post'>" +
                    "<button type='submit' class='place-order-btn'>Place Order</button>" +
                    "</form>"
                );
            }

            // Set cart items and total price as request attributes
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("totalPrice", totalPrice);

            // Forward to cart.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("mycart.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

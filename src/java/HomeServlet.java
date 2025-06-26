import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> foodItems = new ArrayList<>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery", "root", "");

            // Execute SQL query
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM food_items");

            // Store food item HTML strings in a list
            while (rs.next()) {
                String foodItem = String.format(
                    "<div class='food-item'>" +
                    "<img src='%s' alt='%s'>" +
                    "<h3>%s</h3>" +
                    "<p>Price: ₹%.2f</p>" +
                    "<form action='AddToCartServlet' method='post'>" +
                    "<input type='hidden' name='food_item_id' value='%d'>" +
                    "<button type='submit'>Add to Cart</button>" +
                    "</form>" +
                    "</div>",
                    rs.getString("image_url"), rs.getString("name"),
                    rs.getString("name"),  // Corrected name placement
                    rs.getDouble("price"), // Corrected price placement
                    rs.getInt("id") // Food item ID
                );
                foodItems.add(foodItem);
            }

            // Set the food items as a request attribute
            request.setAttribute("foodItems", foodItems);

            // Forward the request to home.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("home1.jsp");
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
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

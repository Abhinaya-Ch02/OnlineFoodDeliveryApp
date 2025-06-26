import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int foodItemId = Integer.parseInt(request.getParameter("food_item_id"));

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery", "root", "");

            // Get the logged-in user ID from session
            HttpSession session = request.getSession();
            Integer userIdObj = (Integer) session.getAttribute("user_id");

            if (userIdObj == null) {
                response.sendRedirect("login.html"); // Redirect if user is not logged in
                return;
            }
            int userId = userIdObj;

            // Retrieve the selected food item details
            String selectQuery = "SELECT * FROM food_items WHERE id = ?";
            pstmt = conn.prepareStatement(selectQuery);
            pstmt.setInt(1, foodItemId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // Insert item into the cart
                String insertQuery = "INSERT INTO cart (user_id, food_id, image_url, name, price) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                insertStmt.setInt(1, userId);
                insertStmt.setInt(2, rs.getInt("id"));
                insertStmt.setString(3, rs.getString("image_url"));
                insertStmt.setString(4, rs.getString("name"));
                insertStmt.setDouble(5, rs.getDouble("price"));
                insertStmt.executeUpdate();
                insertStmt.close();
            }

            // Redirect back to the previous page with alert parameter
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer + (referer.contains("?") ? "&" : "?") + "added=true"); // ✅ Appends ?added=true

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

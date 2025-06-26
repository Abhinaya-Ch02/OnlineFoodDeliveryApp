import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement insertStmt = null;
        PreparedStatement deleteStmt = null;
        PreparedStatement selectStmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery", "root", "");

            // Fetch the user_id from the session
            HttpSession session = request.getSession();
            Integer userIdObj = (Integer) session.getAttribute("user_id");

            if (userIdObj == null) {
                response.sendRedirect("login.html"); // Redirect if the user is not logged in
                return;
            }
            int userId = userIdObj;

            // Fetch all items from the cart for the specific user
            String selectSQL = "SELECT * FROM cart WHERE user_id = ?";
            selectStmt = conn.prepareStatement(selectSQL);
            selectStmt.setInt(1, userId);
            rs = selectStmt.executeQuery();

            // Insert cart items into orders table
            String insertSQL = "INSERT INTO orders (user_id, name, price, image_url) VALUES (?, ?, ?, ?)";
            insertStmt = conn.prepareStatement(insertSQL);

            while (rs.next()) {
                insertStmt.setInt(1, userId);
                insertStmt.setString(2, rs.getString("name"));
                insertStmt.setDouble(3, rs.getDouble("price"));
                insertStmt.setString(4, rs.getString("image_url"));
                insertStmt.executeUpdate();
            }

            // Clear only this user's cart
            String deleteSQL = "DELETE FROM cart WHERE user_id = ?";
            deleteStmt = conn.prepareStatement(deleteSQL);
            deleteStmt.setInt(1, userId);
            deleteStmt.executeUpdate();

            // Redirect to order confirmation page
            response.sendRedirect("OrderConfirmation.jsp");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (selectStmt != null) selectStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (deleteStmt != null) deleteStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

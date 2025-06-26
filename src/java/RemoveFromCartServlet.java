import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        int cartId = Integer.parseInt(request.getParameter("cart_id"));

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery", "root", "");

            // Delete item from cart
            String deleteQuery = "DELETE FROM cart WHERE id = ?";
            pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setInt(1, cartId);
            pstmt.executeUpdate();

            // Redirect back to cart page
            response.sendRedirect("CartServlet");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("<h2>Error: " + e.getMessage() + "</h2>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

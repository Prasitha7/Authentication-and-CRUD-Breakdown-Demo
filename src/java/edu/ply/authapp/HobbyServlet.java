package edu.ply.authapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/hobby")
public class HobbyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("userId");
        String hobby = request.getParameter("hobby");

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/authappdb", "root", "1234");
            String sql = "INSERT INTO hobbies (user_id, hobby) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setString(2, hobby);
            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp");  // Redirect to login if userId is not set
            return;
        }
        int hobbyId = Integer.parseInt(request.getParameter("id"));

        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/authAppDB", "root", "1234");
            String sql = "DELETE FROM hobbies WHERE id = ? AND user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, hobbyId);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
            conn.close();

            response.sendRedirect("index.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

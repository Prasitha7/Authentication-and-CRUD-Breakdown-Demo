<%-- 
    Document   : index
    Created on : Oct 30, 2024, 3:55:54 PM
    Author     : MCS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <a href="addHobby.jsp">Add Hobby</a> | <a href="logout">Logout</a>
        <h2>Your Hobbies:</h2>
        <ul>
        <% 
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            // Redirect to login page if userId is not in the session
            response.sendRedirect("login.jsp");
            return; // Stop further processing of this page
        }
        
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/authAppDB", "root", "1234")) {
            String sql = "SELECT * FROM hobbies WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
        %>
        <li>
            <%= rs.getString("hobby") %>
            <a href="hobby?id=<%= rs.getInt("id") %>">Delete</a>
        </li>
        <% 
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        %>
        </ul>
    </body>
</html>

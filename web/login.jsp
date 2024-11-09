<%-- 
    Document   : login
    Created on : Oct 30, 2024, 4:09:34 PM
    Author     : MCS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="login" method="post">
            Username: <input type="text" name="username" /><br/>
            Password: <input type="password" name="password" /><br/>
            <input type="submit" value="Login" /><br/>
        </form>
        Have not Registered in yet? <a href='register.jsp'>Register</a>
    </body>
</html>

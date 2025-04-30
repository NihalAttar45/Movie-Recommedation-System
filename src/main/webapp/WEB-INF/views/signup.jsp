<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
   <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/validation.js"></script>
</head>

<body>
    <div class="box">
        <h2>Sign-Up Form</h2>
        <form action="registeruser" name="signupForm" method="post" onsubmit="return validateForm();">
            <div class="form-controls">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter username here" autocomplete="on" required>
                
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter password here" autocomplete="off" required>
                
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter email here" required>
                
                <label for="contact">Contact</label>
                <input type="text" id="contact" name="contact" placeholder="Enter contact number here" required>
                
                <input type="submit" value="Sign-Up">
            </div>
        </form>
        <p style="color:red;"><strong>${msg}</strong></p>
        <p style="color:green;"><strong>${msgsuccess}</strong></p>
    </div>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login.css">
</head>


<body>
    <div class="container">
        <div class="login-box">
            <h2 >Login Form</h2>
            <form action="Usave" name="frm" method="post">
                <div class="form-controls">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter username here" autocomplete="on" required>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter password here" autocomplete="off" required>
                    <input type="submit" value="Login">
                    <a href="sign" class="signup-link">Sign-Up</a>
                </div>
            </form>
           <p class="message error"><strong>${msg}</strong></p>
           <p class="message success"><strong>${msgsuccess}</strong></p>

        </div>
    </div>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/login.css">
</head>

<body>
	<div class="box">
		<h2>Login Form</h2>
		<form action="Asave" name="frm" method="get">
			<div class="form-controls">
				<label for="username">Username</label> <input type="text"
					id="username" name="adminusername"
					placeholder="Enter username here" autocomplete="on" required>
				<label for="password">Password</label> <input type="password"
					id="pass" name="adminpassword" placeholder="Enter password here"
					autocomplete="off" required> <input type="submit"
					value="Login">

			</div>
		</form>
		<p style="color: red;">
			<strong>${msg}</strong>
		</p>
		<p style="color: green;">
			<strong>${msgsuccess}</strong>
		</p>

	</div>
</body>
</html>

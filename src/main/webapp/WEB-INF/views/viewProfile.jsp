<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/viewProfile.css">
</head>
<body>

<div class="profile-container">
    <div class="profile-icon" >
        <i class="fas fa-user-circle fa-7x"></i> <!-- Font Awesome Icon for profile -->
    </div>
    <h1>User Profile</h1>
    
    <!-- Display Profile Information -->
   
    <div class="profile-info"><span>Name:</span> ${user.username}</div>
    <div class="profile-info"><span>Email:</span> ${user.email}</div>
    <div class="profile-info"><span>Password:</span> ${user.password}</div>
    <div class="profile-info"><span>Contact:</span> ${user.contact}</div>

    <a href="User" class="btn btn-primary mt-3">Back Home</a>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>

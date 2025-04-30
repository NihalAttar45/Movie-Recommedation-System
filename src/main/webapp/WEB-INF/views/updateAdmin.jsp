<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Movie</title>

    <link rel="stylesheet" href="resources/AdminHomePage.css">
    <link rel="stylesheet" href="resources/addMovie.css">
</head>
<body>

    <!-- Include the Admin navigation bar -->
    <jsp:include page="AdminHomePage.jsp" />

    <main>
        <div class="container">
            <div class="container1">
                <h1>Update Admin</h1>
            </div>
            <form action="updateAdminbyid" method="post" class="movie-form">
                <!-- Hidden input for movie ID -->
                <input type="hidden" name="aid" value="${admin.aid}" />

                <!-- Movie Name field -->
                <div class="form-group">
                    <label for="adminusername">admin Name:</label>
                    <input type="text" id="name" name="adminusername" value="${admin.adminusername}" required>
                </div>

                <!-- Language field -->
                <div class="form-group">
                    <label for="adminpassword">password:</label>
                    <input type="text" id="pass" name="adminpassword" value="${admin.adminpassword}" required>
                </div>

                <!-- Actor field -->
                <div class="form-group">
                    <label for="adminemail">Email:</label>
                    <input type="text" id="email" name="adminemail" value="${admin.adminemail}" required>
                </div>

                <!-- Year field -->
                <div class="form-group">
                    <label for="admincontact">Contact:</label>
                    <input type="text" id="contact" name="admincontact" value="${admin.admincontact}" required>
                </div>

                <!-- Submit button -->
                <div class="form-group">
                    <button type="submit" class="btn">Update Admin</button>
                </div>

                <!-- Success and Error messages -->
                <p style="color: green; font-weight: bold; text-align: center;" class="message success">${msgT}</p>
                <p style="color: red; font-weight: bold; text-align: center;" class="message error">${msgF}</p>
            </form>
        </div>
    </main>

    <!-- Footer section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Movie Recommendation System. All Rights Reserved.</p>
        </div>
    </footer>

</body>
</html>

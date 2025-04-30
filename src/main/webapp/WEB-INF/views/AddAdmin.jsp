<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Admin</title>

    <link rel="stylesheet" href="resources/AdminHomePage.css">
    <link rel="stylesheet" href="resources/addMovie.css">
    <script src="resources/JS/addadmin.js"></script> <!-- Ensure this script includes the validateAdminForm() function -->
    
    <!-- Add your validation scripts directly if not in external file -->

</head>
<body>

    <jsp:include page="AdminHomePage.jsp" />

    <main>
        <div class="container">
            <div class=container1>
                <h1>Add New Admin</h1>
            </div>
            <form action="addadmin" method="post" class="admin-form" onsubmit="return validateAdminForm()">
                <div class="form-group">
                    <label for="adminname">Admin Name:</label>
                    <input type="text" id="adminname" name="adminusername" required oninput="validateName(this.value)">
                </div>
                <div class="form-group">
                    <label for="adminpassword">Admin Password:</label>
                    <input type="text" id="adminpassword" name="adminpassword" required oninput="validatePassword(this.value)">
                </div>
                <div class="form-group">
                    <label for="adminemail">Admin Email:</label>
                    <input type="text" id="adminemail" name="adminemail" required oninput="validateEmail(this.value)">
                </div>
                <div class="form-group">
                    <label for="admincontact">Admin Contact:</label>
                    <input type="text" id="admincontact" name="admincontact" required oninput="validateContact(this.value)">
                </div>
                <div id="s" style="color: red;"></div> <!-- To display validation messages -->
                <div class="form-group">
                    <button type="submit" class="btn">Add Admin</button>
                </div>

                <p style="color: green; font-weight: bold; text-align: center;" class="message success">${msgT}</p>
                <p style="color: red; font-weight: bold; text-align: center;" class="message error">${msgF}</p>
            </form>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 Movie Recommendation System. All Rights Reserved.</p>
        </div>
    </footer>
</body>
</html>

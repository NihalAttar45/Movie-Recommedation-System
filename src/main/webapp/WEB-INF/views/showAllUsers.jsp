<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Users</title>
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/showmovie.css" />
    <script src="${pageContext.request.contextPath}/resources/JS/searchuser.js"></script>
</head>
<body>
    <jsp:include page="AdminHomePage.jsp" />
    <h1>All Registered Users</h1>
    <div class="search-container">
        <input type="text" id="userSearch" onkeyup="searchuser(this.value)" placeholder="Search for user..">
    </div>
    <div class="table-container">
        <div id="Showgrid">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="counter" value="1"/>
                    <c:forEach var="user" items="${userlist}">
                        <tr>
                            <td>${counter}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.contact}</td>
                            <td>
                                <!-- Delete icon -->
                                <a href="deleteuser?uid=${user.user_id}" style="text-decoration: none;">
                                    <i class="fas fa-trash-alt" style="color: red;"></i>
                                </a>
                            </td>
                        </tr>
                        <c:set var="counter" value="${counter+1}"/>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

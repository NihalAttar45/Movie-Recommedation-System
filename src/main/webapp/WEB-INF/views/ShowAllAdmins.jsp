<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Admins</title>
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/showmovie.css" />
    <script src="${pageContext.request.contextPath}/resources/JS/Adminsearch.js"></script>
</head>
<body>
    <jsp:include page="AdminHomePage.jsp" />
    <h1>All Admins</h1>
    <div class="search-container">
        <input type="text" id="AdminSearch" onkeyup="searchAdmin(this.value)" placeholder="Search for admin..">
    </div>
    <div class="table-container">
        <div id="showadmin">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Admin Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="counter" value="1"/>
                    <c:forEach var="admin" items="${adminlist}">
                        <tr>
                            <td>${counter}</td>
                            <td>${admin.adminusername}</td>
                            <td>${admin.adminemail}</td>
                            <td>${admin.admincontact}</td>
                            <td>
                                <!-- Delete icon -->
                                <a href="deleteadmin?adid=${admin.aid}" style="text-decoration: none;">
                                    <i class="fas fa-trash-alt" style="color: red;"></i>
                                </a>
                            </td>
                            <td>
                                <!-- Update icon -->
                                <a href="updateadmin?adid=${admin.aid}" style="text-decoration: none;">
                                    <i class="fas fa-edit" style="color: green;"></i>
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

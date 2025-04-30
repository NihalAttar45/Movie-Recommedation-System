<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Wise Movies</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/AdminHomePage.css">
   <link rel="stylesheet" href="resources/userwisemovies.css">
</head>
<body>

<jsp:include page="AdminHomePage.jsp" />
    <div class="container">
        <h1>User ID Wise Movies</h1>
        <c:forEach var="entry" items="${userMovies}">
            <div class="user-section">
                <h3>User ID: ${entry.key}</h3>
                <ul>
                    <c:forEach var="movie" items="${entry.value}">
                        <li>${movie}</li>
                    </c:forEach>
                </ul>
                <hr />
            </div>
        </c:forEach>
    </div>
  </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Movies</title>
    <!-- Include Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/showmovie.css" />
    <script src="${pageContext.request.contextPath}/resources/JS/search.js"></script>
</head>
<body>
    <jsp:include page="AdminHomePage.jsp" />
    <h1>All Movies</h1>
    <div class="search-container">
        <input type="text" id="movieSearch" onkeyup="searchMovies(this.value)" placeholder="Search for movies..">
    </div>
    <div class="table-container">
        <div id="showgrid">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Movie Name</th>
                        <th>Language</th>
                        <th>Actor</th>
                        <th>Year</th>
                        <th>Delete</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="counter" value="1"/>
                    <c:forEach var="movie" items="${movielist}">
                        <tr>
                            <td>${counter}</td>
                            <td>${movie.moviename}</td>
                            <td>${movie.movielang}</td>
                            <td>${movie.movieactor}</td>
                            <td>${movie.movieyear}</td>
                            <td>
                                <!-- Delete icon -->
                                <a href="deletemov?movid=${movie.movieid}" style="text-decoration: none;">
                                    <i class="fas fa-trash-alt" style="color: red;"></i>
                                </a>
                            </td>
                            <td>
                                <!-- Update icon -->
                                <a href="updatemov?movid=${movie.movieid}" style="text-decoration: none;">
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

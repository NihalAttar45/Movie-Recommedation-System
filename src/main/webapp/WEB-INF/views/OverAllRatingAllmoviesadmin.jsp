<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Top Recommended Movies</title>
    
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/OverAllRatingAllmoviesadmin.css' />" />
</head>
<body>
    <!-- Include Admin's Header -->
    <jsp:include page="AdminHomePage.jsp" />

    <main class="container-fluid mt-5">
        <h1 class="text-center mb-4" style="font-weight: bold;">Recommended All Movies</h1>

        <!-- Movies Grid -->
        <div class="row">
            <!-- Loop through top recommended movies -->
            <c:forEach var="entry" items="${topMovies}">
                <div class="col-6 col-md-4 col-lg-3 mb-4">
                    <div class="movie-card card h-100">
                        <a href="ShowMovietowatchbyname?moviename=${entry.key}">
                            <img src="<c:url value='/resources/images/${entry.key.toLowerCase().replaceAll(" ", "")}.jpg' />"
                                 class="movie-img card-img-top"
                                 alt="${entry.key} Image">
                        </a>
                        <div class="card-body text-center">
                            <h5 class="card-title">${entry.key}</h5>
                            <!-- Star Rating -->
                            <c:if test="${entry.value != null}">
                                <!-- Filled Stars -->
                                <c:forEach begin="1" end="${entry.value.intValue()}" var="star">
                                    <i class="fas fa-star" style="color: #FFD700; text-shadow: 1px 1px 2px black;"></i>
                                </c:forEach>

                                <!-- Half Star -->
                                <c:if test="${entry.value - entry.value.intValue() > 0}">
                                    <i class="fas fa-star-half-alt" style="color: #FFD700; text-shadow: 1px 1px 2px black;"></i>
                                </c:if>

                                <!-- Empty Stars -->
                                <c:forEach begin="${entry.value.intValue() + 1}" end="5" var="emptyStar">
                                    <i class="far fa-star" style="color: #FFD700; text-shadow: 1px 1px 2px black;"></i>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <!-- Include jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

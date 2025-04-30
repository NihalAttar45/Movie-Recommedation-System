<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recommended Movies</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/recommendedmov.css' />" />
</head>
<body>
    <header class="sticky-top bg-light">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand" href="#">
                <h1 id="mtitle" class="d-inline">Movie Recommendation System</h1>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="User">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="showmoviestouser">Show All Movies</a></li>
                    <li class="nav-item"><a class="nav-link" href="showmoviestouserforwatch">Watch Movie</a></li>
                    <li class="nav-item"><a class="nav-link" href="recommendedmov">Recommended Movies</a></li>
                    <li class="nav-item"><a class="nav-link" href="seereviewandrating">See Reviews</a></li>
                    <li class="nav-item"><a class="nav-link" href="watchedList">Watched Movies</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle"></i> Profile
                        </a>
                        <div class="dropdown-menu" aria-labelledby="profileDropdown">
                            <a class="dropdown-item" href="viewprofileuser">View</a>
                            <a class="dropdown-item" href="updateUprofile">Update</a>
                            <a class="dropdown-item" href="logout">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="container-fluid mt-5">
        <h1 class="text-center mb-4" style="font-weight: bold;">Top 5 Recommended Movies</h1>
        <!-- Movie Carousel -->
        <div id="movieCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <!-- Single Slide: Movies -->
                <div class="carousel-item active">
                    <div class="d-flex flex-nowrap overflow-auto" style="overflow-y: hidden;">
                        <!-- Loop through top recommended movies -->
                        <c:forEach var="entry" items="${topMovies}">
                            <div class="movie-card col-6 col-md-3 mb-3 flex-shrink-0">
                                <div class="card h-100" style="border-radius: 20px;">
                                    <a href="ShowMovietowatchbyname?moviename=${entry.key}">
                                        <img src="<c:url value='/resources/images/${entry.key.toLowerCase().replaceAll(" ", "")}.jpg' />"
                                             class="movie-img card-img-top"
                                             alt="${entry.key} Image"
                                             style="border-radius: 20px;">
                                    </a>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">${entry.key}</h5>
                                        <!-- Star Rating -->
                                        <c:if test="${entry.value != null}">
                                            Rating:
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
                </div>
            </div>

            <!-- Carousel controls -->
            <a class="carousel-control-prev" href="#movieCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#movieCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </main>

    <!-- Include jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

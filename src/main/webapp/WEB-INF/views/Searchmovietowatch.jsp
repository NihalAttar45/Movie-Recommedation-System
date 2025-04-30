<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Movies</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/recommendedmov.css' />">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

<div class="container mt-5">
    <h1 class="text-center mb-4">Movies</h1>

    <!-- Search Bar -->
    <div class="mb-4">
        <input type="text" id="search" class="form-control" placeholder="Search for movies...">
    </div>

    <!-- Movies Grid -->
    <div class="row" id="movieGrid">
        <!-- Loop through movies -->
        <c:forEach var="mov" items="${movieList}">
            <div class="col-6 col-md-4 col-lg-2 mb-4">
                <div class="card h-100" style="border-radius: 20px;">
                    <a href="ShowMovietowatch?movieId=${mov.movieid}">
                        <img src="<c:url value='/resources/images/${mov.moviename.toLowerCase().replaceAll(" ", "")}.jpg' />"
                             class="movie-img card-img-top" alt="${mov.moviename} Image"
                             style="border-radius: 20px;">
                    </a>
                    <div class="card-body text-center">
                        <h5 class="card-title">${mov.moviename}</h5>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- jQuery, Popper.js, and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        $('#search').on('keyup', function () {
            let query = $(this).val();
            $.ajax({
                url: '<c:url value="/searchtowatchmovie" />',
                type: 'GET',
                data: {query: query},
                success: function (data) {
                    $('#movieGrid').html($(data).find('#movieGrid').html());
                }
            });
        });
    });
</script>

</body>
</html>

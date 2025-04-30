<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Recommendation System</title>
    <!-- External CSS -->
    <link rel="stylesheet" href="resources/showAllmovietouser.css" />
    <script src="${pageContext.request.contextPath}/resources/JS/searchmovietouser.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <header class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <h1 class="d-inline">Movie Recommendation System</h1>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
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
                             <a class="dropdown-item" href="logout">logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    
    <div class="container">
        <h1 class="page-title">All Movies</h1>
        <div class="search-container">
            <input type="text" id="movieSearch" onkeyup="searchMoviesU(this.value)" placeholder="Search for movies..">
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
                    </tr>
                </thead>
                <tbody>
                <c:set var="counter" value="1"/>
                
                    <c:forEach var="movie" items="${movielist}">
                        <tr>
                            <td>${counter}</td>
                           <td><a href="ShowMovietowatch?movieId=${movie.movieid} " style="color: #dc3545;"><strong>${movie.moviename}</strong></a></td>
                            <td>${movie.movielang}</td>
                            <td>${movie.movieactor}</td>
                            <td>${movie.movieyear}</td>
                        </tr>
                        <c:set var="counter" value="${counter+1}"/>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

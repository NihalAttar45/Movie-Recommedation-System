<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Review</title>
    <!-- Bootstrap CSS for responsive and modern design -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style type="text/css">
        body {
        
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
            margin: 0;
        }
        
        header {
            background-color: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar {
            padding: 15px 20px;
        }

        #mtitle {
            font-size: 24px;
            font-weight: 600;
        }

        .container {
            max-width: 600px;
            background-color: #ffffff;
            padding: 40px;
            margin-top: 100px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }

        h1 {
            color: #dc3545;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 16px;
            font-weight: bold;
            color: #343a40;
            display: block;
            margin-bottom: 10px;
        }

        .form-control {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            width: calc(100% - 24px);
            margin: 0 auto;
            box-sizing: border-box;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .submit-btn, .back-btn {
            font-size: 18px;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 48%;
            color: white;
            text-align: center;
        }

        .submit-btn {
            background-color: #1976D2;
        }

        .submit-btn:hover {
            background-color: #155b9f;
        }

        .back-btn {
            background-color: #6c757d;
        }

        .back-btn:hover {
            background-color: #5a6268;
        }

        .review {
            margin-top: 20px;
            text-align: center;
        }

        .review p {
            font-size: 18px;
            font-weight: bold;
            color: #28a745;
        }

        @media only screen and (max-width: 768px) {
            .container {
                padding: 20px;
            }
            h1 {
                font-size: 24px;
            }
            .form-control {
                width: calc(100% - 20px);
            }
            .submit-btn, .back-btn {
                font-size: 16px;
                padding: 10px;
            }
       
        }
        #searchInput{
        margin-bottom: 10px;
        }
    </style>
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

   <div class="container">
        <h1>Check Movie Review</h1>
        <form action="${pageContext.request.contextPath}/movieReview" method="post">
            <div class="form-group">
                <label for="movieDropdown">Select a movie to see the review:</label>
                <input type="text" class="form-control search-input" id="searchInput" placeholder="Search movies...">
                <select id="movieDropdown" name="movieName" class="form-control" style="padding: 6px">
                    <option value="">Select a movie</option>
                    <c:forEach var="movie" items="${movieList}">
                        <option value="${movie.moviename}">${movie.moviename}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="btn-group">
                <button type="submit" class="submit-btn">Submit</button>
                <a href="${pageContext.request.contextPath}/User" class="back-btn">Back</a>
            </div>
        </form>

        <div class="review">
            <c:if test="${not empty reviewMessage}">
                <p>${reviewMessage}</p>
            </c:if>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies for responsiveness and interactivity -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
        $(document).ready(function() {
            // Function to filter dropdown options based on search input
            $('#searchInput').on('keyup', function() {
                var searchValue = $(this).val().toLowerCase();
                $('#movieDropdown option').each(function() {
                    var text = $(this).text().toLowerCase();
                    $(this).toggle(text.includes(searchValue));
                });
            });
        });
    </script>
</body>
</html>

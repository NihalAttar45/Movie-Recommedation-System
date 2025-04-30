<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Movie</title>

    <link rel="stylesheet" href="resources/AdminHomePage.css">
    <link rel="stylesheet" href="resources/addMovie.css">
</head>
<body>

    <!-- Include the Admin navigation bar -->
    <jsp:include page="AdminHomePage.jsp" />

    <main>
        <div class="container">
            <div class="container1">
                <h1>Update Movie</h1>
            </div>
            <form action="updatemoviebyid" method="post" class="movie-form">
                <!-- Hidden input for movie ID -->
                <input type="hidden" name="movieid" value="${movie.movieid}" />

                <!-- Movie Name field -->
                <div class="form-group">
                    <label for="moviename">Movie Name:</label>
                    <input type="text" id="moviename" name="moviename" value="${movie.moviename}" required>
                </div>

                <!-- Language field -->
                <div class="form-group">
                    <label for="movielang">Language:</label>
                    <input type="text" id="movielang" name="movielang" value="${movie.movielang}" required>
                </div>

                <!-- Actor field -->
                <div class="form-group">
                    <label for="movieactor">Actor:</label>
                    <input type="text" id="movieactor" name="movieactor" value="${movie.movieactor}" required>
                </div>

                <!-- Year field -->
                <div class="form-group">
                    <label for="movieyear">Year:</label>
                    <input type="number" id="movieyear" name="movieyear" value="${movie.movieyear}" required>
                </div>

                <!-- Submit button -->
                <div class="form-group">
                    <button type="submit" class="btn">Update Movie</button>
                </div>

                <!-- Success and Error messages -->
                <p style="color: green; font-weight: bold; text-align: center;" class="message success">${msgT}</p>
                <p style="color: red; font-weight: bold; text-align: center;" class="message error">${msgF}</p>
            </form>
        </div>
    </main>

    <!-- Footer section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Movie Recommendation System. All Rights Reserved.</p>
        </div>
    </footer>

</body>
</html>

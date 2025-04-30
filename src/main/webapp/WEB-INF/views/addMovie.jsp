<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Movie</title>

<link rel="stylesheet" href="resources/AdminHomePage.css">
<link rel="stylesheet" href="resources/addMovie.css">

</head>
<body>



	<jsp:include page="AdminHomePage.jsp" />



	<main>
		<div class="container">
			<div class=container1>
				<h1>Add New Movie</h1>
			</div>
			<form action="savemovieuploadimg" method="post"
				enctype="multipart/form-data" class="movie-form">
				<div class="form-group">
					<label for="moviename">Movie Name:</label> <input type="text"
						id="moviename" name="moviename" required>
				</div>
				<div class="form-group">
					<label for="movielang">Language:</label> <input type="text"
						id="movielang" name="movielang" required>
				</div>
				<div class="form-group">
					<label for="movieactor">Actor:</label> <input type="text"
						id="movieactor" name="movieactor" required>
				</div>
				<div class="form-group">
					<label for="movieyear">Year:</label> <input type="number"
						id="movieyear" name="movieyear" required>
				</div>
				<div class="form-group">
					<label for="movieposter">Add Movie Poster:</label> <input
						type="file" id="movieposter" name="movieposter" accept="image/*"
						required>
				</div>
				<div class="form-group">
					<button type="submit" class="btn">Add Movie</button>
				</div>

				<p style="color: green; font-weight: bold; text-align: center;"
					class="message error">${msgT}</p>
				<p style="color: red; font-weight: bold; text-align: center;"
					class="message success">${msgF}</p>
			</form>

		</div>
	</main>

	<footer>
		<div class="container">
			<p>&copy; 2024 Movie Recommendation System. All Rights Reserved.</p>
		</div>
	</footer>
	</div>
</body>
</html>

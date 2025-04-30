<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Watch Movie</title>

<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="<c:url value='/resources/watchMovie.css' />">
</head>
<body>
	<!-- Header Section -->
	<header class="sticky-top bg-light">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="#">
				<h1 id="mtitle" class="d-inline">Movie Recommendation System</h1>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="User">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showmoviestouser">Show All Movies</a></li>
					<li class="nav-item"><a class="nav-link"
						href="showmoviestouserforwatch">Watch Movie</a></li>
					<li class="nav-item"><a class="nav-link" href="recommendedmov">Recommended
							Movies</a></li>
					<li class="nav-item"><a class="nav-link"
						href="seereviewandrating">See Reviews</a></li>
					<li class="nav-item"><a class="nav-link" href="watchedList">Watched
							Movies</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="profileDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-user-circle"></i>
							Profile
					</a>
						<div class="dropdown-menu" aria-labelledby="profileDropdown">
							<a class="dropdown-item" href="viewprofileuser">View</a> <a
								class="dropdown-item" href="updateUprofile">Update</a> <a
								class="dropdown-item" href="logout">Logout</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</header>

	<!-- Main Content -->
	<main
		class="container d-flex justify-content-center align-items-center">
		<div class="card">
			<c:forEach var="movie" items="${movieList}">
				<div class="row no-gutters">
					<div class="col-md-5">
						<c:set var="imageName" value="${fn:toLowerCase(movie.moviename)}" />
						<c:set var="imagePath"
							value="/resources/images/${fn:replace(imageName, ' ', '')}.jpg" />
						<img src="<c:url value='${imagePath}' />"
							class="card-img img-cover" alt="${movie.moviename} Image">
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<div class="movie-details">
								<h5 class="card-title">${movie.moviename}</h5>
								<p class="card-text">
									<strong>Language:</strong> ${movie.movielang}
								</p>
								<p class="card-text">
									<strong>Actor:</strong> ${movie.movieactor}
								</p>
								<p class="card-text">
									<strong>Year:</strong> ${movie.movieyear}
								</p>
							</div>
							<div class="mt-4 d-flex flex-column">
								<a href="watchmovieandassignmovie?movieId=${movie.movieid}"
									class="btn btn-primary btn-lg mb-2 mb-md-0 mr-md-2 mb-2">Click
									to Watch Movie</a> <a href="showmoviestouser"
									class="btn btn-danger btn-lg mb-2 mb-md-0 mr-md-2 mt-4">Back
									to All Movies</a> <a
									href="showratingwithreview?movieName=${movie.moviename}"
									class="btn btn-danger btn-lg mb-2 mb-md-0 mr-md-2 mt-4">Show
									Rating and Review</a>
								<button type="button" class="btn btn-danger btn-lg mt-4"
									onclick="openRatingModal(${movie.movieid})">Give
									Rating and Review</button>
							</div>
							<div class="message-section mt-4">
								<c:if test="${not empty msgT}">
									<p style="color: green; font-weight: bold;">${msgT}</p>
								</c:if>
								<c:if test="${not empty msgf}">
									<p style="color: red; font-weight: bold;">${msgf}</p>
								</c:if>
								<c:if test="${not empty msgTrue}">
									<p style="color: green; font-weight: bold;">${msgTrue}</p>
								</c:if>
								<c:if test="${not empty msgfalse}">
									<p style="color: red; font-weight: bold;">${msgfalse}</p>
								</c:if>
								<c:if test="${not empty msgReview}">
									<p style="color: green; font-weight: bold;">${msgReview}</p>
								</c:if>

							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>

	<!-- Rating and Review Form Modal -->
	<div id="ratingFormContainer" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Give Rating and Review</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="ratingForm"
					action="<c:url value='/submitRatingAndReview' />" method="post">
					<div class="modal-body">
						<input type="hidden" id="movieId" name="movieId">
						<div class="form-group">
							<label for="rating">Rating (1-5):</label> <input type="number"
								class="form-control" id="rating" name="rating" min="1" max="5"
								required>
						</div>
						<div class="form-group">
							<label>Review:</label>
							<div>
								<input type="radio" id="reviewGood" name="review" value="Good"
									required> <label for="reviewGood">Good</label>
							</div>
							<div>
								<input type="radio" id="reviewNeutral" name="review"
									value="Neutral"> <label for="reviewNeutral">Neutral</label>
							</div>
							<div>
								<input type="radio" id="reviewBad" name="review" value="Bad">
								<label for="reviewBad">Bad</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<!-- Custom JS -->
	<script src="<c:url value='/resources/JS/rating.js' />"></script>


</body>
</html>

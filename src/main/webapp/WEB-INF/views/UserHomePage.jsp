<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Movie Recommendation System</title>
<link rel="stylesheet" href="resources/UserHomePage.css" />
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<!-- Custom CSS -->
   <style>
    /* Logout Modal Styles */
    .modal-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        background: rgba(0, 0, 0, 0.7);
        display: none;
        justify-content: center;
        align-items: center;
        z-index: 1000;
    }

    .modal-content {
        background: #fff;
        padding: 20px;
        text-align: center;
        border-radius: 10px;
        width: 90%;
        max-width: 400px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }

    .modal-content h4 {
        margin-bottom: 15px;
    }

    /* Center buttons */
    .modal-content .button-container {
        display: flex;
        justify-content: center;
        gap: 20px; /* Adds space between buttons */
        margin-top: 15px;
    }

    /* Button styles */
    .modal-content button {
        width: 120px;
        padding: 10px;
        border-radius: 5px;
        border: none;
        font-size: 16px;
        cursor: pointer;
    }

    .modal-content .btn-danger {
        background-color: #ff3333; /* Change to your desired color */
        color: white;
    }

    .modal-content .btn-secondary {
        background-color: #4CAF50; /* Change to your desired color */
        color: white;
    }

    /* Make the modal responsive */
    @media (min-width: 768px) {
        .modal-content {
            width: 50%;
        }
    }
</style>
   </head>
<body>
    <!-- Header Section -->
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
                    <li class="nav-item"><a class="nav-link" href="seereviewandrating">See Review</a></li>
                    <li class="nav-item"><a class="nav-link" href="watchedList">Watched Movies</a></li>

                    <!-- Profile Section -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-circle"></i> Profile
                        </a>
                        <div class="dropdown-menu" aria-labelledby="profileDropdown">
                            <a class="dropdown-item" href="viewprofileuser">View</a>
                            <a class="dropdown-item" href="updateUprofile">Update</a>
                            <a class="dropdown-item" href="#" id="logoutLink">Logout</a> <!-- Logout Link -->
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
<!-- Logout Confirmation Modal -->
<div id="logoutModal" class="modal-overlay">
    <div class="modal-content">
        <h4>Confirm Logout</h4>
        <p>Are you sure you want to log out?</p>
        <div class="button-container">
            <button id="confirmLogout" class="btn btn-danger">Yes, Log Out</button>
            <button id="cancelLogout" class="btn btn-secondary">Cancel</button>
        </div>
    </div>
</div>


   
	<!-- Carousel Section -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel" data-interval="3000">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/images/pathanposter.jpg"
					class="d-block w-100 img-fluid" alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Pathan</h5>
					
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/images/Beast.jpg"
					class="d-block w-100 img-fluid" alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Beauty and the Beast</h5>
					
				</div>
			</div>
			<div class="carousel-item">
				<img src="resources/images/bahubali.jpg"
					class="d-block w-100 img-fluid" alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>Bahubali 2</h5>
					
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>








	<div class="container-fluid mt-5">
		<h1 class="text-center mb-4">All Movies</h1>

		<!-- Movie Carousel -->
		<div id="movieCarousel" class="carousel slide"
			data-bs-interval="false">
			<div class="carousel-inner">
				<!-- Single Slide: Movies -->
				<div class="carousel-item active">
					<div class="d-flex flex-nowrap overflow-auto"
						style="overflow-y: hidden;">
						<!-- Loop through movies -->
						<c:forEach var="mov" items="${movielist}">
							<div class="movie-card col-6 col-md-3 mb-3 flex-shrink-0">
								<div class="card h-100" style="border-radius: 20px;">
								<a href="ShowMovietowatch?movieId=${mov.movieid}" >	<img
										src="<c:url value='/resources/images/${mov.moviename.toLowerCase().replaceAll(" ", "")}.jpg' />"
										class="movie-img card-img-top" alt="${mov.moviename} Image"
										style="border-radius: 20px;">   </a>
									<div class="card-body text-center">
										<h5 class="card-title">${mov.moviename}</h5>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- Carousel controls -->
			<a class="carousel-control-prev" href="#movieCarousel" role="button"
				data-bs-slide="prev"> <span class="carousel-control-prev-icon"
				aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
			</a> <a class="carousel-control-next" href="#movieCarousel" role="button"
				data-bs-slide="next"> <span class="carousel-control-next-icon"
				aria-hidden="true"></span> <span class="visually-hidden">Next</span>
			</a>
		</div>
	</div>




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
                                        <div>
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
                                        </div>
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
  






	<!-- About Section -->

	<section id="about" class="container mt-5 text-center">
		<h2 class="section-title">About Us</h2>
		<div class="about-content">
			<p class="about-text">
				<strong>Movie Recommendation System</strong> is a web application
				designed to provide personalized movie recommendations based on
				users' preferences and viewing history. The system features an
				intuitive user interface with a responsive design, making it
				accessible across various devices.
			</p>
			<p class="about-text">Users can browse, watch, rate, and review
				movies. The platform also includes an admin module for managing
				movie data and user information. Built with JSP, Servlets, and
				Spring MVC, the system ensures efficient database interactions using
				JDBC and MySQL.</p>
		</div>
	</section>


	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-3">
		<p>&copy; 2024 Movie Recommendation System. All rights reserved.</p>
	</footer>

	<!-- Bootstrap JS and dependencies -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	
		 <!-- Include jQuery, Popper.js, and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    
    <!-- Custom JavaScript for Logout Modal -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const logoutLink = document.getElementById("logoutLink");
            const logoutModal = document.getElementById("logoutModal");
            const confirmLogout = document.getElementById("confirmLogout");
            const cancelLogout = document.getElementById("cancelLogout");

            // Show the modal when the logout link is clicked
            logoutLink.addEventListener("click", function (event) {
                event.preventDefault(); // Prevent the default link action
                logoutModal.style.display = "flex"; // Show the modal
            });

            // Log the user out when they confirm
            confirmLogout.addEventListener("click", function () {
                window.location.href = "logout"; // Redirect to the logout URL
            });

            // Hide the modal when the cancel button is clicked
            cancelLogout.addEventListener("click", function () {
                logoutModal.style.display = "none"; // Hide the modal
            });

            // Close the modal if user clicks outside the modal content
            window.addEventListener("click", function (event) {
                if (event.target === logoutModal) {
                    logoutModal.style.display = "none"; // Hide the modal
                }
            });
        });
    </script>

		
</body>
</html>

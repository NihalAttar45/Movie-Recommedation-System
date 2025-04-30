package org.techhub.MRS.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.techhub.MRS.model.MovieModel;
import org.techhub.MRS.model.UserModel;
import org.techhub.MRS.service.MovieService;
import org.techhub.MRS.service.UserService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@Autowired
	MovieService movieservice;
	@Autowired
	UserService userservice;

	@RequestMapping(value = "/")
	public String usercheck(HttpServletResponse response) throws IOException {

		return ("index");
	}

	@RequestMapping(value = "logout")
	public String logout(HttpServletResponse response, HttpSession session) throws IOException {
		session.invalidate();
		return ("index");
	}

	@RequestMapping(value = "sign")
	public String signuppage() {
		return "signup";
	}

	@RequestMapping(value = "/User")
	public String UserPage(Map map, Map<String, Object> map1) {
		List<MovieModel> mlist = movieservice.getAllMovies();
		LinkedHashMap<String, Float> topMovies = movieservice.getTopFiveMovies();
		map.put("movielist", mlist);
		map1.put("topMovies", topMovies);
		return "UserHomePage";
	}

	@RequestMapping(value = "/Userlog")
	public String Userloginpage() {
		return "Userlogin";
	}

	@RequestMapping(value = "/Usave")
	public String checkuser(UserModel model, Map map, HttpSession session, Map<String, Object> map1) {
		boolean b = userservice.authenticateuser(model);
		if (b) {
			session.setAttribute("userdetails", model);
			List<MovieModel> mlist = movieservice.getAllMovies();
			LinkedHashMap<String, Float> topMovies = movieservice.getTopFiveMovies();
			map.put("movielist", mlist);
			map1.put("topMovies", topMovies);

			return "UserHomePage";
		} else {
			map.put("msg", "Login failed check usernmae and password if not signup then signup first");
			return "Userlogin";
		}

	}

	@RequestMapping(value = "/registeruser", method = RequestMethod.POST)
	public String registeruser(UserModel model, Map<String, Object> map) {
		try {
			boolean isRegistered = userservice.registerUser(model);
			if (isRegistered) {
				map.put("msgsuccess", "Register Successfully! Login now.");
				return "Userlogin";
			} else {
				map.put("msg", "Registration failed, please try again.");
				return "signup";
			}
		} catch (RuntimeException e) {
			if (e.getMessage().contains("Email or Contact already exists")) {
				map.put("msg", "Error: Email or Contact already registered.");
			} else {
				map.put("msg", "Registration failed: " + e.getMessage());
			}
			return "signup";
		}
	}

	@RequestMapping(value = "/showRegisteredUsers")
	public String getAllUser(UserModel model, Map<String, Object> map) {
		List<UserModel> ulist = userservice.getAllUsers();
		if (ulist != null && !ulist.isEmpty()) {
			map.put("userlist", ulist);
			return "showAllUsers";
		} else {
			map.put("msg", "Sorry, no users are present.");
			return "showAllUsers";
		}
	}

	@RequestMapping(value = "deleteuser")
	public String deletemoviebyid(@RequestParam("uid") Integer uid, Map map) {
		boolean b = userservice.isdeleteuserbyid(uid);
		List<UserModel> ulist = userservice.getAllUsers();
		map.put("userlist", ulist);
		return "showAllUsers";
	}

	// searchtowatchmovie

	@RequestMapping(value = "showmoviestouser")
	public String showAllMovietoUser(MovieModel model, Map<String, Object> map) {
		List<MovieModel> mlist = movieservice.getAllMovies();
		if (mlist != null && !mlist.isEmpty()) {
			map.put("movielist", mlist);
			return "ShowAllMovietoUser";
		} else {
			map.put("msg", "Sorry, no movies are present.");
			return "ShowAllMovietoUser";
		}

	}

	@RequestMapping(value = "showmoviestouserforwatch")
	public String showAllMoviesForWatch(Map<String, Object> map) {
		// Fetch all movies
		List<MovieModel> movieList = movieservice.getAllMovies();
		map.put("movieList", movieList);
		return "Searchmovietowatch"; // Ensure this maps to the correct JSP page
	}

	@RequestMapping(value = "/recommendedmov")
	public String recommendedTopMovies(Map<String, Object> map) {
		// Fetch the top five recommended movies
		LinkedHashMap<String, Float> topMovies = movieservice.getTopFiveMovies();
		System.out.println("Fetched Top Movies: " + topMovies);

		// Check if the movies list is not null or empty
		if (topMovies != null && !topMovies.isEmpty()) {
			map.put("topMovies", topMovies);
		} else {
			map.put("error", "There is no such data present.");
		}

		// Return the name of the view (recommendedmovies.jsp)
		return "recommendedmovies";
	}

	@RequestMapping(value = "watchmovieandassignmovie")
	public String watchMovieandassignmovie(@RequestParam("movieId") int movieId, RedirectAttributes redirectAttributes,
			HttpSession session) {
		UserModel user = (UserModel) session.getAttribute("userdetails");
		if (user != null) {
			String username = user.getUsername();
			String password = user.getPassword();
			int userid = userservice.getUserId(username, password);
			if (userid > 0) {
				user.setUser_id(userid);
				System.out.println(userid + " " + movieId);
				boolean isAssigned = userservice.assignmovietouser(userid, movieId);
				if (isAssigned) {
					redirectAttributes.addFlashAttribute("msgT", "Thank you for watching the movie.");
					System.out.println("Movie assigned successfully.");
				} else {
					redirectAttributes.addFlashAttribute("msgf", "You have already watched this movie.");
					System.out.println("Movie assignment failed: Already watched.");
				}
				return "redirect:/ShowMovietowatch?movieId=" + movieId;
			} else {
				redirectAttributes.addFlashAttribute("msgf", "User ID retrieval failed.");
				return "redirect:/ShowMovietowatch?movieId=" + movieId;
			}
		} else {
			return "redirect:/Userlogin";
		}
	}

	@RequestMapping(value = "ShowMovietowatch")
	public String showMovieimgetowatch(@RequestParam("movieId") Integer movieId, MovieModel model,
			Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		List<MovieModel> mlist = movieservice.getMovieById(movieId);
		map.put("movieList", mlist);
		System.out.println("Session ID: " + session.getId());

		return "watchMovie";
	}

	@RequestMapping(value = "ShowMovietowatchbyname")
	public String showMovieimgetowatch(@RequestParam("moviename") String moviename, MovieModel model,
			Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		List<MovieModel> mlist = movieservice.getMovieByName(moviename);
		map.put("movieList", mlist);
		System.out.println("Session ID: " + session.getId());

		return "watchMovie";
	}

	@RequestMapping(value = "/submitRatingAndReview", method = RequestMethod.POST)
	public String submitRatingAndReview(@RequestParam("movieId") int movieId, @RequestParam("rating") int rating,
			@RequestParam("review") String review, HttpSession session, RedirectAttributes redirectAttributes) {
		UserModel user = (UserModel) session.getAttribute("userdetails");

		if (user != null) {
			String username = user.getUsername();
			String password = user.getPassword();
			int userid = userservice.getUserId(username, password);
			boolean hasWatched = movieservice.ischeckMovieWatchBefore(userid, movieId);

			System.out.println(
					"Movie ID: " + movieId + " User ID: " + userid + " Rating: " + rating + " Review: " + review);
			System.out.println("Has watched before: " + hasWatched);

			if (hasWatched) {
				boolean isSuccessful = movieservice.submitRatingAndReview(movieId, userid, rating, review);

				if (isSuccessful) {
					redirectAttributes.addFlashAttribute("msgTrue", "Thank you for your rating and review!");
				} else {
					redirectAttributes.addFlashAttribute("msgfalse", "Failed to submit your review. Please try again.");
				}
			} else {
				redirectAttributes.addFlashAttribute("msgfalse", "Watch the movie before giving a rating and review.");
			}

			return "redirect:/ShowMovietowatch?movieId=" + movieId;
		} else {
			return "redirect:/Userlogin";
		}
	}

	@RequestMapping(value = "searchtowatchmovie")
	public String searchMovieToWatch(@RequestParam("query") String query, Map<String, Object> map) {
		// Fetch movies matching the search query
		List<MovieModel> movieList = movieservice.searchMoviesByName(query);
		map.put("movieList", movieList);
		return "Searchmovietowatch";
	}

	@RequestMapping(value = "updateUprofile")
	public String UpdateProfilePage(HttpSession session, Map<String, Object> map) {
		UserModel sessionUser = (UserModel) session.getAttribute("userdetails");

		if (sessionUser == null) {
			map.put("msg", "Please login first.");
			return "Userlogin";
		}

		// Assign username and password from session user correctly
		String username = sessionUser.getUsername();
		String password = sessionUser.getPassword();

		// Fetch latest user details using username and password
		UserModel latestUser = userservice.getUserdeatils(username, password);

		if (latestUser == null) {
			map.put("msg", "User not found.");
			return "index"; // You can redirect to an error page if needed
		}

		// Update the session with the latest user details
		session.setAttribute("userdetails", latestUser);

		// Send the latest user details to the update form
		map.put("userdetails", latestUser);
		return "updateProfile";
	}

	@RequestMapping(value = "updateuserprofile", method = RequestMethod.POST)
	public String updateUserProfile(UserModel user, HttpSession session, Map<String, Object> map) {
		UserModel sessionUser = (UserModel) session.getAttribute("userdetails");

		if (sessionUser == null) {
			map.put("msg", "Please login first.");
			return "Userlogin";
		}

		user.setUser_id(sessionUser.getUser_id());

		try {
			boolean isUpdated = userservice.updateUser(user);

			if (isUpdated) {
				map.put("msgT", "User updated successfully.");
				session.setAttribute("userdetails", user);
			} else {
				map.put("msgF", "Failed to update user.");
			}
		} catch (Exception e) {
			map.put("msgF", "An error occurred while updating the user.");
			e.printStackTrace();
		}

		return "updateProfile";
	}

	@RequestMapping(value = "viewprofileuser")
	public String viewUserProfile(UserModel model, Map<String, Object> map, HttpSession session) {
		// Check if user is logged in by looking for user details in session
		UserModel sessionUser = (UserModel) session.getAttribute("userdetails");
		if (sessionUser == null) {
			// If session is null, ask the user to login
			map.put("msg", "Please login first.");
			return "Userlogin";
		}
		// Get username and password from session user
		String username = sessionUser.getUsername();
		String password = sessionUser.getPassword();
		// Fetch the latest user details from the database using the service
		UserModel latestUser = userservice.getUserdeatils(username, password);

		// Check if the user exists
		if (latestUser == null) {
			map.put("msg", "User not found.");
			return "errorPage"; // You can redirect to an appropriate error page
		}

		map.put("user", latestUser);

		return "viewProfile";
	}

	@RequestMapping(value = "seereviewandrating")
	public String showreviewandrating(Map<String, Object> map) {
		List<MovieModel> mlist = movieservice.getAllMovies();
		map.put("movieList", mlist);
		return "seeReviewAndOverAllRating";
	}

	@RequestMapping("/movieReview")
	public String getMovieReview(@RequestParam("movieName") String movieName, Map<String, Object> map) {
		// Fetching overall rating from the service
		Map<String, Float> maplist = movieservice.getTopAllMovieswithRating();
		String reviewMessage = "Review not found"; // Default message if no review found

		if (maplist != null && maplist.containsKey(movieName)) {
			Float rating = maplist.get(movieName);
			if (rating > 3) {
				reviewMessage = "Movie was good with rating 😁: " + rating;
			} else if (rating == 3) {
				reviewMessage = "Movie was neutral with rating 😊: " + rating;
			} else {
				reviewMessage = "Movie was not good with rating 😒: " + rating;
			}
		} else {
			reviewMessage = "There is no such data present";
		}

		// Adding the review message to the model to display in the JSP page
		map.put("reviewMessage", reviewMessage);

		// Return the JSP view page "movieReview"
		return "seeReviewAndOverAllRating"; // This corresponds to movieReview.jsp
	}

	@RequestMapping("/showratingwithreview")
	public String getMovieReviewRating(@RequestParam("movieName") String movieName, Map<String, Object> map,
			RedirectAttributes redirectAttributes) {
		// Fetching overall rating from the service
		Map<String, Float> maplist = movieservice.getTopAllMovieswithRating();
		String reviewMessage = "Review not found"; // Default message if no review found

		if (maplist != null && maplist.containsKey(movieName)) {
			Float rating = maplist.get(movieName);
			if (rating > 3) {
				reviewMessage = "Movie was good with rating 😁: " + rating;
			} else if (rating == 3) {
				reviewMessage = "Movie was neutral with rating 😊: " + rating;
			} else {
				reviewMessage = "Movie was not good with rating 😒: " + rating;
			}
		} else {
			reviewMessage = "There is no such data present";
		}

		// Adding the review message to the redirect attributes
		redirectAttributes.addFlashAttribute("msgReview", reviewMessage);

		// Return the redirect URL to go back to the watchMovie page
		return "redirect:/ShowMovietowatchbyname?moviename=" + movieName;
	}

	@RequestMapping(value = "watchedList", method = RequestMethod.GET)
	public String UserWatchList(HttpSession session, Map<String, Object> map) {
		UserModel user = (UserModel) session.getAttribute("userdetails");
		if (user != null) {
			String username = user.getUsername();
			String password = user.getPassword();
			int userid = userservice.getUserId(username, password);
			if (userid > 0) {
				user.setUser_id(userid);
				List<MovieModel> mlist = movieservice.getAllWatchedMovies(userid);
				if (mlist != null && !mlist.isEmpty()) {
					map.put("movielist", mlist);
				} else {
					map.put("msg", "Sorry, no movies present in watch history.");
				}
			} else {
				return "redirect:/Userlogin";
			}
		} else {
			return "redirect:/Userlogin";
		}
		return "userWatchedMovies";
	}

	@RequestMapping(value = "searchbyNamefromuser")
	@ResponseBody
	public String searchByname(@RequestParam("n") String name) {
		// Fetch movies matching the search name
		List<MovieModel> mlist = movieservice.getAllMoviesbyName(name);
		StringBuilder str = new StringBuilder();
		str.append("<table>");
		str.append("<thead>");
		str.append("<tr>");
		str.append("<th>ID</th>");
		str.append("<th>Movie Name</th>");
		str.append("<th>Language</th>");
		str.append("<th>Actor</th>");
		str.append("<th>Year</th>");

		str.append("</tr>");
		str.append("</thead>");
		str.append("<tbody>");

		if (mlist != null && !mlist.isEmpty()) {
			for (MovieModel movie : mlist) {
				str.append("<tr>");
				str.append("<td>").append(movie.getMovieid()).append("</td>");
				str.append("<td>");
				str.append("<a href=\"ShowMovietowatch?movieId=").append(movie.getMovieid())
						.append("\" style=\"color: #dc3545;\">");
				str.append("<strong>").append(movie.getMoviename()).append("</strong>");
				str.append("</a>");
				str.append("</td>");
				str.append("<td>").append(movie.getMovielang()).append("</td>");
				str.append("<td>").append(movie.getMovieactor()).append("</td>");
				str.append("<td>").append(movie.getMovieyear()).append("</td>");
				str.append("</tr>");
			}

		} else {

			str.append("<tr><td colspan='5'>No movies found.</td></tr>");
		}
		str.append("</tbody>");
		str.append("</table>");
		return str.toString();
	}

	@RequestMapping(value = "/searchbyUserName")
	public void searchByName(String n, HttpServletResponse response) throws IOException {
		List<UserModel> users = userservice.searchUsersByName(n);
		if (users != null && !users.isEmpty()) {
			response.setContentType("text/html");
			StringBuilder sb = new StringBuilder();
			sb.append("<table>");
			sb.append("<thead>");
			sb.append("<tr>");
			sb.append("<th>ID</th>");
			sb.append("<th>User Name</th>");
			sb.append("<th>Email</th>");
			sb.append("<th>Contact</th>");
			sb.append("<th>Delete</th>");
			sb.append("</tr>");
			sb.append("</thead>");
			sb.append("<tbody>");

			for (UserModel user : users) {
				sb.append("<tr>");
				sb.append("<td>").append(user.getUser_id()).append("</td>");
				sb.append("<td>").append(user.getUsername()).append("</td>");
				sb.append("<td>").append(user.getEmail()).append("</td>");
				sb.append("<td>").append(user.getContact()).append("</td>");
				sb.append("<td><a href='deleteuser?uid=").append(user.getUser_id())
						.append("' style='text-decoration: none;'>DELETE</a></td>");
				sb.append("</tr>");
			}

			sb.append("</tbody>");
			sb.append("</table>");

			response.getWriter().write(sb.toString());
		} else {
			response.getWriter().write("No users found.");
		}
	}

}

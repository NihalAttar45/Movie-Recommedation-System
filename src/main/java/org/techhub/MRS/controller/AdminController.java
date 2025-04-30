package org.techhub.MRS.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.techhub.MRS.model.AdminModel;
import org.techhub.MRS.model.MovieModel;
import org.techhub.MRS.service.AdminService;
import org.techhub.MRS.service.MovieService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	MovieService movieservice;
	@Autowired
	AdminService adminservice;

	@RequestMapping(value = "Adminlog")
	public String Adminloginpage() {

		return "Adminlogin";
	}

	@RequestMapping(value = "Alogout")
	public String Adminlogout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "/Asave")
	public String checkAdmin(AdminModel amodel, Map<String, Object> map, HttpSession session) {
		int adminid = adminservice.authenticateadmin(amodel);
		if (adminid != -1) {

			session.setAttribute("adminid", adminid);
			return "AdminHomePage";
		} else {
			map.put("msg", "Login failed, check username and password");
			return "Adminlogin";
		}
	}

	@RequestMapping(value = "addmovie")
	public String savemoviedata(HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		return "addMovie";
	}

//	@RequestMapping(value = "savemovieuploadimg")
//	public String AddNewMovieAndCategory(MovieModel model, @RequestParam("movieposter") MultipartFile movieposter,
//			HttpSession session, Map<String, Object> map) {
//		if (session.getAttribute("adminid") == null) {
//			map.put("msg", "Please login first.");
//			return "Adminlogin";
//		}
//
//		// Handle file upload
//		if (movieposter.isEmpty()) {
//			map.put("msgF", "Please upload a movie poster.");
//			return "addMovie";
//		}
//
//		try {
//			// Define path to save the image
//			String uploadDir = "C:\\Users\\User\\eclipse-TEST\\MRS\\src\\main\\webapp\\resources\\images\\";
//			System.out.println("Upload Directory: " + uploadDir);
//
//			File uploadDirFile = new File(uploadDir);
//			if (!uploadDirFile.exists()) {
//				uploadDirFile.mkdirs();
//			}
//
//			// Save the image file
//			String fileName = movieposter.getOriginalFilename();
//			String filePath = uploadDir + fileName;
//			File file = new File(filePath);
//			if (file.exists()) {
//				map.put("msgF", "File with the same name already exists.");
//				return "addMovie";
//			}
//			movieposter.transferTo(file);
//
//			// Set the poster path in the movie model
//			model.setPosterPath(
//					"C:\\Users\\User\\eclipse-TEST\\MRS\\src\\main\\webapp\\resources\\images\\" + fileName);
//
//		} catch (IOException e) {
//			e.printStackTrace();
//			map.put("msgF", "Failed to upload movie poster.");
//			return "addMovie";
//		}
//
//		// Save the movie details in the database
//		boolean isMovieAdded = adminservice.isAddNewMovieAndCategory(model);
//		if (isMovieAdded) {
//			map.put("msgT", "Movie added successfully.");
//			return "addMovie";
//		} else {
//			map.put("msgF", "Movie not added, already present.");
//			return "addMovie";
//		}
//	}
	
	@RequestMapping(value = "savemovieuploadimg")
	public String AddNewMovieAndCategory(MovieModel model, @RequestParam("movieposter") MultipartFile movieposter, HttpSession session, Map<String, Object> map,HttpSession httpSession) {
	    if (session.getAttribute("adminid") == null) {
	        map.put("msg", "Please login first.");
	        return "Adminlogin";
	    }

	    // Handle file upload
	    if (movieposter.isEmpty()) {
	        map.put("msgF", "Please upload a movie poster.");
	        return "addMovie";
	    }

	    try {
	        // Define path to save the image
	    	
	    	ServletContext context = httpSession.getServletContext();
	    	   String uploadDir = context.getRealPath("/");
	    	   
	    	   
	    	   
	       uploadDir += "resources\\images\\";
	        System.out.println("Upload Directory: " + uploadDir);

	        File uploadDirFile = new File(uploadDir);
	        if (!uploadDirFile.exists()) {
	            uploadDirFile.mkdirs();
	        }
	        
	       
	        // Save the image file
	        String fileName = movieposter.getOriginalFilename();
	        String filePath = uploadDir+ fileName;
//	        moviePoster.transferTo(file);
	        File file = new File(filePath);
	        if (file.exists()) {
	            map.put("msgF", "File with the same name already exists.");
	            return "addMovie";
	        }
	        movieposter.transferTo(file);

	        // Set the poster path in the movie model
	        model.setPosterPath(filePath);

	    } catch (IOException e) {
	        e.printStackTrace();
	        map.put("msgF", "Failed to upload movie poster.");
	        return "addMovie";
	    }

	    // Save the movie details in the database
	    boolean isMovieAdded = adminservice.isAddNewMovieAndCategory(model);
	    if (isMovieAdded) {
	        map.put("msgT", "Movie added successfully.");
	        return "addMovie";
	    } else {
	        map.put("msgF", "Movie not added, already present.");
	        return "addMovie";
	    }
	}


	@RequestMapping(value = "viewprofileadmin", method = RequestMethod.GET)
	public String viewAdminProfile(HttpSession session, Map<String, Object> map) {
		int aid = (Integer) session.getAttribute("adminid");

		AdminModel latestAdmin = adminservice.getAdminDetails(aid);
		map.put("admin", latestAdmin);

		return "viewprofileAdmin";
	}

	@RequestMapping(value = "showmovie")
	public String ShowAllMovies(MovieModel model, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		List<MovieModel> mlist = movieservice.getAllMovies();
		if (mlist != null && !mlist.isEmpty()) {
			map.put("movielist", mlist);
			return "showAllMovies";
		} else {
			map.put("msg", "Sorry, no movies are present.");
			return "showAllMovies";
		}
	}

	@RequestMapping(value = "deletemov")
	public String deletemoviebyid(@RequestParam("movid") Integer movid, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		adminservice.isdeletemoviebyid(movid);
		List<MovieModel> mlist = movieservice.getAllMovies();
		map.put("movielist", mlist);
		return "showAllMovies";
	}

	@RequestMapping(value = "updatemov")
	public String updateMovieForm(@RequestParam("movid") Integer movid, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		MovieModel movie = adminservice.getMovieById(movid);
		map.put("movie", movie);
		return "updateMovie";
	}

	@RequestMapping(value = "updatemoviebyid")
	public String updateMovieById(MovieModel movie, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		boolean b = adminservice.updateMovieById(movie);
		List<MovieModel> mlist = movieservice.getAllMovies();
		map.put("movielist", mlist);
		map.put("msg", "Movie updated successfully.");
		return "showAllMovies";
	}

	@RequestMapping(value = "AddnewAdmin")
	public String addnewAdminpage(HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		return "AddAdmin";
	}

	@RequestMapping(value = "AllAdmin")
	public String showalladmin(AdminModel model, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		List<AdminModel> Alist = adminservice.getAllAdmin();
		if (Alist != null && !Alist.isEmpty()) {
			map.put("adminlist", Alist);
			return "ShowAllAdmins";
		} else {
			map.put("msg", "Sorry, no movies are present.");
			return "ShowAllAdmins";
		}

	}

	@RequestMapping(value = "deleteadmin")
	public String deleteadminbyid(@RequestParam("adid") Integer adid, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		adminservice.isdeleteAdminbyid(adid);
		List<AdminModel> Alist = adminservice.getAllAdmin();
		if (Alist != null && !Alist.isEmpty()) {
			map.put("adminlist", Alist);
			return "ShowAllAdmins";
		} else {
			map.put("msg", "Sorry, no movies are present.");
			return "ShowAllAdmins";
		}
	}

	@RequestMapping(value = "addadmin")
	public String AddnewAdmin(AdminModel model, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		boolean b = adminservice.isAddNewAdmin(model);
		if (b) {
			map.put("msgT", "Admin added successfully.");
			return "AddAdmin";
		} else {
			map.put("msgF", "Admin not added, already present.");
			return "AddAdmin";
		}
	}

	@RequestMapping(value = "updateadmin")
	public String updateAdminForm(@RequestParam("adid") Integer adid, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		AdminModel admin = adminservice.getAdminById(adid);
		map.put("admin", admin);
		return "updateAdmin";
	}

	@RequestMapping(value = "updateAdminbyid")
	public String updateAdminById(AdminModel model, HttpSession session, Map<String, Object> map) {
		if (session.getAttribute("adminid") == null) {
			map.put("msg", "Please login first.");
			return "Adminlogin";
		}
		boolean b = adminservice.updateAdminById(model);

		List<AdminModel> Alist = adminservice.getAllAdmin();
		if (Alist != null && !Alist.isEmpty()) {
			map.put("adminlist", Alist);
			return "ShowAllAdmins";
		} else {
			map.put("msg", "Sorry, no movies are present.");
			return "ShowAllAdmins";
		}
	}

	@RequestMapping(value = "showOverallRatingtoadmin")
	public String showAllMovieWithOverAllRating(Map<String, Object> map) {
		LinkedHashMap<String, Float> topMovies = movieservice.getTopAllMovieswithRating();
		if (topMovies != null && !topMovies.isEmpty()) {
			map.put("topMovies", topMovies);

		} else {
			map.put("error", "There is no such data present.");
		}
		return "OverAllRatingAllmoviesadmin";
	}

	@RequestMapping(value = "showUserWiseMovies")
	public String showUserWiseMovies(Map<String, Object> map) {
		LinkedHashMap<Integer, ArrayList<String>> map1 = movieservice.getUserWiseMovieName();
		map.put("userMovies", map1);
		return "showUserWiseMovie";
	}

	@RequestMapping(value = "searchAdminbyname")
	@ResponseBody
	public String searchAdminByname(@RequestParam("n") String name, HttpSession session) {
		if (session.getAttribute("adminid") == null) {
			// It's better to return some form of indication that the user needs to be
			// logged in
			// You can redirect to login page if required, or return a specific error
			// message
			return "<p>Please log in to perform this action.</p>";
		}

		List<AdminModel> alist = adminservice.getAllAdminbyName(name);
		StringBuilder str = new StringBuilder();
		str.append("<table>");
		str.append("<thead>");
		str.append("<tr>");
		str.append("<th>ID</th>");
		str.append("<th>Admin Name</th>");
		str.append("<th>Email</th>");
		str.append("<th>Contact</th>");
		str.append("<th>Delete</th>");
		str.append("<th>Update</th>");
		str.append("</tr>");
		str.append("</thead>");
		str.append("<tbody>");

		if (alist != null && !alist.isEmpty()) {
			for (AdminModel admins : alist) {
				str.append("<tr>");
				str.append("<td>").append(admins.getAid()).append("</td>");
				str.append("<td>").append(admins.getAdminusername()).append("</td>");
				str.append("<td>").append(admins.getAdminemail()).append("</td>");
				str.append("<td>").append(admins.getAdmincontact()).append("</td>");
				str.append("<td><a href='deleteadmin?adid=").append(admins.getAid())
						.append("' style='text-decoration: none;'>Delete</a></td>");
				str.append("<td><a href='updateadmin?adid=").append(admins.getAid())
						.append("' style='text-decoration: none;'>Update</a></td>");
				str.append("</tr>");
			}
		} else {
			str.append("<tr><td colspan='6'>No admins found.</td></tr>");
		}

		str.append("</tbody>");
		str.append("</table>");

		return str.toString();
	}

	@RequestMapping(value = "searchbyName")
	@ResponseBody
	public String searchByname(@RequestParam("n") String name, HttpSession session) {
		if (session.getAttribute("adminid") == null) {
			return "<p>Please log in to perform this action.</p>";
		}
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
		str.append("<th>Delete</th>");
		str.append("<th>Update</th>");
		str.append("</tr>");
		str.append("</thead>");
		str.append("<tbody>");

		if (mlist != null && !mlist.isEmpty()) {
			for (MovieModel movie : mlist) {
				str.append("<tr>");
				str.append("<td>").append(movie.getMovieid()).append("</td>");
				str.append("<td>").append(movie.getMoviename()).append("</td>");
				str.append("<td>").append(movie.getMovielang()).append("</td>");
				str.append("<td>").append(movie.getMovieactor()).append("</td>");
				str.append("<td>").append(movie.getMovieyear()).append("</td>");
				str.append("<td><a href='deletemov?movid=").append(movie.getMovieid())
						.append("' style='text-decoration: none;'>delete</a></td>");
				str.append("<td><a href='updatemov?movid=").append(movie.getMovieid())
						.append("' style='text-decoration: none;'>update</a></td>");
				str.append("</tr>");
			}
		} else {
			str.append("<tr><td colspan='7'>No movies found.</td></tr>");
		}

		str.append("</tbody>");
		str.append("</table>");

		return str.toString();
	}
}

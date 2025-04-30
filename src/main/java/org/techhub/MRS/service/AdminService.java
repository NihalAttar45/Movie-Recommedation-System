package org.techhub.MRS.service;


import java.util.*;
import org.techhub.MRS.model.AdminModel;
import org.techhub.MRS.model.MovieModel;

public interface AdminService {
    public int authenticateadmin(AdminModel amodel);

	public boolean isAddNewMovieAndCategory(MovieModel model);


	public boolean isdeletemoviebyid(int movid);
	
//	public List<MovieModel> getAllMoviesbyName(String name);



	public MovieModel getMovieById(Integer movid);

	public boolean updateMovieById(MovieModel movie);

	public boolean isAddNewAdmin(AdminModel model);

	public List<AdminModel> getAllAdmin();

	public List<AdminModel> getAllAdminbyName(String name);

	public void isdeleteAdminbyid(Integer adid);

	public AdminModel getAdminById(Integer adid);

	public boolean updateAdminById(AdminModel model);

	public AdminModel getAdminDetails(int aid);
}

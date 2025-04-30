package org.techhub.MRS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.MRS.model.AdminModel;
import org.techhub.MRS.model.MovieModel;
import org.techhub.MRS.repository.AdminRepository;
@Service("adminservice")
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminRepository adminrepo;
	@Override
	public int authenticateadmin(AdminModel amodel) {
		// TODO Auto-generated method stub
		return adminrepo.authenticateadmin(amodel);
	}
	@Override
	public boolean isAddNewMovieAndCategory(MovieModel model) {
		// TODO Auto-generated method stub
		return adminrepo.isAddNewMovieAndCategory(model);
	}

	@Override
	public boolean isdeletemoviebyid(int movid) {
		// TODO Auto-generated method stub
		return adminrepo.isdeletemoviebyid(movid);
	}

	
	@Override
	public MovieModel getMovieById(Integer movid) {
		// TODO Auto-generated method stub
		return adminrepo.getMovieById(movid);
	}
	@Override
	public boolean updateMovieById(MovieModel movie) {
		return adminrepo.updateMovieById(movie);
		
		
	}
	@Override
	public boolean isAddNewAdmin(AdminModel model) {
		// TODO Auto-generated method stub
		return adminrepo.isAddNewAdmin(model);
	}
	@Override
	public List<AdminModel> getAllAdmin() {
		// TODO Auto-generated method stub
		return adminrepo.getAllAdmin();
	}
	@Override
	public List<AdminModel> getAllAdminbyName(String name) {
		// TODO Auto-generated method stub
		return adminrepo.getAllAdminbyName(name);
	}
	@Override
	public void isdeleteAdminbyid(Integer adid) {
		  adminrepo.isdeleteAdminbyid(adid);
		
	}
	@Override
	public AdminModel getAdminById(Integer adid) {
		// TODO Auto-generated method stub
		return adminrepo.getAdminById(adid);
	}
	@Override
	public boolean updateAdminById(AdminModel model) {
		// TODO Auto-generated method stub
		return adminrepo.updateAdminById(model);
	}
	@Override
	public AdminModel getAdminDetails(int aid) {
		// TODO Auto-generated method stub
		return adminrepo.getAdminDetails(aid);
	}

}

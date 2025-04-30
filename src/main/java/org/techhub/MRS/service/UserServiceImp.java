package org.techhub.MRS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.MRS.model.AdminModel;
import org.techhub.MRS.model.UserModel;
import org.techhub.MRS.repository.UserRepository;
@Service("userservice")
public class UserServiceImp implements UserService{
      @Autowired
      UserRepository userrepo;
	@Override
	public boolean authenticateuser(UserModel model) {
		// TODO Auto-generated method stub
		return userrepo.authenticateuser(model);
	}
	@Override
	public boolean registerUser(UserModel model) {
		// TODO Auto-generated method stub
		return userrepo.registerUser(model);
	}
	@Override
	public List<UserModel> getAllUsers() {
		// TODO Auto-generated method stub
		return userrepo.getAllUsers();
	}
	@Override
	public List<UserModel> searchUsersByName(String n) {
		// TODO Auto-generated method stub
		return userrepo.searchUsersByName(n);
	}
	@Override
	public boolean isdeleteuserbyid(Integer uid) {
		// TODO Auto-generated method stub
		return userrepo.isdeleteuserbyid(uid);
	}
	@Override
	public int getUserId(String username, String password) {
		// TODO Auto-generated method stub
		return userrepo.getUserId(username,password);
	}
	@Override
	public boolean assignmovietouser(int userid, int movieId) {
		// TODO Auto-generated method stub
		return userrepo.assignmovietouser(userid,movieId);
	}
	@Override
	public boolean updateUser(UserModel user) {
		// TODO Auto-generated method stub
		return userrepo.updateUser(user);
	}
	@Override
	public UserModel getUserdeatils(String username, String password) {
		// TODO Auto-generated method stub
		return userrepo.getUserdeatils(username,password);
	}

	
	
	
         
}

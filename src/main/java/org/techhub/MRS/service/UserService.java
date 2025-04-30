package org.techhub.MRS.service;

import java.util.List;

import org.techhub.MRS.model.AdminModel;
import org.techhub.MRS.model.UserModel;

public interface UserService {
      public boolean authenticateuser(UserModel model);
      public boolean registerUser(UserModel model);
	public List<UserModel> getAllUsers();
	public List<UserModel> searchUsersByName(String n);
	public boolean isdeleteuserbyid(Integer uid);
	public int getUserId(String username, String password);
	public boolean assignmovietouser(int userid, int movieId);
	public boolean updateUser(UserModel user);
	public UserModel getUserdeatils(String username, String password);
	

}

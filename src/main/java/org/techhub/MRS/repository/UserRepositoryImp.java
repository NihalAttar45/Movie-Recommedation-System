package org.techhub.MRS.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.MRS.model.AdminModel;
import org.techhub.MRS.model.MovieModel;
import org.techhub.MRS.model.UserModel;
@Repository("userrepo")
public class UserRepositoryImp implements UserRepository{
    @Autowired
    JdbcTemplate template;
	@Override
	public boolean authenticateuser(UserModel model) {
           if(model.getUsername()!=null && model.getPassword()!=null) {
        	   String sql = "SELECT COUNT(*) FROM usermaster WHERE username = ? AND password = ?";
               int count = template.queryForObject(sql, new Object[]{model.getUsername(), model.getPassword()}, Integer.class);
              return count>0?true:false;
           }else {
        		return false;  
           }
	
	}
	
//	@Override
//	public boolean registerUser(final UserModel model) {
//		
//	
//		String sql="insert into usermaster values('0',?,?,?,?)";
//		int value =template.update(sql,new PreparedStatementSetter(){
//
//			@Override
//			public void setValues(PreparedStatement ps)throws SQLException {
//			    ps.setString(1,model.getUsername());
//			    ps.setString(2,model.getPassword());
//			    ps.setString(3,model.getEmail());
//			    ps.setString(4,model.getContact());
//			}
//		});
//		return value>0?true:false;
//
//	}
	
	@Override
	public boolean registerUser(final UserModel model) {
	    String sql = "insert into usermaster values('0',?,?,?,?)";
	    try {
	        int value = template.update(sql, new PreparedStatementSetter() {
	            @Override
	            public void setValues(PreparedStatement ps) throws SQLException {
	                ps.setString(1, model.getUsername().trim());
	                ps.setString(2, model.getPassword().trim());
	                ps.setString(3, model.getEmail().trim());
	                ps.setString(4, model.getContact().trim());
	            }
	        });
	        return value > 0;
	    } catch (DuplicateKeyException e) {
	        // Handle duplicate key exception (like email or contact)
	        throw new RuntimeException("Email or Contact already exists", e);
	    } catch (DataIntegrityViolationException e) {
	        // Handle other data integrity violations
	        throw new RuntimeException("Database error occurred", e);
	    }
	}

	
	
	
	@Override
	public List<UserModel> getAllUsers() {
		String sql = "SELECT  *FROM usermaster";
		List<UserModel> users = template.query(sql, new RowMapper<UserModel>() {
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel user = new UserModel();
				user.setUser_id(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setContact(rs.getString(5));
				return user;
			}
		});
		return users;
	}
	@Override
	public List<UserModel> searchUsersByName(String name) {
		String sql = "SELECT * FROM usermaster WHERE username LIKE ?";
		List<UserModel> users = template.query(sql, new Object[] { "%" + name + "%" }, new RowMapper<UserModel>() {
			@Override
			public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				UserModel user = new UserModel();
				user.setUser_id(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setContact(rs.getString(5));
				return user;
			}
		});
		return users;
	}
	@Override
	public boolean isdeleteuserbyid(Integer uid) {
		String sql = "DELETE FROM usermaster WHERE user_id = ?";
		int rowsAffected = template.update(sql, uid);
		return rowsAffected > 0;
	}
	
	@Override
	public int getUserId(String username, String password) {
	    String sql = "SELECT user_id FROM usermaster WHERE username = ? AND password = ?";
	    
	    try {
	        Integer userId = template.queryForObject(sql, new Object[]{username, password}, Integer.class);
	        return userId != null ? userId : 0; 
	    } catch (Exception e) {
	        
	        e.printStackTrace();
	        return 0; 
	    }
	}
	@Override
	public boolean assignmovietouser(final int userid, final int movieId) {
	  
	    String checkSql = "SELECT COUNT(*) FROM movieuserjoin WHERE mov_id = ? AND user_id = ?";
	    int count = template.queryForObject(checkSql, new Object[]{movieId, userid}, Integer.class);
	    
	    if (count > 0) {
	       
	        return false;
	    }
	    
	    // Proceed to assign the movie if not already assigned
	    String sql = "INSERT INTO movieuserjoin (mov_id, user_id) VALUES (?, ?)";
	    int value = template.update(sql, new PreparedStatementSetter() {
	        @Override
	        public void setValues(PreparedStatement ps) throws SQLException {
	            ps.setInt(1, movieId);
	            ps.setInt(2, userid);
	        }
	    });
	    return value > 0;
	}
	
	
	@Override
	public boolean updateUser(UserModel user) {
	    String sql = "UPDATE usermaster SET username = ?, password = ?, email = ?, contact = ? WHERE user_id = ?";
	    
	    try {
	        int result = template.update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getContact(), user.getUser_id());
	        return result > 0;  // Return true if at least one row was updated
	    } catch (Exception e) {
	        e.printStackTrace();  // Log the exception
	        return false;  // Return false if an error occurred
	    }
	}
	
	
	@Override
	public UserModel getUserdeatils(String username, String password) {
		  String sql = "SELECT user_id, username, password, email, contact FROM usermaster WHERE username = ? AND password = ?";
		    
		    try {
		        return template.queryForObject(sql, new Object[]{username, password}, new RowMapper<UserModel>() {
		            @Override
		            public UserModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		                UserModel user = new UserModel();
		                user.setUser_id(rs.getInt("user_id"));
		                user.setUsername(rs.getString("username"));
		                user.setPassword(rs.getString("password"));
		                user.setEmail(rs.getString("email"));
		                user.setContact(rs.getString("contact"));
		                return user;
		            }
		        });
		    } catch (Exception e) {
		        e.printStackTrace();  // Log the exception for debugging
		        return null;  // Return null if no user is found or an error occurs
		    }
	}
	



       
}

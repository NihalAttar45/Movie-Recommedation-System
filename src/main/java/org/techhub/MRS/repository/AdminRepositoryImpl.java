package org.techhub.MRS.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.MRS.model.AdminModel;
import org.techhub.MRS.model.MovieModel;

@Repository("adminrepo")
public class AdminRepositoryImpl implements AdminRepository {
	@Autowired
	JdbcTemplate template;

	@Override
	public int authenticateadmin(AdminModel amodel) {
	    if (amodel.getAdminusername() != null && amodel.getAdminpassword() != null) {
	        String sql = "SELECT aid FROM checkadmin WHERE adminusername = ? AND adminpassword = ?";
	        
	        try {
	        
	            Integer adminId = template.queryForObject(sql, new Object[] {
	                amodel.getAdminusername(), amodel.getAdminpassword()
	            }, Integer.class);
	            
	          
	            return adminId != null ? adminId : -1;
	        } catch (EmptyResultDataAccessException e) {
	         
	            return -1;
	        }
	    } else {
	        return -1;
	    }
	}


	@Override
	public boolean isAddNewMovieAndCategory(final MovieModel model) {
		String checkQuery = "SELECT COUNT(*) FROM moviemaster WHERE mov_name = ?";
		int count = template.queryForObject(checkQuery, new Object[] { model.getMoviename() }, Integer.class);
		if (count == 0) {
			String sql = "insert into moviemaster values('0',?,?,?,?)";
			int value = template.update(sql, new PreparedStatementSetter() {

				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, model.getMoviename().trim());
					ps.setString(2, model.getMovielang().trim());
					ps.setString(3, model.getMovieactor().trim());
					ps.setInt(4, model.getMovieyear());

				}
			});
			return value > 0 ? true : false;
		} else {
			return false;
		}

	}



	@Override
	public boolean isdeletemoviebyid(int movid) {
		String sql = "DELETE FROM moviemaster WHERE mov_id = ?";
		int rowsAffected = template.update(sql, movid);
		return rowsAffected > 0;
	}


	@Override
	public MovieModel getMovieById(Integer movid) {
		String sql = "SELECT * FROM moviemaster WHERE mov_id = ?";
		return template.queryForObject(sql, new Object[] { movid }, new RowMapper<MovieModel>() {
			@Override
			public MovieModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				MovieModel movie = new MovieModel();
				movie.setMovieid(rs.getInt("mov_id"));
				movie.setMoviename(rs.getString("mov_name"));
				movie.setMovielang(rs.getString("mov_lang"));
				movie.setMovieactor(rs.getString("mov_actor"));
				movie.setMovieyear(rs.getInt("mov_year"));
				return movie;
			}
		});
	}

	@Override
	public boolean updateMovieById(MovieModel movie) {
		String sql = "UPDATE moviemaster SET mov_name = ?, mov_lang = ?, mov_actor = ?, mov_year = ? WHERE mov_id = ?";
		int rowsAffected = template.update(sql, movie.getMoviename(), movie.getMovielang(), movie.getMovieactor(),
				movie.getMovieyear(), movie.getMovieid());
		return rowsAffected > 0;
	}

	@Override
	public boolean isAddNewAdmin(final AdminModel model) {
		String checkQuery = "SELECT COUNT(*) FROM checkadmin WHERE adminusername = ?";
		int count = template.queryForObject(checkQuery, new Object[] { model.getAdminusername() }, Integer.class);
		if (count == 0) {
			String sql = "insert into checkadmin values('0',?,?,?,?)";
			int value = template.update(sql, new PreparedStatementSetter() {

				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
				    ps.setString(1, model.getAdminusername().trim());
	                ps.setString(2, model.getAdminpassword().trim());
	                ps.setString(3, model.getAdminemail().trim());
	                ps.setString(4, model.getAdmincontact().trim());
				}
			});
			return value > 0 ? true : false;
		} else {
			return false;
		}
	}


	@Override
	public List<AdminModel> getAllAdmin() {
		String sql="select *from checkadmin";
		List<AdminModel> list=template.query(sql, new RowMapper<AdminModel>() {

			@Override
			public AdminModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				AdminModel model=new AdminModel();
				model.setAid(rs.getInt(1));
				model.setAdminusername(rs.getString(2));
				model.setAdminpassword(rs.getString(3));
				model.setAdminemail(rs.getString(4));
				model.setAdmincontact(rs.getString(5));

				return model;
			}
		});
	return list;
	}


	public List<AdminModel> getAllAdminbyName(String name) {
	    String sql = "SELECT * FROM checkadmin WHERE adminusername LIKE ?";
	    
	    List<AdminModel> adminlist = template.query(sql, new Object[] { "%" + name + "%" }, new RowMapper<AdminModel>() {
	        @Override
	        public AdminModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	            AdminModel model = new AdminModel();
	            model.setAid(rs.getInt("aid")); // Use column names
	            model.setAdminusername(rs.getString("adminusername"));
	            model.setAdminpassword(rs.getString("adminpassword"));
	            model.setAdminemail(rs.getString("adminemail"));
	            model.setAdmincontact(rs.getString("admincontact"));
	            return model;
	        }
	    });
	    
	    return adminlist;
	}


	@Override
	public void isdeleteAdminbyid(Integer adid) {
		
		String sql = "DELETE FROM checkadmin WHERE aid = ?";
		 template.update(sql, adid);
		
	}


	@Override
	public AdminModel getAdminById(Integer adid) {
		String sql = "SELECT * FROM checkadmin WHERE aid = ?";
		return template.queryForObject(sql, new Object[] { adid }, new RowMapper<AdminModel>() {
			@Override
			public AdminModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				AdminModel admin = new AdminModel();
				admin.setAid(rs.getInt("aid"));
				admin.setAdminusername(rs.getString("adminusername"));
				admin.setAdminpassword(rs.getString("adminpassword"));
				admin.setAdminemail(rs.getString("adminemail"));
				admin.setAdmincontact(rs.getString("admincontact"));
				return admin;
			}
		});
	}


	@Override
	public boolean updateAdminById(AdminModel model) {
		String sql = "UPDATE checkadmin SET adminusername = ?, adminpassword = ?, adminemail = ?, admincontact = ? WHERE aid = ?";
		int rowsAffected = template.update(sql, model.getAdminusername(), model.getAdminpassword(), model.getAdminemail(),
				model.getAdmincontact(), model.getAid());
		return rowsAffected > 0;
	}

	@Override
	public AdminModel getAdminDetails(int aid) {
	    String sql = "SELECT aid, adminusername, adminpassword, adminemail, admincontact FROM checkadmin WHERE aid=?";
	    
	    return template.queryForObject(sql, new Object[]{aid}, new RowMapper<AdminModel>() {
	        @Override
	        public AdminModel mapRow(ResultSet rs, int rowNum) throws SQLException {
	            AdminModel admin = new AdminModel();
	            admin.setAid(rs.getInt("aid"));
	            admin.setAdminusername(rs.getString("adminusername"));
	            admin.setAdminpassword(rs.getString("adminpassword"));
	            admin.setAdminemail(rs.getString("adminemail"));
	            admin.setAdmincontact(rs.getString("admincontact"));
	            return admin;
	        }
	    });
	}


}

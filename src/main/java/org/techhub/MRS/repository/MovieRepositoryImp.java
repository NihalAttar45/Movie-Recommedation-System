package org.techhub.MRS.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.techhub.MRS.model.MovieModel;

@Repository("movierepo")
public class MovieRepositoryImp implements MovieRepository{
	@Autowired
    JdbcTemplate template;
	@Override
	public List<MovieModel> getAllMovies() {
		String sql = "SELECT  *FROM moviemaster";
		List<MovieModel> movies = template.query(sql, new RowMapper<MovieModel>() {
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
		return movies;
	}
	
	@Override
	public List<MovieModel> getAllMoviesbyName(String name) {
		String sql = "SELECT * FROM moviemaster WHERE mov_name LIKE ?";
		List<MovieModel> movies = template.query(sql, new Object[] { "%" + name + "%" }, new RowMapper<MovieModel>() {
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
		return movies;
	}

	@Override
	public List<MovieModel> getMovieById(Integer movieId) {
		String sql = "SELECT * FROM moviemaster WHERE mov_Id = ?";
		List<MovieModel> movies = template.query(sql, new Object[] {   movieId }, new RowMapper<MovieModel>() {
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
		return movies;
	}

	@Override
	public boolean submitRatingAndReview(final int movieId, final int userid, final int rating, final String review) {
	    String sql = "CALL saveratingreview(?, ?, ?, ?)";
	    
	    int rowsAffected = template.update(sql, new PreparedStatementSetter() {
		    @Override
		    public void setValues(PreparedStatement ps) throws SQLException {
		        ps.setInt(1, rating);    // Set the rating parameter
		        ps.setString(2, review); // Set the review parameter
		        ps.setInt(3, userid);    // Set the userid parameter
		        ps.setInt(4, movieId);   // Set the movieId parameter
		    }
		});
		
		// Check if rows were affected
		return rowsAffected > 0;
	}

	@Override
	public boolean ischeckMovieWatchBefore(int userid, int movieId) {
		 String sql = "SELECT COUNT(*) FROM movieuserjoin WHERE user_id = ? AND mov_id = ?";
	        int count = template.queryForObject(sql, new Object[]{userid, movieId}, Integer.class);
	        return count > 0;
	}

	@Override
	public LinkedHashMap<String, Float> getOverallRatings() {
	    LinkedHashMap<String, Float> map = new LinkedHashMap<String, Float>();

	    try {
	        // Fetch all movie IDs
	        List<Integer> movieIds = template.queryForList("SELECT DISTINCT mov_id FROM rating", Integer.class);

	        for (Integer movid : movieIds) {
	            // Get movie name
	            String movname = template.queryForObject(
	                "SELECT mov_name FROM moviemaster WHERE mov_id = ?",
	                new Object[]{movid},
	                String.class
	            );

	            // Get count and sum of ratings for the movie
	            Map<String, Object> result = template.queryForMap(
	                "SELECT COUNT(rating) AS usercount, SUM(rating) AS ratingsum FROM rating WHERE mov_id = ?",
	                movid
	            );

	            int usercount = ((Number) result.get("usercount")).intValue();
	            int ratingsum = ((Number) result.get("ratingsum")).intValue();

	            // Calculate overall rating
	            float overallrating = (float) ratingsum / usercount;

	            map.put(movname, overallrating);
	        }

	        // Convert map to list of entries
	        List<Map.Entry<String, Float>> entries = new ArrayList<Entry<String, Float>>(map.entrySet());

	        // Sort entries by value in descending order
	        entries.sort(new Comparator<Map.Entry<String, Float>>() {
	            public int compare(Map.Entry<String, Float> e1, Map.Entry<String, Float> e2) {
	                return e2.getValue().compareTo(e1.getValue());
	            }
	        });

	        // Create sorted LinkedHashMap
	        LinkedHashMap<String, Float> sortedMap = new LinkedHashMap<String, Float>();
	        for (Map.Entry<String, Float> entry : entries) {
	            sortedMap.put(entry.getKey(), entry.getValue());
	        }

	        return sortedMap;
	    } catch (Exception e) {
	        System.out.println("Error is: " + e);
	        return null;
	    }
	}

	@Override
	public List<MovieModel> getMovieByName(String moviename) {
		String sql = "SELECT * FROM moviemaster WHERE mov_name = ?";
		List<MovieModel> movies = template.query(sql, new Object[] {   moviename}, new RowMapper<MovieModel>() {
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
		return movies;
	
	}

	@Override
	public List<MovieModel> searchMoviesByName(String query) {
		String sql = "SELECT * FROM moviemaster WHERE mov_name = ?";
		List<MovieModel> movies = template.query(sql, new Object[] {   query}, new RowMapper<MovieModel>() {
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
		return movies;
	}

	@Override
	public List<MovieModel> getAllWatchedMovies(int userid) {
	    String sql = "SELECT mm.mov_id, mm.mov_name, mm.mov_lang, mm.mov_actor, mm.mov_year " +
	                 "FROM moviemaster mm " +
	                 "INNER JOIN movieuserjoin muj ON mm.mov_id = muj.mov_id " +
	                 "WHERE muj.user_id = ?";
	    
	    List<MovieModel> movies = template.query(sql, new Object[]{userid}, new RowMapper<MovieModel>() {
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
	    return movies;
	}

	@Override
	public LinkedHashMap<Integer, ArrayList<String>> getUserWiseMovieName() {
		   LinkedHashMap<Integer, ArrayList<String>> map1 = new LinkedHashMap<Integer, ArrayList<String>>();

		    try {
		        // Query to get all user IDs
		        String userQuery = "SELECT user_id FROM Usermaster";
		        List<Integer> userIds = template.queryForList(userQuery, Integer.class);

		        for (Integer userId : userIds) {
		            // Query to get movie names for each user
		            String movieQuery = "SELECT mm.mov_name FROM moviemaster mm "
		                              + "INNER JOIN movieuserjoin muj ON mm.mov_id = muj.mov_id "
		                              + "INNER JOIN usermaster um ON muj.user_id = um.user_id "
		                              + "WHERE um.user_id = ?";
		            
		            List<String> movieNames = template.query(movieQuery, new Object[] { userId }, 
		                    new RowMapper<String>() {
		                        @Override
		                        public String mapRow(ResultSet rs, int rowNum) throws SQLException {
		                            return rs.getString("mov_name");
		                        }
		                    });
		            
		            // Add user ID and their movies to the map
		            map1.put(userId, new ArrayList<String>(movieNames));
		        }
		    } catch (Exception ex) {
		        System.out.println("Error: " + ex.getMessage());
		    }

		    return map1;
	}



	

}

   


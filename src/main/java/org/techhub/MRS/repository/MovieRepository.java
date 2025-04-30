package org.techhub.MRS.repository;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.techhub.MRS.model.MovieModel;

public interface MovieRepository {

	public List<MovieModel> getAllMovies();
	public List<MovieModel> getAllMoviesbyName(String name);
	public List<MovieModel> getMovieById(Integer movieId);
	public boolean submitRatingAndReview(int movieId, int userid, int rating, String review);
	public boolean ischeckMovieWatchBefore(int userid, int movieId);
	public LinkedHashMap<String, Float> getOverallRatings();
	public List<MovieModel> getMovieByName(String moviename);
	public List<MovieModel> searchMoviesByName(String query);
	public List<MovieModel> getAllWatchedMovies(int userid);
	public LinkedHashMap<Integer, ArrayList<String>> getUserWiseMovieName();
	

}

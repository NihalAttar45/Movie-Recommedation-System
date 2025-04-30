package org.techhub.MRS.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.techhub.MRS.model.MovieModel;
import org.techhub.MRS.repository.MovieRepository;

@Service("movieservice")
public class MovieServiceImp implements MovieService{
	@Autowired
    MovieRepository movierepo;
	@Override
	public List<MovieModel> getAllMovies() {
		// TODO Auto-generated method stub
		return movierepo.getAllMovies();
	}
	@Override
	public List<MovieModel> getAllMoviesbyName(String name) {
		// TODO Auto-generated method stub
		return movierepo.getAllMoviesbyName(name);
	}
	@Override
	public List<MovieModel> getMovieById(Integer movieId) {
		// TODO Auto-generated method stub
		return movierepo.getMovieById(movieId);
	}
	@Override
	public boolean submitRatingAndReview(int movieId, int userid, int rating, String review) {
		// TODO Auto-generated method stub
		return movierepo.submitRatingAndReview(movieId,userid,rating,review);
	}
	@Override
	public boolean ischeckMovieWatchBefore(int userid, int movieId) {
		// TODO Auto-generated method stub
		return movierepo.ischeckMovieWatchBefore(userid,movieId);
	}
	@Override
	public LinkedHashMap<String, Float> getTopFiveMovies() {
	    LinkedHashMap<String, Float> ratingsMap = movierepo.getOverallRatings();

	    if (ratingsMap != null) {
	        LinkedHashMap<String, Float> topFiveMovies = new LinkedHashMap<String, Float>();
	        int count = 0;

	        for (Map.Entry<String, Float> entry : ratingsMap.entrySet()) {
	            topFiveMovies.put(entry.getKey(), entry.getValue());
	            count++;
	            if (count == 5) break;
	        }

	        return topFiveMovies;
	    }

	    return null;
	}
	@Override
	public List<MovieModel> getMovieByName(String moviename) {
		// TODO Auto-generated method stub
		return movierepo.getMovieByName(moviename);
	}
	@Override
	public List<MovieModel> searchMoviesByName(String query) {
		// TODO Auto-generated method stub
		return movierepo.searchMoviesByName(query);
	}
	@Override
	public LinkedHashMap<String, Float> getTopAllMovieswithRating() {
		return movierepo.getOverallRatings();
	}
	@Override
	public List<MovieModel> getAllWatchedMovies(int userid) {
		// TODO Auto-generated method stub
		return movierepo.getAllWatchedMovies(userid);
	}
	@Override
	public LinkedHashMap<Integer, ArrayList<String>> getUserWiseMovieName() {
		// TODO Auto-generated method stub
		return movierepo.getUserWiseMovieName();
	}
}

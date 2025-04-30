package org.techhub.MRS.model;

public class MovieModel {
   private String moviename;
   private String movielang;
   private String posterPath;
   public String getPosterPath() {
	return posterPath;
}
public void setPosterPath(String posterPath) {
	this.posterPath = posterPath;
}
public String getMoviename() {
	return moviename;
}
public void setMoviename(String moviename) {
	this.moviename = moviename;
}

public String getMovielang() {
	return movielang;
}
@Override
public String toString() {
	return "MovieModel [moviename=" + moviename + ", movielang=" + movielang + ", movieactor=" + movieactor
			+ ", movieyear=" + movieyear + ", moviecategory=" + moviecategory + ", cid=" + cid + ", movieid=" + movieid
			+ "]";
}
public void setMovielang(String movielang) {
	this.movielang = movielang;
}
public String getMovieactor() {
	return movieactor;
}
public void setMovieactor(String movieactor) {
	this.movieactor = movieactor;
}
public int getMovieyear() {
	return movieyear;
}
public void setMovieyear(int movieyear) {
	this.movieyear = movieyear;
}
private String movieactor;
   private int movieyear;
   private String moviecategory;
   private int cid;
   private int movieid;
public String getMoviecategory() {
	return moviecategory;
}
public void setMoviecategory(String moviecategory) {
	this.moviecategory = moviecategory;
}
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public int getMovieid() {
	return movieid;
}
public void setMovieid(int movieid) {
	this.movieid = movieid;
}
   
}

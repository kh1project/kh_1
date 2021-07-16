package com.web.seenema.reserve.dto;


public class ReserveCheckDTO {
	private String location;
	private String name;
	private String tname = "1관";
	private String title;
	private int rating;
	private String moviedate;
	private String starttime;
	private String endtime;
	private int adult = 0;
	private int teenager = 0;
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTname() {
		return tname;
	}
	
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getAdult() {
		return adult;
	}
	
	public void setAdult(int adult) {
		this.adult = adult;
	}
	
	public int getTeenager() {
		return teenager;
	}
	
	public void setTeenager(int teenager) {
		this.teenager = teenager;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getMoviedate() {
		return moviedate;
	}

	public void setMoviedate(String moviedate) {
		this.moviedate = moviedate;
	}
	
}

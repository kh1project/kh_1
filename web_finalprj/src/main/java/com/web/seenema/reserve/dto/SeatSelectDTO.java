package com.web.seenema.reserve.dto;

import java.sql.Date;

public class SeatSelectDTO {
	private String location;	// branch 지역명
	private String name;		// branch 지점명
	private String tname = "1관";		// theater 상영관 이름
	private int rating;		// 등급
	private String title;		// 영화 제목
	private String moviedate;		// 영화 날짜
	private String starttime;	// 시작 시간
	private String endtime;		// 종료 시간
	
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
	
	public int getRating() {
		return rating;
	}
	
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getMoviedate() {
		return moviedate;
	}
	
	public void setMoviedate(String moviedate) {
		this.moviedate = moviedate;
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
	
}

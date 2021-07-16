package com.web.seenema.reserve.dto;

import java.sql.Date;

public class TimeDTO {
	private int id;
	private int bid;
	private int mid;
	private int tid;
	private String location;
	private String name;
	private int rating;
	private Date playdate;
	private Date moviedate;
	private Date enddate;
	private String starttime;
	private String endtime;
	private int seat_count;
	private String seat_reserved;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getBid() {
		return bid;
	}
	
	public void setBid(int bid) {
		this.bid = bid;
	}
	
	public int getMid() {
		return mid;
	}
	
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	public int getTid() {
		return tid;
	}
	
	public void setTid(int tid) {
		this.tid = tid;
	}
	
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
	
	public int getRating() {
		return rating;
	}
	
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	public Date getPlaydate() {
		return playdate;
	}

	public void setPlaydate(Date playdate) {
		this.playdate = playdate;
	}
	
	public Date getMoviedate() {
		return moviedate;
	}
	
	public void setMoviedate(Date moviedate) {
		this.moviedate = moviedate;
	}
	
	public Date getEnddate() {
		return enddate;
	}
	
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
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
	
	public int getSeat_count() {
		return seat_count;
	}

	public void setSeat_count(int seat_count) {
		this.seat_count = seat_count;
	}

	public String getSeat_reserved() {
		return seat_reserved;
	}

	public void setSeat_reserved(String seat_reserved) {
		this.seat_reserved = seat_reserved;
	}
	
}

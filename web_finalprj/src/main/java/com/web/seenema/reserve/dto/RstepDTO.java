package com.web.seenema.reserve.dto;

import java.sql.Date;

public class RstepDTO {
	private int mid;
	private Date date;
	private int bid;
	private String theater;
	private String time;
	private String seat;
	private int people;
	private int totalprice;
	
	public int getMid() {
		return mid;
	}
	
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public int getBid() {
		return bid;
	}
	
	public void setBid(int bid) {
		this.bid = bid;
	}
	
	public String getTheater() {
		return theater;
	}
	
	public void setTheater(String theater) {
		this.theater = theater;
	}
	
	public String getTime() {
		return time;
	}
	
	public void setTime(String time) {
		this.time = time;
	}
	
	public String getSeat() {
		return seat;
	}
	
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	public int getPeople() {
		return people;
	}
	
	public void setPeople(int people) {
		this.people = people;
	}
	
	public int getTotalprice() {
		return totalprice;
	}
	
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
}

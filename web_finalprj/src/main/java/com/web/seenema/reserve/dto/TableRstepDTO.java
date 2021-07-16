package com.web.seenema.reserve.dto;

import java.sql.Date;

public class TableRstepDTO {
	private int mid;
	private Date date;
	private int bid;
	private String location;
	private String branch;
	private String time;
	private int totalseat;
	private int leftseat;
	
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
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getBranch() {
		return branch;
	}
	
	public void setBranch(String branch) {
		this.branch = branch;
	}
	
	public String getTime() {
		return time;
	}
	
	public void setTime(String time) {
		this.time = time;
	}
	
	public int getTotalseat() {
		return totalseat;
	}
	
	public void setTotalseat(int totalseat) {
		this.totalseat = totalseat;
	}
	
	public int getLeftseat() {
		return leftseat;
	}
	
	public void setLeftseat(int leftseat) {
		this.leftseat = leftseat;
	}
	
}

package com.web.seenema.reserve.dto;

import java.sql.Date;

// 시간
public class TimeInfoDTO {
	private int id;
	private int mtid;
	private Date moviedate;
	private String starttime;
	private String endtime;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getMtid() {
		return mtid;
	}
	
	public void setMtid(int mtid) {
		this.mtid = mtid;
	}
	
	public Date getMoviedate() {
		return moviedate;
	}
	
	public void setMoviedate(Date moviedate) {
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

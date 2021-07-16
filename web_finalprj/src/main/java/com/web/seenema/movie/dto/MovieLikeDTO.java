package com.web.seenema.movie.dto;

public class MovieLikeDTO {
	private int aid;
	private int mid;
	
	public MovieLikeDTO() {}
	
	public MovieLikeDTO(int aid, int mid){
		this.aid = aid;
		this.mid = mid;		
	}
	
	public int getAid() {
		return aid;
	}
	
	public void setAid(int aid) {
		this.aid = aid;
	}
	
	public int getMid() {
		return mid;
	}
	
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	
}
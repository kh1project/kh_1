package com.web.seenema.review.dto;

import java.util.*;

public class ReviewAddDTO {
	private int id;
    private int mid;
    private int aid;
    private String title;
    private String contents;
    private int star;
    private String nodel;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getNodel() {
		return nodel;
	}
	public void setNodel(String nodel) {
		this.nodel = nodel;
	}
    
}
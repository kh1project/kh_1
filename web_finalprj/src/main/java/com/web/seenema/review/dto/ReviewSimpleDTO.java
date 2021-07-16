package com.web.seenema.review.dto;

import java.util.*;

public class ReviewSimpleDTO {
	private int id;
    private int mid;    
    private int aid;    
    private String nickname;    
    private String title;    
    private String contents;    
    private int gcnt;    
    private int bcnt;    
    private Date cdate;    
    private int commcnt;
    
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public int getGcnt() {
		return gcnt;
	}
	public void setGcnt(int gcnt) {
		this.gcnt = gcnt;
	}
	public int getBcnt() {
		return bcnt;
	}
	public void setBcnt(int bcnt) {
		this.bcnt = bcnt;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getCommcnt() {
		return commcnt;
	}
	public void setCommcnt(int commcnt) {
		this.commcnt = commcnt;
	}
	
	@Override
	public String toString() {
		return "ReviewSimpleDTO [id=" + id + ", mid=" + mid + ", aid=" + aid + ", nickname=" + nickname + ", title="
				+ title + ", contents=" + contents + ", gcnt=" + gcnt + ", bcnt=" + bcnt + ", cdate=" + cdate
				+ ", commcnt=" + commcnt + "]";
	}
}
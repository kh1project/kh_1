package com.web.seenema.review.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ReviewListDTO {
	private int id;
	private int btype;
	private int aid;
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	private String nickname;
	private int mid;
	private String title;
	private String imgurl;
	private String contents;
	private Date cdate;   
    private int gcnt;  
    private int bcnt;
    private int commcnt;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCdate() {
		return cdate;
	}
	public String getCdateFM() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formatdate = format.format(cdate);
		return formatdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
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
	public int getCommcnt() {
		return commcnt;
	}
	public void setCommcnt(int commcnt) {
		this.commcnt = commcnt;
	}
	@Override
	public String toString() {
		return "ReviewListDTO [id=" + id + ", btype=" + btype + ", aid=" + aid + ", nickname=" + nickname + ", mid="
				+ mid + ", title=" + title + ", imgurl=" + imgurl + ", contents=" + contents + ", cdate=" + cdate
				+ ", gcnt=" + gcnt + ", bcnt=" + bcnt + ", commcnt=" + commcnt + "]";
	}
}

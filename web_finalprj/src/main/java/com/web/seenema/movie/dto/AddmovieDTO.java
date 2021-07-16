package com.web.seenema.movie.dto;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AddmovieDTO {
	private int mid;
	private String mainposter;
	private String subposter;
	private String title;
	private String subtitle;
	private String summary;
	private String type;
	private String director;
	private String genre;
	private int rating;
	private int runningtime;
	private String actor;
	private Date playdate;
	
	public int getMid() {
		return mid;
	}
	
	public void setMid(int mid) {
		this.mid = mid;
	}
	
//	public List<MultipartFile> getPoster() {
//		return poster;
//	}
//	
//	public void setPoster(List<MultipartFile> poster) {
//		this.poster = poster;
//	}
//	
//	public List<MultipartFile> getStillcut() {
//		return stillcut;
//	}
//	
//	public void setStillcut(List<MultipartFile> stillcut) {
//		this.stillcut = stillcut;
//	}
	
//	public MultipartFile[] getPoster() {
//	return poster;
//	}
//	
//	public void setPoster(MultipartFile[] poster) {
//		this.poster = poster;
//	}
//	
//	public MultipartFile[] getStillcut() {
//		return stillcut;
//	}
//	
//	public void setStillcut(MultipartFile[] stillcut) {
//		this.stillcut = stillcut;
//	}
	
	public String getMainposter() {
		return mainposter;
	}
	
	public void setMainposter(String mainposter) {
		this.mainposter = mainposter;
	}
	
	public String getSubposter() {
		return subposter;
	}
	
	public void setSubposter(String subposter) {
		this.subposter = subposter;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getSubtitle() {
		return subtitle;
	}
	
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	
	public String getSummary() {
		return summary;
	}
	
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getDirector() {
		return director;
	}
	
	public void setDirector(String director) {
		this.director = director;
	}
	
	public String getGenre() {
		return genre;
	}
	
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public int getRating() {
		return rating;
	}
	
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	public int getRunningtime() {
		return runningtime;
	}
	
	public void setRunningtime(int runningtime) {
		this.runningtime = runningtime;
	}
	
	public String getActor() {
		return actor;
	}
	
	public void setActor(String actor) {
		this.actor = actor;
	}
	
	public Date getPlaydate() {
		return playdate;
	}
	
	public void setPlaydate(Date playdate) {
		this.playdate = playdate;
	}

	@Override
	public String toString() {
		return "AddmovieDTO [mid=" + mid + ", mainposter=" + mainposter + ", subposter=" + subposter + ", title="
				+ title + ", subtitle=" + subtitle + ", summary=" + summary + ", type=" + type + ", director="
				+ director + ", genre=" + genre + ", rating=" + rating + ", runningtime=" + runningtime + ", actor="
				+ actor + ", playdate=" + playdate + "]";
	}


	
}

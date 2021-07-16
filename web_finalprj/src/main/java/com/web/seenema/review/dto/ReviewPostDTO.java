package com.web.seenema.review.dto;

public class ReviewPostDTO {
	private int id;
	private int mergePost;
	private String postimg;
	private String posttext;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMergePost() {
		return mergePost;
	}
	public void setMergePost(int mergePost) {
		this.mergePost = mergePost;
	}
	public String getPostimg() {
		return postimg;
	}
	public void setPostimg(String postimg) {
		this.postimg = postimg;
	}
	public String getPosttext() {
		return posttext;
	}
	public void setPosttext(String posttext) {
		this.posttext = posttext;
	}
	@Override
	public String toString() {
		return "ReviewPostDTO [id=" + id + ", mergePost=" + mergePost + ", postimg=" + postimg + ", posttext="
				+ posttext + "]";
	}
}

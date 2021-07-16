package com.web.seenema.movie.dto;

public class MyMovieDTO {
	private int id;
	private String title;
	private String path;
	private String name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "MyMovieDTO [id=" + id + ", title=" + title + ", path=" + path + ", name=" + name + "]";
	}
}

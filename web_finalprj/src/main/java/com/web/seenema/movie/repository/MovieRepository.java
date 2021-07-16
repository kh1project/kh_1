package com.web.seenema.movie.repository;

import java.util.List;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.dto.MyMovieDTO;

public interface MovieRepository {
	public List<MovieImageDTO> selectMovieImageList(int mid) throws Exception;
	public List<MyMovieDTO> selectWatchMovieList(int mid) throws Exception;
	public List<MovieDTO> selectMovie(int mid) throws Exception;
	public List<MovieImageDTO> getPoster(int mid) throws Exception;
}

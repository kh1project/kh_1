package com.web.seenema.movie.dao;

import java.io.File;
import java.util.List;

import com.web.seenema.movie.dto.AddmovieDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieGcntDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;

public interface MovieDAO {
	public List<MovieDTO> getAllMovies();
	public List<MovieDTO> getCurrentMovies();
	public List<MovieDTO> getEndMovies();
	public List<MovieDTO> getPreMovies();
	public MovieDTO getMovie(int mid);
	public List<MovieDTO> getAllMoviesSortByReserve();
	public List<MovieDTO> getAllMoviesSortByGcnt();
	public List<MovieDTO> getAllMoviesSortByGrade();
	public void movieLike(int aid, int mid);
	public List<MovieLikeDTO> getMovieLikeList(int aid);
	public int insertMovieLike(MovieLikeDTO dto);
	public int deleteMovieLike(MovieLikeDTO dto);
	public MovieDTO getLikeCnt(int mid);
	public List<MovieGcntDTO> getGcnt();
	public MovieDTO getLastMovieNum();
	public List<MovieImageDTO> getMoviePosters(Integer mid);
	public List<MovieImageDTO> getMovieStillcuts(Integer mid);
	public void insertFile(MovieImageDTO midto);
	public void insertMovieData(MovieDTO dto);
	public List<MovieImageDTO> getPoster(int mid);
	public List<MovieImageDTO> getStillcut(int mid);
	public List<MovieImageDTO> getOnePoster();
}
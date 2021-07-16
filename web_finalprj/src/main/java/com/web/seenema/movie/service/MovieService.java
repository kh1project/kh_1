package com.web.seenema.movie.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.web.seenema.movie.dto.AddmovieDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;

public interface MovieService {
	public List<MovieDTO> getAllMovies(int sort);
	public List<MovieDTO> getCurrentMovies();
	public List<MovieDTO> getEndMovies();
	public List<MovieDTO> getPreMovies();
	public List<MovieDTO> getMovies(int mid) throws Exception;
	public MovieDTO getMovie(int mid);
	public Map<Integer, String> getReserveRate();
	public boolean movieLikeDupCheck(int aid, int mid);
	public int insertMovieLike(MovieLikeDTO dto);
	public List<MovieLikeDTO> getMovieLikeList(int aid);
	public int movieUnlike(MovieLikeDTO dto);
	public MovieDTO getLikeCnt(int mid);
	// 예매 파트에 포스터 가져오기.
	public List<MovieImageDTO> getPoster(int mid) throws Exception;
	public int getAudi();
	public Map<Integer, Integer> getGcnt();
	public int getLastMovieNum();
	public List<MovieImageDTO> getMoviePosters(Integer mid);
	public List<MovieImageDTO> getMovieStillcuts(Integer mid);
	public void posterUpload(MultipartFile[] poster, int mid, HttpServletRequest req) throws IOException;
	public void stillcutUpload(MultipartFile[] stillcut, int mid, HttpServletRequest req) throws IOException;
	public void insertMovieData(MovieDTO dto);
	public Map<Integer, List<MovieImageDTO>> getPosterInfo(int size);
	public Map<Integer, List<MovieImageDTO>> getStillcutInfo(int size);
	public List<MovieImageDTO> getOnePoster();
	public int getAid(HttpServletRequest request);
}
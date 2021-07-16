package com.web.seenema.movie.dao;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.web.seenema.movie.dto.AddmovieDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieGcntDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;

@Repository
public class MovieDAOImpl implements MovieDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MovieDTO> getAllMovies() {
		List<MovieDTO> list = sqlSession.selectList("movie.getAllMovies");
		
		return list;
	}
	
	@Override
	public List<MovieDTO> getCurrentMovies() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MovieDTO> getEndMovies() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public MovieDTO getMovie(int mid) {
		return sqlSession.selectOne("movie.getMovie", mid);
	}
	
	@Override
	public List<MovieDTO> getPreMovies() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MovieDTO> getAllMoviesSortByReserve() {		
		return sqlSession.selectList("movie.getAllMoviesSortByReserve");
	}
	
	@Override
	public List<MovieDTO> getAllMoviesSortByGcnt() {		
		return sqlSession.selectList("movie.getAllMoviesSortByGcnt");
	}
	
	@Override
	public List<MovieDTO> getAllMoviesSortByGrade() {		
		return sqlSession.selectList("movie.getAllMoviesSortByGrade");
	}
	
	@Override
	public void movieLike(int aid, int mid) {
		
	}
	
	@Override
	public List<MovieLikeDTO> getMovieLikeList(int aid) {		
		return sqlSession.selectList("movie.getLikeList", aid);
	}
	
	@Override
	public int insertMovieLike(MovieLikeDTO dto) {
		return sqlSession.insert("movie.insertMovieLike", dto);	
	}
	
	@Override
	public int deleteMovieLike(MovieLikeDTO dto) {
		return sqlSession.delete("movie.deleteMovieLike", dto);
	}
	
	@Override
	public MovieDTO getLikeCnt(int mid) {
		return sqlSession.selectOne("movie.getLikeCnt", mid);
	}
	
	@Override
	public List<MovieGcntDTO> getGcnt() {
		return sqlSession.selectList("movie.getGcnt");
	}
	
	@Override
	public MovieDTO getLastMovieNum() {
		return sqlSession.selectOne("movie.getLastMovieNum");
	}
	
	@Override
	public List<MovieImageDTO> getMoviePosters(Integer mid) {
		return sqlSession.selectList("movie.getMoviePosters", mid);
	}
	
	@Override
	public List<MovieImageDTO> getMovieStillcuts(Integer mid) {
		return sqlSession.selectList("movie.getMovieStillcuts", mid);
	}
	
	@Override
	public void insertFile(MovieImageDTO midto) {
		sqlSession.insert("movie.insertFile", midto);
	}
	
	@Override
	public void insertMovieData(MovieDTO dto) {
		sqlSession.insert("movie.insertMovieData", dto);
	}
	
	@Override
	public List<MovieImageDTO> getPoster(int mid) {
		return sqlSession.selectList("movie.getPosterInfo", mid);
	}
	
	@Override
	public List<MovieImageDTO> getStillcut(int mid) {
		return sqlSession.selectList("movie.getStillcutInfo", mid);
	}
	
	@Override
	public List<MovieImageDTO> getOnePoster() {
		return sqlSession.selectList("movie.getOnePoster");
	}
	
}
package com.web.seenema.movie.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.dto.MyMovieDTO;

@Repository
public class MovieRepositoryImpl implements MovieRepository {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MovieImageDTO> selectMovieImageList(int mid) throws Exception {
		List<MovieImageDTO> data = sqlSession.selectList("movie.movieImageSearch", mid);
		return data;
	}

	@Override
	public List<MyMovieDTO> selectWatchMovieList(int mid) throws Exception {
		List<MyMovieDTO> data = sqlSession.selectList("movie.myMovieSearch", mid);
//		System.out.println("리포지터리 data.size() : " + data.size());
//		for(int i = 0; i < data.size(); i++) {
//			System.out.println(data.get(i).getTitle() + "의 : " + i + "번째 주소+파일명 : " + data.get(i).getPath() + data.get(i).getName());
//		}
		return data;
	}

	@Override
	public List<MovieDTO> selectMovie(int mid) throws Exception {
		List<MovieDTO> moviedata = sqlSession.selectList("movie.getMovie", mid);
		return moviedata;
	}

	@Override
	public List<MovieImageDTO> getPoster(int mid) throws Exception {
		List<MovieImageDTO> movieimg = sqlSession.selectList("movie.getPoster", mid);
		
		return movieimg;
	}

}

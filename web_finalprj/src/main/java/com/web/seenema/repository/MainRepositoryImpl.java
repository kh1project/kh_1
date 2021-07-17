package com.web.seenema.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.dto.BoxofficeDTO;
import com.web.seenema.dto.MyGcntDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;

@Repository
public class MainRepositoryImpl implements MainRepository {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Integer> selectCarouselList() {
		return sqlSession.selectList("mainMapper.carousel");
	}

	@Override
	public List<BoxofficeDTO> selectBoxofficeList() {
		// 순서가 필요해서 HashMap 아닌 DTO에 담음.
		return sqlSession.selectList("mainMapper.boxoffice");
	}
	
	@Override
	public List<BoxofficeDTO> selectBoxofficeListUnder4() {
		return sqlSession.selectList("mainMapper.boxofficeUnder4");
	}

	@Override
	public int selectMovieCnt() {
		return sqlSession.selectOne("mainMapper.movieCnt");
	}
	
	@Override
	public boolean updateGcnt(int id) {
		boolean result = false;
		int res = sqlSession.update("mainMapper.incGcnt", id);
		if(res == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public int selectGcnt(int id) {
		return sqlSession.selectOne("mainMapper.getGcnt", id);
	}
	
	@Override
	public boolean checkGcntDup(MovieLikeDTO info) {
		boolean result = false;
		int res = sqlSession.selectOne("mainMapper.checkGcntDup", info);
		if(res == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public boolean insertMovielike(MovieLikeDTO info) {
		boolean result = false;
		int res = sqlSession.insert("mainMapper.addMovielike", info);
		if(res == 1) {
			result = true;
		}
		
		return result;
	}
	
	@Override
	public List<Integer> getMygcnt(MyGcntDTO mygcnt) {
		return sqlSession.selectList("mainMapper.mygcnt", mygcnt);
	}
}


package com.web.seenema.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.dto.BoxofficeDTO;

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
}

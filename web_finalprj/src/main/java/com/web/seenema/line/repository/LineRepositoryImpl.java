package com.web.seenema.line.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.line.dto.SettingDataDTO;
import com.web.seenema.line.dto.LineAddDTO;
import com.web.seenema.line.dto.LineDTO;

@Repository
public class LineRepositoryImpl implements LineRepository {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean insertLine(LineAddDTO dto) {
		boolean result = false;
		int res = sqlSession.insert("lineMapper.add", dto);
		if(res == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public LineDTO selectLineOne(int id) {
		return sqlSession.selectOne("lineMapper.lineOne", id);
	}

	@Override
	public int updateGcnt(int lid) {
		return sqlSession.update("lineMapper.incGcnt", lid);
	}
	
	@Override
	public int selectGcnt(int lid) {
		return sqlSession.selectOne("lineMapper.getGcnt", lid);
	}

	@Override
	public boolean updateDeleted(int lid) {
		boolean result = false;
		int res = sqlSession.update("lineMapper.delete", lid);
		if(res == 1) {
			result = true;
		}
		return result;
	}
}

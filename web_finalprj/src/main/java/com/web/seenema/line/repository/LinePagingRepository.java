package com.web.seenema.line.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.line.dto.SettingDataDTO;
import com.web.seenema.line.dto.LineDTO;

@Repository
public class LinePagingRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public List<LineDTO> selectLinelist(int mid) {
		return sqlSession.selectList("lineMapper.initLinelist", mid);
	}
	
	public int selectLinecnt(int mid) {
		return sqlSession.selectOne("lineMapper.linecnt", mid);
	}
	
	public List<LineDTO> selectLinelist(SettingDataDTO settingdata) {
		List<LineDTO> res = sqlSession.selectList("lineMapper.linelist_dynamic", settingdata);
		return res;
	}
}

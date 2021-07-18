package com.web.seenema.account.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.dto.AccountGradeDTO;

@Repository
public class AccountRepositoryImpl implements AccountRepository {
 
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Integer> selectMyMovieList(int aid) throws Exception {
		//내가 본 영화의 mid 목록
		List<Integer> data = sqlSession.selectList("accountMapper.myMovieSearch", aid);
		return data;
	}
	
	@Override
	public AccountDTO select(AccountDTO dto) throws Exception {
		AccountDTO data = sqlSession.selectOne("accountMapper.selectAccount", dto);
		return data;
	}

	@Override
	public List<AccountDTO> selectList() throws Exception {
		return sqlSession.selectList("accountMapper.selectAll");
	}

	@Override
	public int usedNickname(String nickname) throws Exception {
		return sqlSession.selectOne("accountMapper.checkNickname", nickname);
	}

	@Override
	public int usedEmail(String email) throws Exception {
		return sqlSession.selectOne("accountMapper.checkEmail", email);
	}

	@Override
	public AccountDTO checkUser(AccountDTO dto) throws Exception {
		return sqlSession.selectOne("accountMapper.checkLogin", dto);
	}
	
	public AccountDTO readUser(String userid) throws Exception {
		return sqlSession.selectOne("accountMapper.readUser", userid);
	}

	@Override
	public boolean insert(AccountDTO dto) throws Exception {
		boolean result = false;
		int rs = sqlSession.insert("accountMapper.insertAccount", dto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean update(AccountDTO dto) throws Exception {
		boolean result = false;
		int rs = sqlSession.update("accountMapper.update", dto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean delete(AccountDTO dto) throws Exception {
		boolean result = false;
		int rs = sqlSession.update("accountMapper.delete", dto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public List<AccountGradeDTO> getAdminList() {
		return sqlSession.selectList("accountMapper.getAdminList");
	}

	@Override
	public AccountDTO readAccount(String email) throws Exception {
		return sqlSession.selectOne("accountMapper.readAccount", email);
	}
	
}

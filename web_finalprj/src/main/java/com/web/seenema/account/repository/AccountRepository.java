package com.web.seenema.account.repository;

import java.util.List;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.dto.AccountGradeDTO;

public interface AccountRepository {
	public List<Integer> selectMyMovieList(int aid) throws Exception;
	public AccountDTO select(AccountDTO dto) throws Exception;
	public List<AccountDTO> selectList() throws Exception;
	public int usedNickname(String nickname) throws Exception;
	public int usedEmail(String email) throws Exception;
	public AccountDTO checkUser(AccountDTO dto) throws Exception;
	public boolean insert(AccountDTO dto) throws Exception;
	public boolean update(AccountDTO dto) throws Exception;
	public boolean delete(AccountDTO dto) throws Exception;
	public List<AccountGradeDTO> getAdminList();
}
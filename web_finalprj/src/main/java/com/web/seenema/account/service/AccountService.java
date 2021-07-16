package com.web.seenema.account.service;

import java.util.List;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MyMovieDTO;
import com.web.seenema.account.dto.AccountDTO;

public interface AccountService {
	public AccountDTO accountInfoDetail(AccountDTO dto) throws Exception;
	public List<AccountDTO> accountInfoList() throws Exception;
	public boolean join(AccountDTO dto) throws Exception;
	public boolean checkNickname(String nickname) throws Exception;
	public boolean checkEmail(String email) throws Exception;
	public void login(AccountDTO dto) throws Exception;
	public boolean login() throws Exception;
	public boolean changeNickname() throws Exception;
	public boolean changePassword() throws Exception;
	public List<List<MyMovieDTO>> mywatchList(int aid) throws Exception;
	public List<MyMovieDTO> mywatchSelect(int aid) throws Exception;
}

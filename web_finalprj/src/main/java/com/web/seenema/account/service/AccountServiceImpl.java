package com.web.seenema.account.service;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MyMovieDTO;
import com.web.seenema.movie.repository.MovieRepositoryImpl;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.repository.AccountRepositoryImpl;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private MovieRepositoryImpl mdao;
	
	@Autowired
	private AccountRepositoryImpl dao;

	@Override
	public AccountDTO accountInfoDetail(AccountDTO dto) throws Exception {
		return dao.select(dto);
	}

	@Override
	public List<AccountDTO> accountInfoList() throws Exception {
		return dao.selectList();
	}

	@Override
	public boolean join(AccountDTO dto) throws Exception {
		return dao.insert(dto);
	}

	@Override
	public boolean checkNickname(String nickname) throws Exception {
		boolean result = true;
		int rs = dao.usedNickname(nickname);
		if(rs == 0) {
			result = false;
		}
		return result;
	}

	@Override
	public boolean checkEmail(String email) throws Exception {
		boolean result = true;
		int rs = dao.usedEmail(email);
		if(rs == 0) {
			result = false;
		}
		return result;
	}

	@Override
	public void login(AccountDTO dto) throws Exception {
		AccountDTO data = dao.checkUser(dto);
		if(data != null) {
			dto.setId(data.getId());
			dto.setEmail(data.getEmail());
			dto.setPassword("");
			dto.setUsername(data.getUsername());
			dto.setNickname(data.getNickname());
			dto.setAge(data.getAge());
			dto.setGender(data.getGender());
			dto.setPhone(data.getPhone());
			dto.setLogindate(data.getLogindate());
			dto.setJoindate(data.getJoindate());			
		} else {
			dto.setId(-1);
			dto.setPassword("");
		}
	}

	@Override
	public boolean login() throws Exception {
		return false;
	}

	@Override
	public boolean changeNickname() throws Exception {
		return false;
	}

	@Override
	public boolean changePassword() throws Exception {
		return false;
	}
	
	@Override
	public List<List<MyMovieDTO>> mywatchList(int aid) throws Exception {
		List<Integer> temp = dao.selectMyMovieList(aid);
		List<Integer> midlist = temp.stream().distinct().collect(Collectors.toList());
		
		LinkedList<List<MyMovieDTO>> datalist = new LinkedList<List<MyMovieDTO>>();
		
		for(int i = 0; i < midlist.size(); i++) {
			List<MyMovieDTO> data = mdao.selectWatchMovieList(midlist.get(i));
			datalist.add(data);
		}
		return datalist;
	}
	
	@Override
	public List<MyMovieDTO> mywatchSelect(int aid) throws Exception {
		List<MyMovieDTO> data = mdao.selectWatchMovieList(aid);
		return data;
	}
}

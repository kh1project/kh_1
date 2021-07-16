package com.web.seenema.line.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.seenema.line.dto.LineAddDTO;
import com.web.seenema.line.dto.LineDTO;
import com.web.seenema.line.dto.SettingDataDTO;
import com.web.seenema.line.repository.LineRepositoryImpl;

@Service
public class LineServiceImpl implements LineService {

	@Autowired
	private LineRepositoryImpl repository;
	

	@Override
	public boolean add(LineAddDTO dto) {
		return repository.insertLine(dto);
	}

	@Override
	public LineDTO getLine(int id) {
		return repository.selectLineOne(id);
	}

	@Override
	public int incGcnt(int lid) {
		int res = repository.updateGcnt(lid);
		
		if(res == 1) {
			res = repository.selectGcnt(lid);
		} else {
			res = -1;
		}
		return res;
	}

	@Override
	public boolean delete(int lid) {
		return repository.updateDeleted(lid);
	}

}

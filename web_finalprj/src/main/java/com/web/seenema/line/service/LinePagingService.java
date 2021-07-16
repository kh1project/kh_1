package com.web.seenema.line.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.seenema.line.dto.SettingDataDTO;
import com.web.seenema.line.dto.LineDTO;
import com.web.seenema.line.repository.LinePagingRepository;

@Service
public class LinePagingService {
	
	@Autowired
	private LinePagingRepository repository;
	
	
	public List<LineDTO> initLinelist(int mid) {
		return repository.selectLinelist(mid);
	}
	

	public List<LineDTO> getPgDatas(SettingDataDTO startend) {
		return repository.selectLinelist(startend);
	}
	
	public int totalRow(int mid) {
		return repository.selectLinecnt(mid);
	}

}

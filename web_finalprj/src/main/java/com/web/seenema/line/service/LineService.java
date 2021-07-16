package com.web.seenema.line.service;

import java.util.List;

import com.web.seenema.line.dto.LineAddDTO;
import com.web.seenema.line.dto.LineDTO;
import com.web.seenema.line.dto.SettingDataDTO;

public interface LineService {
	
	public boolean add(LineAddDTO dto);
	public LineDTO getLine(int id);
	public int incGcnt(int lid);
	public boolean delete(int lid);
}

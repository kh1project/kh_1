package com.web.seenema.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.web.seenema.dto.BoxofficeDTO;

public interface MainService {
	
	public List<Integer> getCarousel();
	public List<BoxofficeDTO> getBoxOffice();
	public boolean incGcnt(int id);
	public int getGcnt(int id);
}

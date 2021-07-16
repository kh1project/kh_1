package com.web.seenema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.seenema.dto.BoxofficeDTO;
import com.web.seenema.repository.MainRepositoryImpl;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainRepositoryImpl repository;
	
	@Override
	public List<Integer> getCarousel() {
		return repository.selectCarouselList();
	}
	
	@Override
	public List<BoxofficeDTO> getBoxOffice() {
		List<BoxofficeDTO> boxoffice = null;
		if(repository.selectMovieCnt() < 4) {
			boxoffice = repository.selectBoxofficeListUnder4();
		} else {
			boxoffice = repository.selectBoxofficeList();
		}
		return boxoffice;
	}

	@Override
	public boolean incGcnt(int id) {
		return repository.updateGcnt(id);
	}

	@Override
	public int getGcnt(int id) {
		return repository.selectGcnt(id);
	}

}

package com.web.seenema.service;

import java.util.List;

import com.web.seenema.dto.BoxofficeDTO;
import com.web.seenema.dto.MyGcntDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;

public interface MainService {
	
	public List<Integer> getCarousel();
	public List<BoxofficeDTO> getBoxOffice();
	public boolean incGcnt(int id);
	public int getGcnt(int id);
	public boolean addMovielike(MovieLikeDTO info);
	public List<Integer> getMygcnt(MyGcntDTO mygcnt);
}

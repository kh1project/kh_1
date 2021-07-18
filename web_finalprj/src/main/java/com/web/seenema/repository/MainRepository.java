package com.web.seenema.repository;

import java.util.List;

import com.web.seenema.dto.BoxofficeDTO;
import com.web.seenema.dto.MyGcntDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;

public interface MainRepository {

	public List<Integer> selectCarouselList();
	public List<BoxofficeDTO> selectBoxofficeList();
	public List<BoxofficeDTO> selectBoxofficeListUnder4();
	public int selectMovieCnt();
	public boolean updateGcnt(int id);
	public int selectGcnt(int id);
	public boolean checkGcntDup(MovieLikeDTO info);
	public boolean insertMovielike(MovieLikeDTO info);
	public List<Integer> getMygcnt(MyGcntDTO mygcnt);
}

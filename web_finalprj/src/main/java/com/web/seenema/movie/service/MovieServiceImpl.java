package com.web.seenema.movie.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.web.seenema.movie.dao.MovieDAO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieGcntDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;
import com.web.seenema.movie.repository.MovieRepository;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MovieRepository mdao;
	
	@Autowired
	MovieDAO dao;

	@Override
	public List<MovieDTO> getAllMovies(int sort) {
		
		List<MovieDTO> list;
		if(sort == 1)
			list = dao.getAllMoviesSortByReserve();
		else if(sort == 2)
			list = dao.getAllMoviesSortByGcnt();
		else if(sort == 3)
			list = dao.getAllMoviesSortByGrade();
		else
			list = dao.getAllMovies();		
		
		return list;
	}

	@Override
	public List<MovieDTO> getCurrentMovies() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MovieDTO> getEndMovies() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MovieDTO getMovie(int mid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MovieDTO> getMovies(int mid) throws Exception {
		List<MovieDTO> list = mdao.selectMovie(mid);
		return list;
	}

	@Override
	public List<MovieDTO> getPreMovies() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Map<Integer, String> getReserveRate() {
		Map<Integer, String> map = new HashMap<Integer, String>();
		
		List<MovieDTO> list = getAllMovies(1);
		int rcntAll = 0;
		for(MovieDTO movie : list) {
			rcntAll += movie.getRcnt();
		}
		
		for(MovieDTO movie : list) {
			String reserveRate = 
					String.format("%.2f", (movie.getRcnt()*100)/(double)rcntAll);
			map.put(movie.getId(), reserveRate);
		}
		
		return map;
	}
	
	@Override
	public boolean movieLikeDupCheck(int aid, int mid) {
		boolean isDup = false;
		List<MovieLikeDTO> list = dao.getMovieLikeList(aid);
		for(MovieLikeDTO item : list) {
			if(item.getMid() == mid)
				isDup = true;
		}
		return isDup;
	}
	
	@Override
	public int insertMovieLike(MovieLikeDTO dto) {
		return dao.insertMovieLike(dto);
	}
	
	@Override
	public List<MovieLikeDTO> getMovieLikeList(int aid) {
		return dao.getMovieLikeList(aid);
	}
	
	@Override
	public int movieUnlike(MovieLikeDTO dto) {
		return dao.deleteMovieLike(dto);		
	}
	
	@Override
		public MovieDTO getLikeCnt(int mid) {
			return dao.getLikeCnt(mid);
	}	

	@Override
	public List<MovieImageDTO> getPoster(int mid) throws Exception {
		List<MovieImageDTO> movieimg = mdao.getPoster(mid);
		return movieimg;
	}
	@Override
	public int getAudi() {
		int audi = 0;
		String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String[] dateArr = date.split("-");
		
		int today = Integer.parseInt(dateArr[0]+dateArr[1]+dateArr[2])-1;

		String key = "544a0cd847e7e0c5266d9fb2fa54d39b";
		
		try {
			URL url = new URL("https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
					+ "?key="+key
					+ "&targetDt="+today);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

			String result = br.readLine();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONObject boxOfficeResult = (JSONObject) jsonObject.get("boxOfficeResult");
			JSONArray dailyBoxOfficeList = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");

//			API 키값 참고
//			https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do
//			지금 시점에 API 사용하려면 수정할게 많음. 
//			프로젝트 마무리 하고 시간 남으면 쓰는게 좋을듯.
			for(int i = 0; i < dailyBoxOfficeList.size(); i++) {
				JSONObject temp = (JSONObject) dailyBoxOfficeList.get(i);
				
				audi = Integer.parseInt((String) temp.get("audiAcc")); 
				
				System.out.println(i+"번 인덱스: "+audi);
			}
			
		} catch (MalformedURLException e) {
			e.getMessage();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		return audi;
	}
	
	@Override
	public Map<Integer, Integer> getGcnt() {
		Map<Integer, Integer> res = new HashMap<Integer, Integer>();
		for(MovieGcntDTO item : dao.getGcnt()) 
			res.put(item.getMid(), item.getGcnt());
		
		return res;
	}
	
	@Override
	public int getLastMovieNum() {
		return dao.getLastMovieNum();
	}
}
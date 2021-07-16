package com.web.seenema.movie.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.movie.dao.MovieDAO;
import com.web.seenema.movie.dto.AddmovieDTO;
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
		Map<Integer, String> map = new HashMap<>();
		
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
		Map<Integer, Integer> res = new HashMap<>();
		for(MovieGcntDTO item : dao.getGcnt()) 
			res.put(item.getMid(), item.getGcnt());
		
		return res;
	}
	
	@Override
	public int getLastMovieNum() {
		MovieDTO mdto = dao.getLastMovieNum();
				
		return mdto.getId();
	}
	
	@Override
	public List<MovieImageDTO> getMoviePosters(Integer mid) {
		return dao.getMoviePosters(mid);
	}
	
	@Override
	public List<MovieImageDTO> getMovieStillcuts(Integer mid) {
		return dao.getMovieStillcuts(mid);
	}
	
	@Override
	public void posterUpload(MultipartFile[] poster, int mid, HttpServletRequest req) throws IOException {
		
		UUID uuid = UUID.randomUUID();
		String originName = "";
		String changeName = "";
		String fileExt = "";

		if(poster.length > 0) {
			for(MultipartFile f: poster) {	
				originName = f.getOriginalFilename();
				changeName = uuid.toString()+"_"+originName;
				fileExt = FilenameUtils.getExtension(f.getOriginalFilename());
				if(fileExt.equals("jpg") || fileExt.equals("jpeg") || fileExt.equals("png")) {
					String rootPath = req.getServletContext().getRealPath("/");
					File usePath = new File(rootPath + "/resources/images/movie/"+mid+"/poster");
					String relativePath = "/resources/images/movie/"+mid+"/poster/";
					if(!usePath.exists()) 
						Files.createDirectories(usePath.toPath());
					
					f.transferTo(new File(usePath + "/" + changeName));
					insertFile(relativePath, changeName, mid);
				}
			}
		}
		
	}
	
	@Override
	public void stillcutUpload(MultipartFile[] stillcut, int mid, HttpServletRequest req) throws IOException {
		
		UUID uuid = UUID.randomUUID();
		String originName = "";
		String changeName = "";
		String fileExt = "";
		
		if(stillcut.length > 0) {
			for(MultipartFile f: stillcut) {	
				originName = f.getOriginalFilename();
				changeName = uuid.toString()+"_"+originName;
				fileExt = FilenameUtils.getExtension(f.getOriginalFilename());
				if(fileExt.equals("jpg") || fileExt.equals("jpeg") || fileExt.equals("png")) {
					String rootPath = req.getServletContext().getRealPath("/");
					File usePath = new File(rootPath + "/resources/images/movie/"+mid+"/stillcut");
					String relativePath = "/resources/images/movie/"+mid+"/stillcut/";
					if(!usePath.exists()) 
						Files.createDirectories(usePath.toPath());
					
					f.transferTo(new File(usePath + "/"+ changeName));
					insertFile(relativePath, changeName, mid);
				}
			}
		}
		
	}

	private void insertFile(String relativePath, String changeName, int mid) {
		String path = relativePath.toString();
		String name = changeName.toString();
		MovieImageDTO midto = new MovieImageDTO();
		midto.setMid(mid);
		midto.setName(name);
		midto.setPath(path);
		dao.insertFile(midto);
		
	}
	
	@Override
	public void insertMovieData(MovieDTO dto) {
		System.out.println(dto.toString());
		dao.insertMovieData(dto);
	}
	
	@Override
	public Map<Integer, List<MovieImageDTO>> getPosterInfo(int size) {

		Map<Integer, List<MovieImageDTO>> imageMap = new HashMap<>();
		for(int i = 1; i <= size; i++) {
			imageMap.put(i, dao.getPoster(i));
		}

		return imageMap;
	}
	
	@Override
	public Map<Integer, List<MovieImageDTO>> getStillcutInfo(int size) {

		Map<Integer, List<MovieImageDTO>> imageMap = new HashMap<>();
		for(int i = 1; i <= size; i++) {
			imageMap.put(i, dao.getStillcut(i));
		}

		return imageMap;
	}
	
	@Override
	public List<MovieImageDTO> getOnePoster() {
		return dao.getOnePoster();
	}
	
	@Override
	public int getAid(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int aid=0;
		
    	if(session.getAttribute("account") != null) {
            AccountDTO dto = (AccountDTO) session.getAttribute("account");
            aid = dto.getId();
        }
    	System.out.println(aid);
		return aid;
	}

}
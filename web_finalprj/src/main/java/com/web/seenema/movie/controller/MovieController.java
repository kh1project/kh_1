package com.web.seenema.movie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.line.dto.LineDTO;
import com.web.seenema.line.dto.PagingInfoDTO;
import com.web.seenema.line.service.LinePagingService;
import com.web.seenema.movie.dao.MovieDAO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;
import com.web.seenema.movie.service.MovieService;

@Controller
@RequestMapping(value = "/")
public class MovieController {
	
	@Autowired
	private MovieService service;
	
	@Autowired
	MovieDAO mdao;
	
	@Autowired
	private LinePagingService pagingService;
	
	@RequestMapping(value = "/movie")
	public String movie(Model model, HttpServletRequest request, @RequestParam(required = false) String sort) {
		
		List<MovieDTO> movieList;
		int num = 1;
		// 1 -> 예매율순  2 -> 추천순  3 -> 별점순
		if(sort == null)
			movieList = service.getAllMovies(num);
		else {
			num = Integer.parseInt(sort);
			movieList = service.getAllMovies(num);
		}
		
		Map<Integer, String> reserveRating = service.getReserveRate();
		HttpSession session = request.getSession();
		
		int aid = 0;
		
		if(session.getAttribute("account") != null) {
			AccountDTO dto = (AccountDTO) session.getAttribute("account");
			aid = dto.getId();
		}	
		
		List<MovieLikeDTO> likeList = service.getMovieLikeList(aid);
		Map<Integer, Integer> gcnt = service.getGcnt();
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("reserveRating", reserveRating);
		model.addAttribute("likeList", likeList);
		model.addAttribute("sort", num);
		model.addAttribute("gcnt", gcnt);
		
		return "movie/movie";
	}
	
	@RequestMapping(value = "/movie/detail")
	public String movieDetail(Model model, @RequestParam(required=false) Integer mid, HttpServletRequest request) {
		
		if(mid == null) {
			mid = 1;
		}
		
		
		MovieDTO dto = mdao.getMovie(mid); // 영화정보 1개 가져오기
		Map<Integer, String> reserveRating = service.getReserveRate(); //예매율 
		HttpSession session = request.getSession(); // 로그인 세션 가져오기
		Map<Integer, Integer> gcnt = service.getGcnt(); // 좋아요 갯수 가져오기(전체)
		
		int aid = 0;
		
		if(session.getAttribute("account") != null) {
			AccountDTO adto = (AccountDTO) session.getAttribute("account");
			aid = adto.getId();
		}
		List<MovieLikeDTO> likeList = service.getMovieLikeList(aid); // 좋아요 받은 영화 리스트 가져오기
		
		model.addAttribute("movie", dto);		
		model.addAttribute("reserveRating", reserveRating.get(mid));
		model.addAttribute("likeList", likeList);
		model.addAttribute("gcnt", gcnt);
		
		/** 아영님 코드 시작 */
		// 1page 에 출력할 한줄평 데이터
		List<LineDTO> initLinelist = pagingService.initLinelist(mid);
		
		// 아이디 처리
		for(LineDTO line : initLinelist) {
			String email = line.getEmail().split("@")[0];
			email = email.substring(0, email.length() - 2);
			email += "**";
			line.setEmail(email);
		}
		
		// 전체 데이터 수
		int totalrow = pagingService.totalRow(mid);
		
		// 한 페이지에 출력하고픈 데이터 수량
		int list_cnt = 10;
				
		// 최대 페이지 번호
		int max_page = 1;
		if(totalrow != 0) {
			if (totalrow % list_cnt == 0) {
				max_page = totalrow / list_cnt;
			} else {
				max_page = (totalrow / list_cnt) + 1;
			}
		}
		
		PagingInfoDTO info = new PagingInfoDTO();
		info.setTotalrow(totalrow);
		info.setMax_page(max_page);
		
		
		model.addAttribute("initLinelist", initLinelist);
		model.addAttribute("initPagingInfo", info);
		
		/** 아영님 코드 끝 */

		return "movie/moviedetail";
	}
	
	@RequestMapping(value = "/movie/edit")
	public String movieEdit(Model model, @RequestParam("mid") int mid) {		
		
		
		return "movie/movieEdit";
	}
	
	@RequestMapping(value = "/movie/add")
	public String movieAdd(Model model) {
		int movieNum = service.getLastMovieNum()+1;
		//movie 테이블 마지막 시퀀스 +1
		model.addAttribute("mid", movieNum);
		
		return "movie/movieadd";
	}
	
	@RequestMapping(value = "/movie/getinfo")
	public String getinfo(Model model) {
		int movieNum = service.getLastMovieNum()+1;
		//movie 테이블 마지막 시퀀스 +1
		model.addAttribute("mid", movieNum);
		
		return "redirect:/movie/detail";
	}
	
}
package com.web.seenema.reserve.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.service.MovieService;
import com.web.seenema.pay.dto.PayDTO;
import com.web.seenema.reserve.dto.BranchDTO;
import com.web.seenema.reserve.dto.BranchTheaterDTO;
import com.web.seenema.reserve.dto.ReserveCheckDTO;
import com.web.seenema.reserve.dto.SeatDTO;
import com.web.seenema.reserve.dto.SeatSelectDTO;
import com.web.seenema.reserve.dto.TimeDTO;
import com.web.seenema.reserve.dto.TimeInfoDTO;
import com.web.seenema.reserve.service.ReserveService;

@Controller
@RequestMapping(value = "/reserve")
public class ReserveController {
	
	@Autowired
	private ReserveService ress;
	
	@Autowired
	private MovieService movies;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String selectLocation(@RequestParam String location, Model m) throws Exception {
		List<BranchDTO> b = ress.branchList(location);
		m.addAttribute("branchlist", b);
		return "reserve/reserve";
	}
	
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String movieList(@RequestParam String location, @RequestParam String name, Model m) throws Exception {
		List<MovieDTO> datas = ress.movieList(location, name);
		m.addAttribute("movieAll_list", datas);
		return "reserve/schedule";
	}
	
	@RequestMapping(value = "/time")
	public String timeList(@RequestParam String location,
			@RequestParam String name, @RequestParam int rating,
			@RequestParam String title, @RequestParam String moviedate, Model m) throws Exception {
		List<TimeDTO> time = ress.timeTableInfo(location, name, rating, title, moviedate);
		m.addAttribute("timelist", time);
		System.out.println("controller time" + time);
		return "reserve/time";
	}
	
	@RequestMapping(value = "/seats")
	public ModelAndView seats(HttpServletRequest req, @ModelAttribute SeatSelectDTO ssdto) throws Exception {
		int mid = ress.getMovieId(ssdto.getTitle());
		int mtid = ress.getmtid(mid, ssdto.getLocation(), ssdto.getName(), ssdto.getTname());
		
		List<TimeInfoDTO> timelist = ress.getTimelist(mtid, ssdto.getMoviedate(), ssdto.getStarttime(), ssdto.getEndtime());
		int timeid = timelist.get(0).getId();
		
		// 상영관의 좌석 정보 가져오기.
		List<SeatDTO> seatlists = ress.seatList(timeid);
		
		List<BranchTheaterDTO> btlist = ress.getmovieTheater(mtid);
		
		// 상영관의 총 좌석, 잔여석 가져오기.
		Map<String, Object> seatcnt = ress.seatcntlist(mtid);
		
		// 영화 정보 가져오기.
		List<MovieDTO> moviedata = movies.getMovies(mid);
		
		ModelAndView mv = new ModelAndView("reserve/seats");
		mv.addObject("timelist", timelist);
		mv.addObject("moviedata", moviedata);
		mv.addObject("btlist", btlist);
		mv.addObject("seatlists", seatlists);
		mv.addObject("seatcnt", seatcnt);
		
		return mv;
	}
	
	@RequestMapping(value = "/reservecheck", method= RequestMethod.POST)
	public ModelAndView reservecheck(HttpServletRequest req, HttpServletResponse response, @ModelAttribute ReserveCheckDTO rcdto) throws Exception {
		ModelAndView mv = new ModelAndView("reserve/reservecheck");
		int mid = ress.getMovieId(rcdto.getTitle());
		int mtid = ress.getmtid(mid, rcdto.getLocation(), rcdto.getName(), rcdto.getTname());
		
		List<BranchTheaterDTO> btlist = ress.getmovieTheater(mtid);
		
		List<MovieDTO> moviedata = movies.getMovies(mid);
		List<MovieImageDTO> poster = movies.getPoster(mid);
		
		List<TimeInfoDTO> timelist = ress.getTimelist(mtid, rcdto.getMoviedate(), rcdto.getStarttime(), rcdto.getEndtime());
		
		String Seat ="";
		String[] seatinfo = req.getParameterValues("seat");
		for(int i = 0; i < seatinfo.length; i++) {
			if(i < seatinfo.length - 1) {
				Seat += seatinfo[i] + ", ";
			} else if(i == seatinfo.length - 1) {
				Seat += seatinfo[i];
			}
		}
		
		// 가격 가져오기
		PayDTO pay = new PayDTO();
		
		int adult = 0;
		int teenager = 0;
		int adultPrice = 0;
		int teenPrice = 0;
		int peple = 0;
		
		
		if(req.getParameter("adult") != null) {
			adult = Integer.parseInt(req.getParameter("adult"));
			adultPrice = (ress.getprice(2))*adult;
			peple = teenager + adult;
		}
		
		if(req.getParameter("teenager") != null) {
			teenager = Integer.parseInt(req.getParameter("teenager"));
			pay.setId(1);
			teenPrice = (ress.getprice(1))*teenager;
			peple = teenager + adult;
		}
		
		int price = adultPrice + teenPrice;
		
		mv.addObject("timelist", timelist);
		mv.addObject("poster", poster);
		mv.addObject("moviedata", moviedata);
		mv.addObject("btlist", btlist);
		mv.addObject("peple", peple);
		mv.addObject("Seat", Seat);
		mv.addObject("price", price);
		
		return mv;
	}
	
}
package com.web.seenema.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;
import com.web.seenema.movie.service.MovieService;

@RestController
@RequestMapping(value = "/movieajax")
public class MovieAjaxController {
	
	@Autowired
	MovieService service;
	
	@RequestMapping(value = "/like")
	public int movieLike(@RequestParam("mid") int mid, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int aid = 0;
		if(session.getAttribute("account") != null) {
			AccountDTO adto = (AccountDTO) session.getAttribute("account");
			aid = adto.getId();
		}
		
		//로그인 체크
		if(aid == 0)
			return -1;
		
		if(!service.movieLikeDupCheck(aid, mid))
			service.insertMovieLike(new MovieLikeDTO(aid, mid));
		
		if(service.getGcnt().get(mid) == null)
			return 0;
		else
			return service.getGcnt().get(mid);
	}
	
	@RequestMapping(value = "/unlike")
	public int movieUnlike(@RequestParam("userid") int aid,
							@RequestParam("mid") int mid,
							HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		if(session.getAttribute("account") != null) {
			AccountDTO adto = (AccountDTO) session.getAttribute("account");
			aid = adto.getId();
		}
		
		//로그인 체크
		if(aid == 0)
			return -1;
		
		service.movieUnlike(new MovieLikeDTO(aid, mid));	

		if(service.getGcnt().get(mid) == null)
			return 0;
		else
			return service.getGcnt().get(mid);
	}
	
	@RequestMapping(value = "/detailfilter")
	public int DetailFilter(@RequestParam("mid") String mid) {
		
		return 0;
	}
	
}
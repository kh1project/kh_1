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
		
		int aid = service.getAid(request);
		
		//로그인 체크
		if(aid == -1)
			return -1;
		
		if(!service.movieLikeDupCheck(aid, mid))
			service.insertMovieLike(new MovieLikeDTO(aid, mid));
		
		if(service.getGcnt().get(mid) == null)
			return 0;
		else
			return service.getGcnt().get(mid);
	}
	
	@RequestMapping(value = "/unlike")
	public int movieUnlike(@RequestParam("mid") int mid,
							HttpServletRequest request) {

		int aid = service.getAid(request);
		
		//로그인 체크
		if(aid == -1)
			return -1;
		
		service.movieUnlike(new MovieLikeDTO(aid, mid));	

		if(service.getGcnt().get(mid) == null)
			return 0;
		else
			return service.getGcnt().get(mid);
	}
	
	@RequestMapping(value = "/edit/remove")
	public int removeImage(@RequestParam("removeList[]") String[] removeList) {
		System.out.println("ajax까지는 왔다.");
		if(removeList.length > 0) 
			service.deleteImage(removeList);
		
		System.out.println("컨트롤러 지났다..");
		return 0;
	}
	
	@RequestMapping(value = "/edit/deletemovie")
	public int deleteMovie(@RequestParam("mid") int mid) {
		System.out.println(mid+"번 영화 삭제");

		return service.deleteMovie(mid);
	}
	
}
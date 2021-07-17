package com.web.seenema.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;
import com.web.seenema.service.MainService;

@Controller
@RequestMapping(value = "/indexAjax")
public class IndexAjaxController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	@ResponseBody
	public JSONObject like(@RequestParam int mid, HttpServletRequest req) {
		JSONObject json = new JSONObject();
		
		// 저장 전 중복체크 안 하고 프론트에서 거르는 걸로.
		HttpSession sess = req.getSession(false);
		AccountDTO account = (AccountDTO)sess.getAttribute("account");
		
		MovieLikeDTO info = new MovieLikeDTO(account.getId(), mid);  
		
		// 영화좋아요 개수 증가
		if(service.incGcnt(mid)) {
			// movielike 에 데이터 넣기
			if(service.addMovielike(info)) {
				json.put("res", "success");
				json.put("gcnt", service.getGcnt(mid));
			} else {
				json.put("res", "fail");
			}
		} else {
			json.put("res", "fail");
		}
		
		return json;
	}
}

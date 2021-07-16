package com.web.seenema.review.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.service.AccountServiceImpl;
import com.web.seenema.movie.dto.MyMovieDTO;
import com.web.seenema.review.dto.ReviewListDTO;
import com.web.seenema.review.dto.ReviewPostDTO;
import com.web.seenema.review.service.ReviewServiceImpl;

@RestController
@RequestMapping(value = "/reviewajax")
public class ReviewAjaxController {
	
	@Autowired
	private AccountServiceImpl account;
	@Autowired
	private ReviewServiceImpl review;
	
	@RequestMapping(value = "/addstep1", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody	// ViewResolver 를 사용하지 않음.
	public List<MyMovieDTO> addstep1(@RequestParam int selectmovie) throws Exception {
		
		List<MyMovieDTO> smovieimgs = account.mywatchSelect(selectmovie);
		
		for(int i = 0; i < smovieimgs.size(); i++) {
			System.out.println(smovieimgs.get(i));
		}
		//왜 요청이 두번씩 되는지?
				
		return smovieimgs;
	}
	
	@RequestMapping(value = "/addstep2", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int addstep2(@RequestParam String jsonData) throws Exception {
		
		Gson gson = new Gson();
		Type type = new TypeToken<ArrayList<Map<String, String>>>() {}.getType();
		ArrayList<Map<String, String>> postlist = gson.fromJson(jsonData, type);
		
		int mergeId = review.addPost(postlist);
		return mergeId;
	}
	
	@RequestMapping(value = "/updatestep", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int updatestep(@RequestParam String jsonData, @RequestParam String existingCont, @RequestParam String boardId) throws Exception {
		
		Gson gson = new Gson();
		Type type = new TypeToken<ArrayList<Map<String, String>>>() {}.getType();
		ArrayList<Map<String, String>> postlist = gson.fromJson(jsonData, type);
		
		for(int i = 0; i < postlist.size(); i++) {
			System.out.println("[AjaxController] : " + i + "번째 이미지 : " + postlist.get(i).get("postimg"));
			System.out.println("[AjaxController] : " + i + "번째 텍스트 : " + postlist.get(i).get("posttext"));
		}
		int mergeId = review.updatePost(postlist, existingCont, boardId);
		System.out.println("포스트 다 수정된 후 mergeId : " + mergeId);
		return mergeId;
	}
	
	@RequestMapping(value = "/upGcnt", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int upGcnt(HttpServletRequest req, @RequestParam int id) throws Exception {
		
		HttpSession session = req.getSession();
		int aid = 0;
		
		if(session.getAttribute("account") != null) {
			AccountDTO dto = (AccountDTO)session.getAttribute("account");
			aid = dto.getId();
		}
		
		int gval = review.updateGcnt(id);
		return gval;
	}
	
	@RequestMapping(value = "/upBcnt", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int upBcnt(@RequestParam int id) throws Exception {
		int bval = review.updateBcnt(id);
		return bval;
	}
}


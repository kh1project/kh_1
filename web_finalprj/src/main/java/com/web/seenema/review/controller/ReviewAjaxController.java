package com.web.seenema.review.controller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		
//		for(int i = 0; i < smovieimgs.size(); i++) {
//			System.out.println(smovieimgs.get(i));
//		}
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
		
		System.out.println("------------------- 수정 작업 전 기존에 있던 내용들");
		for(int i = 0; i < postlist.size(); i++) {
			System.out.println("[AjaxController] : " + i + "번째 : " + postlist.get(i));
		}
		int mergeId = review.updatePost(postlist, existingCont, boardId);
		System.out.println("------------------- 수정 작업 후 내용들");
		for(int i = 0; i < postlist.size(); i++) {
			System.out.println("[AjaxController] : " + i + "번째 : " + postlist.get(i));
		}
		System.out.println("포스트 다 수정된 후 mergeId : " + mergeId);
		return mergeId;
	}
	
	@RequestMapping(value = "/upGcnt", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int upGcnt(HttpServletRequest req, HttpServletResponse resp, @RequestParam int id) throws Exception {
		
		Cookie[] cookies = req.getCookies();
		int check = 0;
		int gval = review.reviewOne(id).getGcnt();
		String[] cookielist;
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("gcnt")) {
				cookielist = cookie.getValue().split("_");
				int[] nums = Arrays.stream(cookielist).mapToInt(Integer::parseInt).toArray();
				for(int i = 0; i < cookielist.length; i++) {
					if(id == nums[i]) {
						check = 1; break;
					}
				}
				if(check == 0) {
					check = 1;
					cookie.setValue(cookie.getValue() + "_" + (String.valueOf(id)));
					resp.addCookie(cookie);
					gval = review.updateGcnt(id);
				}
			}
		}
		if(check == 0) {
			Cookie cookie1 = new Cookie("gcnt", (String.valueOf(id)));
			resp.addCookie(cookie1);
			gval = review.updateGcnt(id);
		}
		return gval;
	}
	
	@RequestMapping(value = "/upBcnt", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public int upBcnt(HttpServletRequest req, HttpServletResponse resp, @RequestParam int id) throws Exception {
		Cookie[] cookies = req.getCookies();
		int check = 0;
		int bval = review.reviewOne(id).getBcnt();
		
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals("bcnt")) {
				String[] cookielist = cookie.getValue().split("_");
				int[] nums = Arrays.stream(cookielist).mapToInt(Integer::parseInt).toArray();
				for(int i = 0; i < cookielist.length; i++) {
					if(id == nums[i]) {
						check = 1; break;
					}
				}
				if(check == 0) {
					check = 1;
					cookie.setValue(cookie.getValue() + "_" + (String.valueOf(id)));
					resp.addCookie(cookie);
					bval = review.updateBcnt(id);
				}
			}
		}
		if(check == 0) {
			Cookie cookie1 = new Cookie("bcnt", (String.valueOf(id)));
			resp.addCookie(cookie1);
			bval = review.updateBcnt(id);
		}
		return bval;
	}
}


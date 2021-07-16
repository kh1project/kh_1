package com.web.seenema.review.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.service.AccountServiceImpl;
import com.web.seenema.board.dto.BoardSearchDTO;
import com.web.seenema.movie.dto.MyMovieDTO;
import com.web.seenema.movie.service.MovieServiceImpl;
import com.web.seenema.review.dto.ReviewAddDTO;
import com.web.seenema.review.dto.ReviewDTO;
import com.web.seenema.review.dto.ReviewListDTO;
import com.web.seenema.review.dto.ReviewPostDTO;
import com.web.seenema.review.service.ReviewServiceImpl;

@Controller
@RequestMapping(value = "/review")
public class ReviewController {

	@Autowired
	private AccountServiceImpl account;
	@Autowired
	private MovieServiceImpl movie;
	@Autowired
	private ReviewServiceImpl review;
	
	@RequestMapping(value = "")
	public ModelAndView review(HttpServletRequest req, @ModelAttribute String sort, @ModelAttribute BoardSearchDTO search) throws Exception {
		ModelAndView mv = new ModelAndView("review/review");
		
		List<ReviewListDTO> list = null;
		if(search.getBtype() == 0) {
			if(sort != null && sort.equals("like")) {
				list = review.reviewList();
			} else {
				list = review.reviewLikeList();
			}
		} else {
			list = review.reviewSearchList(search);
		}
		
		if(list.size() > 0) {
			for(int i = 0; i < list.size(); i++) {
				List<String> firstPost = review.firstContent(list.get(i).getContents());
				if(firstPost.get(0) == "-1") {
					System.out.println("리뷰 존재하지 않음");
				} else {
					list.get(i).setContents(firstPost.get(0));
					list.get(i).setImgurl(firstPost.get(1));
				}
			}
			mv.addObject("list", list);
			mv.addObject("listsize", list.size());
			mv.addObject("btype", list.get(0).getBtype());
		} else {
			mv.addObject("list", null);
		}
		return mv;
	}
	
	@RequestMapping(value = "/seen")
	public ModelAndView reviewShow(HttpServletRequest req, @ModelAttribute String sort, @ModelAttribute BoardSearchDTO search) throws Exception {
		ModelAndView mv = new ModelAndView("review/reviewSeen");
		
		HttpSession session = req.getSession();
		int aid = 0;
		
		if(session.getAttribute("account") != null) {
			AccountDTO dto = (AccountDTO) session.getAttribute("account");
			aid = dto.getId();
		}
		
		List<ReviewListDTO> list = null;
		if(search.getBtype() == 0) {
			if(sort != null && sort.equals("like")) {
				list = review.reviewSeenList(aid);
			} else {
				list = review.reviewLikeSeenList(aid);
			}
		} else {
			list = review.reviewSearchSeenList(search);
		}
		
		if(list.size() > 0) {
			for(int i = 0; i < list.size(); i++) {
				List<String> firstPost = review.firstContent(list.get(i).getContents());
				if(firstPost.get(0) == "-1") {
					System.out.println("리뷰 존재하지 않음");
				} else {
					list.get(i).setContents(firstPost.get(0));
					list.get(i).setImgurl(firstPost.get(1));
				}
			}
			mv.addObject("list", list);
			mv.addObject("listsize", list.size());
			mv.addObject("btype", list.get(0).getBtype());
		} else {
			mv.addObject("list", null);
		}
		return mv;
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String reviewDetail(Model m, HttpServletRequest req, HttpServletResponse resp, int rid) throws Exception {
		String forward = "";
		Cookie[] cookies = req.getCookies();
		int vcheck = 0;
		
		ReviewDTO data = review.reviewOne(rid);
		
		if(data != null) {
			int vcnt = data.getVcnt();
			
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("vcnt")) {
					String[] cookielist = cookie.getValue().split("_");
					int[] nums = Arrays.stream(cookielist).mapToInt(Integer::parseInt).toArray();
					for(int i = 0; i < cookielist.length; i++) {
						if(rid == nums[i]) {
							vcheck = 1; break;
						}
					}
					if(vcheck == 0) {
						vcheck = 1;
						cookie.setValue(cookie.getValue() + "_" + (String.valueOf(rid)));
						resp.addCookie(cookie);
						vcnt = review.updateVcnt(rid);
					}
				}
			}
			if(vcheck == 0) {
				Cookie cookie1 = new Cookie("vcnt", (String.valueOf(rid)));
				resp.addCookie(cookie1);
				vcnt = review.updateVcnt(rid);
			}
			
			data.setVcnt(vcnt);
			List<ReviewPostDTO> contlist = review.MergePost(data.getContents());
			m.addAttribute("data", data);
			m.addAttribute("contlist", contlist);
			forward = "review/reviewdetail";
		} else {
			forward = "redirect:/review";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView reviewAddGet() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int aid = 1; //session에서 aid 받아와야함. 임시데이터.
		
		List<List<MyMovieDTO>> mywlist = null;
		mywlist = account.mywatchList(aid);
		
		mv.setViewName("review/reviewadd");
		mv.addObject("mywlist", mywlist);
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String reviewAddPost(Model m, @ModelAttribute ReviewAddDTO radto) throws Exception {
		String forward = "";
		
		int aid = 1; //session에서 aid 받아와야함. 임시데이터.
		radto.setAid(aid);

		//addreview 메서드 호출
		boolean result = review.addReview(radto);
		System.out.println("board저장");
				
		if(result) {
			// 작성 성공시 리뷰 리스트로 이동
			forward = "redirect:/review";
		} else {
			// 실패 했을 때 작성 페이지 재전송
			m.addAttribute("data", radto);
			m.addAttribute(forward);
			forward = "forward:/review/add";
		}
		return forward;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String reviewUpdateGet(Model m, int rid) throws Exception {
		String forward = "";
		ReviewDTO data = review.reviewOne(rid);
		if(data != null) {
			List<ReviewPostDTO> contlist = review.MergePost(data.getContents());
			m.addAttribute("data", data);
			m.addAttribute("contlist", contlist);
			forward = "review/reviewupdate";
		} else {
			forward = "redirect:/review";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String reviewUpdatePost(Model m, @ModelAttribute ReviewDTO dto) throws Exception {
		String forward = "";
		
		int aid = 1; //session에서 aid 받아와야함. 임시데이터.
		dto.setAid(aid);
		
		System.out.println("Update Controller 정상 진입 확인");
		System.out.println("-------------------------");
		System.out.println("dto.getContents() : " + dto.getContents());
		System.out.println("dto.getStar() : " + dto.getStar());
		System.out.println("dto.getId() : " + dto.getId());
		System.out.println("-------------------------");

		//updateReview 메서드 호출
		boolean result = review.updateReview(dto);
		System.out.println("updateReview 정상 동작 확인");
		System.out.println("-------------------------");
		System.out.println("업뎃 후 dto.getContents() : " + dto.getContents());
		System.out.println("업뎃 후 dto.getStar() : " + dto.getStar());
		System.out.println("업뎃 후 dto.getId() : " + dto.getId());
		System.out.println("-------------------------");
				
		if(result) {
			// 수정 성공시 리뷰 리스트로 이동
			System.out.println("update 성공");
			forward = "redirect:/review/detail?rid=" + dto.getId();
		} else {
			// 실패 했을 때
			System.out.println("update 실패");
			m.addAttribute("data", dto);
			m.addAttribute(forward);
			forward = "redirect:/review/update?rid=" + dto.getId();
		}
		return forward;
	}
	
	@RequestMapping(value = "/delete")
	public String reviewDelete(Model m, int rid) throws Exception {
		String forward = "";
		
		int aid = 1; //session에서 aid 받아와야함. 임시데이터.
		
		ModelAndView mv = new ModelAndView("review/review.jsp");
		
		boolean result = review.deleteReview(rid);
		if(result) {
			//삭제 성공시 리뷰 리스트로 이동
			System.out.println("delete 성공");
			forward = "redirect:/review";
		} else {
			System.out.println("delete 실패");
			forward = "redirect:/review/detail?rid=" + rid;
		}
		
		mv.addObject("", "");
		
		return forward;
	}
	
}


package com.web.seenema.account.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.service.AccountService;

@Controller
@RequestMapping(value = "/account")
public class AccountController {
	
	@Autowired
	private AccountService account;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "account/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model m, @ModelAttribute AccountDTO dto) throws Exception {
		String forward = "";
		
        System.out.println("이메일 -> "+dto.getEmail());
		System.out.println("암호 -> "+dto.getPassword());
		System.out.println("이름 -> "+dto.getUsername());
		System.out.println("닉네임 -> "+dto.getNickname());
		System.out.println("나이 -> "+dto.getAge());
		System.out.println("성별 -> "+dto.getGender());
		System.out.println("연락처 -> "+dto.getPhone());
		boolean result = account.join(dto);
		if(result) {
			// 가입 성공 했을 때 로그인 페이지로 리다이렉트
			forward = "redirect:/account/login";
		} else {
			// 가입 실패 했을 때 회원가입 페이지 재전송
			m.addAttribute("data", dto);
			m.addAttribute(forward);
			forward = "account/join";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "account/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model m, @ModelAttribute AccountDTO dto, HttpServletRequest req) throws Exception {
		String forward = "";
		account.login(dto);
		
		if(dto.getId() > 0) {
			// dto.getId() 값이 0 보다 큰 경우 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("account", dto);
			session.setAttribute("logined", true);
			forward = "redirect:/";
		} else {
			// dto.getId() 값이 0 보다 크지 않은 경우 로그인 실패
			m.addAttribute("data", dto);
			m.addAttribute("error", "로그인 실패");
			forward = "account/login";
		}
		
		return forward;
	}
	
	/* 로그아웃 컨트롤러 */
	@RequestMapping(value = "/logout")
	public String logout(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/mypage")
	public ModelAndView mypage() {
		ModelAndView mv = new ModelAndView("account/mypage");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/expire")
	public ModelAndView expire() {
		ModelAndView mv = new ModelAndView("account/expire");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public ModelAndView accountGet() {
		ModelAndView mv = new ModelAndView("account/account");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/account", method = RequestMethod.POST)
	public ModelAndView accountPost() {
		ModelAndView mv = new ModelAndView("account/account");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/reservelist")
	public ModelAndView reserveList() {
		ModelAndView mv = new ModelAndView("account/reservelist");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/reservedetail")
	public ModelAndView reserveDetail() {
		ModelAndView mv = new ModelAndView("account/reservedetail");
		mv.addObject("", "");
		
		return mv;
	}
	
	/* 예매취소 */
	@RequestMapping(value = "/예매취소url")
	public ModelAndView reserveCancel() {
		ModelAndView mv = new ModelAndView("account/reservedetail");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/myreview")
	public ModelAndView myReview() {
		ModelAndView mv = new ModelAndView("account/myreview");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/mycomment")
	public ModelAndView myComment() {
		ModelAndView mv = new ModelAndView("account/mycomment");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/myline")
	public ModelAndView myLine() {
		ModelAndView mv = new ModelAndView("account/myline");
		mv.addObject("", "");
		
		return mv;
	}

}


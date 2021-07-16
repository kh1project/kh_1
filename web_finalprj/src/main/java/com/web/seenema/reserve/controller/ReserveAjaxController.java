package com.web.seenema.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/ajax/reserve")
public class ReserveAjaxController {
	
	@RequestMapping(value = "/ex8")
	public ModelAndView ex1() {
		ModelAndView mv = new ModelAndView("views/ex1");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/ex9")
	public ModelAndView ex2() {
		ModelAndView mv = new ModelAndView("views/ex2");
		mv.addObject("", "");
		
		return mv;
	}
	
	@RequestMapping(value = "/ex10")
	public ModelAndView ex3() {
		ModelAndView mv = new ModelAndView("views/ex3");
		mv.addObject("", "");
		
		return mv;
	}
	
}


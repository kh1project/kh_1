package com.web.seenema.reserve.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.reserve.dto.ReservationDTO;
import com.web.seenema.reserve.service.ReserveService;

@Controller
@RequestMapping(value = "/ajax/reserve")
public class ReserveAjaxController {
	
	@Autowired
	private ReserveService ress;
	
	@RequestMapping(value = "/cencel", method = RequestMethod.GET
			, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String reserveCencel(HttpServletRequest req, @RequestParam String orderid) throws Exception {
		JSONObject json = new JSONObject();
		HttpSession session = req.getSession();
		AccountDTO adto = (AccountDTO)session.getAttribute("account");
		System.out.println(adto.getId());
		List<ReservationDTO> reslist = ress.Reservelist(orderid, adto.getId());
		
		int del = 0;
		int cencel = 0;
		for(int i = 0; i < reslist.size(); i++) {
			del = ress.ResDelete(reslist.get(i).getId());
			System.out.println(reslist.get(i).getId());
			if(del == 1) {
				cencel = ress.Seatcencel(reslist.get(i).getSid());
				System.out.println(reslist.get(i).getSid());
				if(cencel == 1) {
					json.put("result", true);
				} else {
					json.put("result", false);
				}
			} else {
				json.put("result", false);
			}
		}
		
		return json.toJSONString();
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


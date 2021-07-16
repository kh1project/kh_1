package com.web.seenema.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.seenema.dto.BoxofficeDTO;
import com.web.seenema.service.MainService;

@Controller
@RequestMapping(value = "/index")
public class IndexController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpServletResponse resp) {
		ModelAndView mv = new ModelAndView("index");
		
		// 메인 carousel에 배치될 랜덤한 영화ID 3개 받아오기 & 담기
		mv.addObject("carousel", service.getCarousel());
		
		// 메인 박스오피스에 배치될 4순위의 List<영화ID, like수, summary> 받아오기
		List<BoxofficeDTO> boxoffice = service.getBoxOffice();
		
		// summary 편집하기
		for(BoxofficeDTO item: boxoffice) {
			String summary = item.getSummary();
			if(summary.contains("…")) {
				summary = summary.split("…")[0] + "…";
				item.setSummary(summary);
			} else {
				if(summary.length() > 216) {
					item.setSummary(summary.substring(0, 216) + "…");
				}
			}
		}
		mv.addObject("boxoffice", boxoffice);
		
		return mv;
	}	
}

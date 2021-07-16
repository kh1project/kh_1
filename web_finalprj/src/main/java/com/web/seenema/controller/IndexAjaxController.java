package com.web.seenema.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.seenema.service.MainService;

@Controller
@RequestMapping(value = "/mainAjax")
public class IndexAjaxController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	@ResponseBody
	public JSONObject like(@RequestParam int id) {
		JSONObject json = new JSONObject();
		if(service.incGcnt(id)) {
			json.put("res", "success");
			json.put("gcnt", service.getGcnt(id));
		} else {
			json.put("res", "fail");
		}
		return json;
	}
}

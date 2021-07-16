package com.web.seenema.line.controller;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.seenema.line.dto.LineAddDTO;
import com.web.seenema.line.dto.LineDTO;
import com.web.seenema.line.dto.SettingDataDTO;
import com.web.seenema.line.service.LinePagingService;
import com.web.seenema.line.service.LineService;

@RestController
@RequestMapping(value = "/lineajax")
public class LineAjaxController {
	
	@Autowired
	private LineService service;
	
	@Autowired
	private LinePagingService pagingService;
	
	
	/**------- 페이징 처리 -------*/
	@RequestMapping(value = "paging")
	public JSONObject paging(
				@RequestParam int selected_page,
				@RequestParam int mid,
				@RequestParam int totalrow,
				@RequestParam int max_page) {

		int start = 10 * (selected_page - 1) + 1;
		int end;
		if(selected_page == max_page) {
			end = totalrow;
		} else {
			end = start + 9;
		}

		// 페이지 맞는 데이터 가져오기
		SettingDataDTO init = new SettingDataDTO(mid, start, end);
		List<LineDTO> pgdatas = pagingService.getPgDatas(init);

		// 아이디 처리
		for(LineDTO line : pgdatas) {
			String email = line.getEmail().split("@")[0];
			email = email.substring(0, email.length() - 2);
			email += "**";
			line.setEmail(email);
		}
		
		JSONObject json = new JSONObject();
		json.put("pgdatas", pgdatas);
		
		return json;
	}
	
	
	
	@RequestMapping(value = "/add")
	public JSONObject add(@ModelAttribute LineAddDTO dto) {
				
		JSONObject json = new JSONObject();
		if(service.add(dto)) {
			
			LineDTO line = service.getLine(dto.getId());
			String email = line.getEmail().split("@")[0];
			email = email.substring(0, email.length() - 2);
			email += "**";
			line.setEmail(email);

			json.put("res", "success");
			json.put("line", line);
		} else {
			json.put("res", "fail");
		}
		return json;
	}
	
	@RequestMapping(value = "/incGcnt")
	public JSONObject incGcnt(@RequestParam int lid) {
		
		JSONObject json = new JSONObject();
		
		int gcnt = service.incGcnt(lid);
		if(gcnt != -1) {
			json.put("res", "success");
			json.put("gcnt", gcnt);
		} else {
			json.put("res", "fail");
		}
		return json;
	}
	
	@RequestMapping(value = "/delete")
	public JSONObject delete(@RequestParam int lid) {
		
		JSONObject json = new JSONObject();
		
		if(service.delete(lid)) {
			json.put("result", "success");
			//json.put("lid", lid);
		} else {
			json.put("result", "fail");
		}
		return json;
	}
	
//	오류난 부분 해결 후 주석해제 필요
	public void temp() {
		int pgNum = 0;
		int max_pgNum = 0;
		int mid = 0;
		// 전체 데이터 수									// 한 페이지에 출력하고픈 데이터 수량
		int totalrow = pagingService.totalRow(mid);		int list_cnt = 10;

		// 한 페이지에 출력하고픈 페이지 수량(홀수 전제)		// 계산에 자주 쓰이는 값을 변수로
		int pg_cnt = 3;							int half_pg_cnt = pg_cnt / 2;
		
		//---------------------------------------------------------------------//
		
		// pgDatas 추출
		int start = 10 * (pgNum - 1) + 1;
		int end;
		if(pgNum == max_pgNum) {
			end = totalrow;
		} else {
			end = start + 9;
		}
		SettingDataDTO init = new SettingDataDTO(mid, start, end);
		List<LineDTO> pgDatas = pagingService.getPgDatas(init);
		
		//---------------------------------------------------------------------//
				
		JSONObject json = new JSONObject();
//		json.put("pgDatas", pgDatas);
		//json.put("list_cnt", list_cnt);
		//json.put("max_pgNum", max_pgNum);
	}
	
}


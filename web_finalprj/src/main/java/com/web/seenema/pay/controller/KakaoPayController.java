package com.web.seenema.pay.controller;

import java.util.ArrayList;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.service.AccountService;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.service.MovieService;
import com.web.seenema.pay.dto.PaymentDTO;
import com.web.seenema.reserve.dto.BranchTheaterDTO;
import com.web.seenema.reserve.dto.PayInfoDTO;
import com.web.seenema.reserve.dto.ReservationDTO;
import com.web.seenema.reserve.dto.SeatDTO;
import com.web.seenema.reserve.dto.TimeInfoDTO;
import com.web.seenema.reserve.service.ReserveService;

@Controller
@RequestMapping(value = "/kakaopay")
public class KakaoPayController {
	
	@Autowired
	private ReserveService ress;
	
	@Autowired
	private MovieService movies;
	
	@Autowired
	private AccountService account;
	
	@RequestMapping(value = "",  method= RequestMethod.POST)
	public String payment(HttpServletRequest req,
			Model m, @ModelAttribute PayInfoDTO pidto,
			@ModelAttribute PaymentDTO pdto) throws Exception {
		String forward = "";
		// 주문자가 결제 요청한 상품의 정보를 확인 후 카카오페이 서버에 상품관련 결제준비 정보 전송
		HttpSession session = req.getSession();
		
		if(session.getAttribute("account") == null) {
			forward = "account/login";
		} else {
			// 상품 정보를 확인하기 위한 코드 작성 시작
			int mid = ress.getMovieId(pidto.getTitle());
			int mtid = ress.getmtid(mid, pidto.getLocation(), pidto.getName(), pidto.getTname());
			
			// accountid 가져오기
			AccountDTO adto = (AccountDTO)session.getAttribute("account");
			List<MovieDTO> moviedata = movies.getMovies(mid);
			List<TimeInfoDTO> timelist = ress.getTimelist(mtid, pidto.getMoviedate(), pidto.getStarttime(), pidto.getEndtime());
			
			Date date = new Date();
			SimpleDateFormat today = new SimpleDateFormat("yyMMdd");
			String orderdate = today.format(date);
			String timeid = Integer.toString(timelist.get(0).getId());
			String seats = pidto.getSeat();
			String seat = "";
			String[] seatinfo = new String[5];
			if(seats.contains(",")) {
				seatinfo = seats.split(", ");
				seat = seatinfo[0];
			} else {
				seat = seats.charAt(0) + seats.substring(1, seats.length());
			}
			
			// 예매번호 : 년월일 + 시간 + 영화정보 + 좌석정보
			String orderid = orderdate + timeid + mid + seat;
			// 상품 정보를 확인하기 위한 코드 작성 끝
			
			// 카카오페이 서버 결제준비 정보 전송 시작
			MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
			param.add("cid", "TC0ONETIME");
			param.add("partner_order_id", orderid);
			param.add("partner_user_id", adto.getNickname());
			param.add("item_name", pidto.getTitle());
			param.add("quantity", Integer.toString(pidto.getPeple()));
			param.add("total_amount", Integer.toString(pidto.getTotal()));
			int tax_free = (pidto.getTotal() / 10 * 9);
			param.add("tax_free_amount", Integer.toString(tax_free));
			param.add("approval_url", "http://localhost/seenema/kakaopay/success");
			param.add("cancel_url", "http://localhost/seenema/kakaopay/cancel");
			param.add("fail_url", "http://localhost/seenema/kakaopay/fail");
			
			// System.out.println("요청 데이터 : " + param.toString());
			
			// REST API를 사용하여 카카오페이 서버에 위의 데이터 전송
			RestTemplate rest = new RestTemplate();
			rest.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
			
			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", "KakaoAK d89a7a4709ce5b449b4cd03acdce548a");
			headers.set("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
			
			HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(param, headers);
			
			String url = "https://kapi.kakao.com/v1/payment/ready";
			ResponseEntity<String> resp = rest.postForEntity(url, entity, String.class);
			
			// System.out.println("응답 데이터 : " + resp.getBody());
			
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> resp_data = mapper.readValue(resp.getBody(), HashMap.class);
			
			String tid = (String)resp_data.get("tid");  // 데이터 베이스에 저장해야 함
			String redirect_pc = (String)resp_data.get("next_redirect_pc_url");
			
			// 임시로 작성한 코드(WAS 전역 메모리에 저장) 반드시 데이터베이스로 저장하도록 해야함.
			req.getServletContext().setAttribute("tid", tid);
			req.getServletContext().setAttribute("mtid", mtid);
			req.getServletContext().setAttribute("partner_order_id", orderid);
			req.getServletContext().setAttribute("movieid", moviedata.get(0).getId());
			req.getServletContext().setAttribute("timeid", timelist.get(0).getId());
			req.getServletContext().setAttribute("Moviedate", pidto.getMoviedate());
			req.getServletContext().setAttribute("Starttime", pidto.getStarttime());
			req.getServletContext().setAttribute("Endtime", pidto.getEndtime());
			req.getServletContext().setAttribute("seat", pidto.getSeat());
			req.getServletContext().setAttribute("rcnt", pidto.getPeple());
			req.getServletContext().setAttribute("totalpay", pidto.getTotal());
			req.getServletContext().setAttribute("payment", pidto.getMethodPay());
			
			forward = "redirect:" + redirect_pc;
			// 카카오페이 서버 결제준비 정보 전송 끝
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/success")
	public String success(@RequestParam String pg_token,
			HttpServletRequest req, Model m, @ModelAttribute ReservationDTO resDTO) throws Exception {
		String forward = "";
		HttpSession session = req.getSession();
		String orderid = (String)req.getServletContext().getAttribute("partner_order_id");
		int mtid = (int)req.getServletContext().getAttribute("mtid");
		int rcnt = (int)req.getServletContext().getAttribute("rcnt");
		int totalpay = (int)req.getServletContext().getAttribute("totalpay");
		char payment = ((String)req.getServletContext().getAttribute("payment")).charAt(0);
		
		// 상영관 정보
		List<BranchTheaterDTO> btlist = ress.getmovieTheater(mtid);
		
		// 영화 정보
		int mid = (int)req.getServletContext().getAttribute("movieid");
		List<MovieDTO> moviedata = movies.getMovies(mid);
		
		// 시간 정보
		String rdate = (String)req.getServletContext().getAttribute("Moviedate");
		String Starttime = (String)req.getServletContext().getAttribute("Starttime");
		String Endtime = (String)req.getServletContext().getAttribute("Endtime");
		List<TimeInfoDTO> timelist = ress.getTimelist(mtid, rdate, Starttime, Endtime);
		
		int timeid = timelist.get(0).getId();
		
		// 좌석 정보
		String seats = (String)req.getServletContext().getAttribute("seat");
		// System.out.println("pidto.getSeat : " + seats);
		String[] seatinfo = new String[5];
		char row = ' ';
		int col = 0;
		
		// accountid 가져오기
		AccountDTO adto = (AccountDTO)session.getAttribute("account");
		String username = adto.getNickname();
		int userid = adto.getId();
		
		// Map에 정보 담기.
		Map<String, Object> resmap = new HashMap<String, Object>();
		resmap.put("orderid", orderid);
		resmap.put("rcnt", rcnt);
		resmap.put("totalpay", totalpay);
		resmap.put("payment", (String)req.getServletContext().getAttribute("payment"));
		
		// 예매 하기.
		MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
		param.add("cid", "TC0ONETIME");
		param.add("tid", (String)req.getServletContext().getAttribute("tid"));
		param.add("partner_order_id", orderid);
		param.add("partner_user_id", username);
		param.add("pg_token", pg_token);
		
		RestTemplate rest = new RestTemplate();
		rest.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK d89a7a4709ce5b449b4cd03acdce548a");
		headers.set("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(param, headers);
		
		String url = "https://kapi.kakao.com/v1/payment/approve";
		ResponseEntity<String> resp = rest.postForEntity(url, entity, String.class);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> resp_data = mapper.readValue(resp.getBody(), HashMap.class);
		int sid = 0;
		if(resp.getStatusCode() == HttpStatus.OK) {
			if(seats.contains(",")) {
				// 좌석이 2개 이상일 때
				seatinfo = seats.split(", ");
				for(int i = 0; i < seatinfo.length; i++) {
					row = seatinfo[i].charAt(0);
					col = Integer.parseInt(seatinfo[i].substring(1, seatinfo[i].length()));
					sid = ress.selectSeat(timeid, row, col);
					ress.updateSeat(sid);
					ress.insertReserve(orderid, sid, timeid, userid, rcnt, totalpay, payment);
				}
				forward = "kakaopay/success";
			} else {
				// 좌석이 1개 일 때
				row = seats.charAt(0);
				col = Integer.parseInt(seats.substring(1, seats.length()));
				sid = ress.selectSeat(mtid, row, col);
				ress.updateSeat(sid);
				ress.insertReserve(orderid, sid, timeid, userid, rcnt, totalpay, payment);
				forward = "kakaopay/success";
			}
		} else if(resp.getStatusCode() == HttpStatus.BAD_REQUEST) {
			forward = "kakaopay/fail";
		}
		
		// System.out.println(resp.getBody());
		m.addAttribute("resmap", resmap);
		m.addAttribute("seats", seats);
		m.addAttribute("btlist", btlist);
		m.addAttribute("moviedata", moviedata);
		m.addAttribute("timelist", timelist);
		return forward;
	}
}

package com.web.seenema.movie.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.seenema.account.dto.AccountDTO;
import com.web.seenema.account.service.AccountService;
import com.web.seenema.line.dto.LineDTO;
import com.web.seenema.line.dto.PagingInfoDTO;
import com.web.seenema.line.service.LinePagingService;
import com.web.seenema.movie.dao.MovieDAO;
import com.web.seenema.movie.dto.AddmovieDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.dto.MovieLikeDTO;
import com.web.seenema.movie.service.MovieService;

@Controller
@RequestMapping(value = "/")
public class MovieController {
    
    @Autowired
    private MovieService service;
    
    @Autowired
    private MovieDAO mdao;
    
    @Autowired
    private AccountService aservice;
    
    @Autowired
    private LinePagingService pagingService;
    
    @RequestMapping(value = "/movie")
    public String movie(Model model, HttpServletRequest request, @RequestParam(required = false) String sort) {
        
        List<MovieDTO> movieList;
        int num = 1;
        // 1 -> 예매율순  2 -> 추천순  3 -> 별점순
        if(sort == null)
            movieList = service.getAllMovies(num);
        else {
            num = Integer.parseInt(sort);
            movieList = service.getAllMovies(num);
        }
                 
        int aid = service.getAid(request);
        Boolean isAdmin = aservice.adminCheck(aid); //관리자 계정인지 확인용
        Map<Integer, String> reserveRating = service.getReserveRate();
        List<MovieLikeDTO> likeList = service.getMovieLikeList(aid);
        Map<Integer, Integer> gcnt = service.getGcnt();
        List<MovieImageDTO> mainposter = service.getOnePoster();
        
        model.addAttribute("movieList", movieList);
        model.addAttribute("reserveRating", reserveRating);
        model.addAttribute("likeList", likeList);
        model.addAttribute("sort", num);
        model.addAttribute("gcnt", gcnt);
        model.addAttribute("mainposter", mainposter);
        model.addAttribute("isAdmin", isAdmin);
        
        return "movie/movie";
    }
    
    @RequestMapping(value = "/movie/detail")
    public String movieDetail(Model model, @RequestParam(required=false) Integer mid, HttpServletRequest request) {
        
        if(mid == null) 
            mid = 1;
             
        int aid = service.getAid(request);
        
        MovieDTO dto = mdao.getMovie(mid); // 영화정보 1개 가져오기
        Map<Integer, String> reserveRating = service.getReserveRate(); //예매율
        Map<Integer, Integer> gcnt = service.getGcnt(); // 좋아요 갯수 가져오기(전체)
        List<MovieLikeDTO> likeList = service.getMovieLikeList(aid); // 좋아요 받은 영화 리스트 가져오기
        List<MovieImageDTO> mainposter = service.getOnePoster();
        
        model.addAttribute("movie", dto);        
        model.addAttribute("reserveRating", reserveRating.get(mid));
        model.addAttribute("likeList", likeList);
        model.addAttribute("gcnt", gcnt);
        model.addAttribute("mainposter", mainposter);
        
        /** 아영님 코드 시작 */
        // 1page 에 출력할 한줄평 데이터
        List<LineDTO> initLinelist = pagingService.initLinelist(mid);
        
        // 아이디 처리
        for(LineDTO line : initLinelist) {
            String email = line.getEmail().split("@")[0];
            email = email.substring(0, email.length() - 2);
            email += "**";
            line.setEmail(email);
        }
        
        // 전체 데이터 수
        int totalrow = pagingService.totalRow(mid);
        
        // 한 페이지에 출력하고픈 데이터 수량
        int list_cnt = 10;
                
        // 최대 페이지 번호
        int max_page = 1;
        if(totalrow != 0) {
            if (totalrow % list_cnt == 0) {
                max_page = totalrow / list_cnt;
            } else {
                max_page = (totalrow / list_cnt) + 1;
            }
        }
        
        PagingInfoDTO info = new PagingInfoDTO();
        info.setTotalrow(totalrow);
        info.setMax_page(max_page);
        
        
        model.addAttribute("initLinelist", initLinelist);
        model.addAttribute("initPagingInfo", info);
        
        /** 아영님 코드 끝 */

        return "movie/moviedetail";
    }
    
    @RequestMapping(value = "/movie/detail/comment")
    public String movieComment(Model model, @RequestParam(required=false) Integer mid, HttpServletRequest request) {

        if(mid == null) 
            mid = 1;
        
        int aid = service.getAid(request);
        MovieDTO dto = mdao.getMovie(mid); // 영화정보 1개 가져오기
        Map<Integer, String> reserveRating = service.getReserveRate(); //예매율
        Map<Integer, Integer> gcnt = service.getGcnt(); // 좋아요 갯수 가져오기(전체)
        List<MovieLikeDTO> likeList = service.getMovieLikeList(aid); // 좋아요 받은 영화 리스트 가져오기
        List<MovieImageDTO> mainposter = service.getOnePoster();
        
        model.addAttribute("movie", dto);        
        model.addAttribute("reserveRating", reserveRating.get(mid));
        model.addAttribute("likeList", likeList);
        model.addAttribute("gcnt", gcnt);
        model.addAttribute("mainposter", mainposter);
        
        /** 아영님 코드 시작 */
        // 1page 에 출력할 한줄평 데이터
        List<LineDTO> initLinelist = pagingService.initLinelist(mid);
        
        // 아이디 처리
        for(LineDTO line : initLinelist) {
            String email = line.getEmail().split("@")[0];
            email = email.substring(0, email.length() - 2);
            email += "**";
            line.setEmail(email);
        }
        
        // 전체 데이터 수
        int totalrow = pagingService.totalRow(mid);
        
        // 한 페이지에 출력하고픈 데이터 수량
        int list_cnt = 10;
                
        // 최대 페이지 번호
        int max_page = 1;
        if(totalrow != 0) {
            if (totalrow % list_cnt == 0) {
                max_page = totalrow / list_cnt;
            } else {
                max_page = (totalrow / list_cnt) + 1;
            }
        }
        
        PagingInfoDTO info = new PagingInfoDTO();
        info.setTotalrow(totalrow);
        info.setMax_page(max_page);
        
        
        model.addAttribute("initLinelist", initLinelist);
        model.addAttribute("initPagingInfo", info);
        
        /** 아영님 코드 끝 */

        return "movie/moviecomment";
    }
    
    @RequestMapping(value = "/movie/detail/post")
    public String moviePost(Model model, @RequestParam(required=false) Integer mid, HttpServletRequest request) {

        if(mid == null)
            mid = 1;
        
        int aid = service.getAid(request);
        
        MovieDTO dto = mdao.getMovie(mid); // 영화정보 1개 가져오기
        Map<Integer, String> reserveRating = service.getReserveRate(); //예매율
        Map<Integer, Integer> gcnt = service.getGcnt(); // 좋아요 갯수 가져오기(전체)
        List<MovieLikeDTO> likeList = service.getMovieLikeList(aid); // 좋아요 받은 영화 리스트 가져오기
        List<MovieImageDTO> mainposter = service.getOnePoster();
        
        model.addAttribute("movie", dto);        
        model.addAttribute("reserveRating", reserveRating.get(mid));
        model.addAttribute("likeList", likeList);
        model.addAttribute("gcnt", gcnt);
        model.addAttribute("mainposter", mainposter);
        
        return "movie/moviepost";
    }
    
    @RequestMapping(value = "/movie/detail/stillcut")
    public String movieStillcut(Model model, @RequestParam(required=false) Integer mid, HttpServletRequest request) {

        if(mid == null)
            mid = 1;        
                
        int aid = service.getAid(request);
        
        MovieDTO dto = mdao.getMovie(mid); // 영화정보 1개 가져오기
        Map<Integer, String> reserveRating = service.getReserveRate(); //예매율
        Map<Integer, Integer> gcnt = service.getGcnt(); // 좋아요 갯수 가져오기(전체)
        List<MovieLikeDTO> likeList = service.getMovieLikeList(aid); // 좋아요 받은 영화 리스트 가져오기
        List<MovieImageDTO> moviePosters = service.getMoviePosters(mid);
        List<MovieImageDTO> movieStillcuts = service.getMovieStillcuts(mid);
        List<MovieImageDTO> mainposter = service.getOnePoster();
        
        model.addAttribute("movie", dto);        
        model.addAttribute("reserveRating", reserveRating.get(mid));
        model.addAttribute("likeList", likeList);
        model.addAttribute("gcnt", gcnt);
        model.addAttribute("moviePosters", moviePosters);
        model.addAttribute("movieStillcuts", movieStillcuts);
        model.addAttribute("mainposter", mainposter);
        

        return "movie/moviestillcut";
    }
    
    @RequestMapping(value = "/movie/edit")
    public String movieEdit(Model model, @RequestParam("mid") int mid) {        
        System.out.println(mid);
        
        return "movie/movieEdit";
    }
    
    @RequestMapping(value = "/movie/add")
    public String movieAdd(Model model, HttpServletRequest request) {
   	
    	int aid = service.getAid(request); 
    	
    	if(!aservice.adminCheck(aid))
    		return "redirect:/movie";
    	
        int movieNum = service.getLastMovieNum()+1;
        model.addAttribute("mid", movieNum);
        return "movie/movieadd";
    }
    
    //영화 등록 로직
    @RequestMapping(value = "/movie/add/register")
    public String movieAdd(Model model, 
    		@RequestParam("poster") MultipartFile[] poster,
			@RequestParam("stillcut") MultipartFile[] stillcut, 
			@ModelAttribute MovieDTO dto,
			HttpServletRequest req) throws Exception {
		
    	service.insertMovieData(dto);
    	service.posterUpload(poster, dto.getId(), req);
    	service.stillcutUpload(stillcut, dto.getId(), req);
	
		return "redirect:/movie/detail?mid="+dto.getId();
	}
    
    @RequestMapping(value = "/movie/getinfo")
    public String getinfo(Model model) {
        
        return "redirect:/movie/detail";
    }
    
}
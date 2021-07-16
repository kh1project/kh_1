package com.web.seenema.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.reserve.dto.BranchDTO;
import com.web.seenema.reserve.dto.BranchTheaterDTO;
import com.web.seenema.reserve.dto.ReservationDTO;
import com.web.seenema.reserve.dto.SeatDTO;
import com.web.seenema.reserve.dto.TimeDTO;
import com.web.seenema.reserve.dto.TimeInfoDTO;
import com.web.seenema.reserve.repository.ReserveRepository;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveRepository dao;

	@Override
	public List<MovieDTO> movieList(String location, String name) throws Exception {
		// 선택한 지역->지점에서 상영중인 영화 리스트 뽑기
		return dao.selectMovieList(location, name);
	}

	@Override
	public List<BranchDTO> branchList(String location) throws Exception {
		// 지역 선택시 해당 지역에 있는 지점 리스트 뽑기
		List<BranchDTO> branchlist = dao.selectBranchList(location);
		return branchlist;
	}

	@Override
	public List<TimeDTO> timeTableInfo(String location, String name,
			int rating, String title, String moviedate) throws Exception {
		System.out.println("service " +
			dao.selectTimeList(location, name, rating, title, moviedate));
		return dao.selectTimeList(location, name, rating, title, moviedate);
	}

	@Override
	public Map<String, Object> seatcntlist(int tid) throws Exception {
		// 좌석 수 List
		Map<String, Object> seatlist = dao.selectSeatCnt(tid);
		return seatlist;
	}
	
	@Override
	public List<SeatDTO> seatList(int timeid) throws Exception {
		// 좌석 list
		List<SeatDTO> seatlist = dao.selectSeatAll(timeid);
		return seatlist;
	}

	@Override
	public int getprice(int id) throws Exception {
		// 영화 가격 가져오기
		return dao.searchprice(id);
	}

	@Override
	public List<BranchTheaterDTO> getmovieTheater(int tid) throws Exception {
		// 상영관 List
		List<BranchTheaterDTO> data = dao.selectMovieTheater(tid);
		return data;
	}

	@Override
	public int updateSeat(int sid) throws Exception {
		// 좌석 'n'-> 'y' 업데이트
		return dao.updateSeat(sid);
	}
	
	@Override
	public int Seatcencel(int sid) throws Exception {
		return dao.cencelSeat(sid);
	}

	@Override
	public int getMovieId(String title) throws Exception {
		// 영화 아이디 값 가져오기.
		return dao.getMovieId(title);
	}

	@Override
	public int getmtid(int mid, String location, String name, String tname) throws Exception {
		// 영화 상영관 아이디 값 가져오기
		return dao.getMTid(mid, location, name, tname);
	}
	
	@Override
	public int getBranchTheater(String location, String name, String tname) throws Exception {
		return dao.getBranchTheater(location, name, tname);
	}

	@Override
	public List<TimeInfoDTO> getTimelist(int mtid, String moviedate, String starttime, String endtime) throws Exception {
		// 시간 List 가져오기
		return dao.getTimelist(mtid, moviedate, starttime, endtime);
	}

	@Override
	public int insertReserve(String orderid, int sid, int timeid, int userid, int rcnt,
			int totalpay, char payment) throws Exception {
		return dao.insertReserve(orderid, sid, timeid, userid, rcnt, totalpay, payment);
	}

	@Override
	public int ResDelete(int id) throws Exception {
		return dao.deletReservation(id);
	}

	@Override
	public List<ReservationDTO> Reservelist(String orderid, int aid) throws Exception {
		return dao.Reservelist(orderid, aid);
	}

	@Override
	public List<SeatDTO> getSeatlist(int id) throws Exception {
		// 좌석 정보 가져오기
		return dao.Seatlist(id);
	}
	
}

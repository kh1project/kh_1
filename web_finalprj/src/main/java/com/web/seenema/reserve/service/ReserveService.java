package com.web.seenema.reserve.service;

import java.util.List;
import java.util.Map;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.reserve.dto.BranchDTO;
import com.web.seenema.reserve.dto.BranchTheaterDTO;
import com.web.seenema.reserve.dto.ReservationDTO;
import com.web.seenema.reserve.dto.SeatDTO;
import com.web.seenema.reserve.dto.TimeDTO;
import com.web.seenema.reserve.dto.TimeInfoDTO;

public interface ReserveService {
	public List<MovieDTO> movieList(String location, String name) throws Exception;
	public List<BranchDTO> branchList(String location) throws Exception;
	public List<TimeDTO> timeTableInfo(String location, String name, int rating, String title, String moviedate) throws Exception;
	public Map<String, Object> seatcntlist(int tid) throws Exception;
	public List<SeatDTO> seatList(int timeid) throws Exception;
	public int getprice(int id) throws Exception;
	public List<BranchTheaterDTO> getmovieTheater(int tid) throws Exception;
	public int updateSeat(int sid) throws Exception;
	public int Seatcencel(int sid) throws Exception;
	public int insertReserve(String orderid, int sid, int timeid, int userid, int rcnt, int totalpay, char payment) throws Exception;
	public int getMovieId(String title) throws Exception;
	public int getmtid(int mid, String location, String name, String tname) throws Exception;
	public int getBranchTheater(String location, String name, String tname) throws Exception;
	public List<TimeInfoDTO> getTimelist(int mtid, String moviedate, String starttime, String endtime) throws Exception;
	public int ResDelete(int id) throws Exception;
	public List<ReservationDTO> Reservelist(String orderid, int aid) throws Exception;
	public List<SeatDTO> getSeatlist(int id) throws Exception;
	
	
}

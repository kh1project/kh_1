package com.web.seenema.reserve.repository;

import java.util.List;
import java.util.Map;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.reserve.dto.BranchDTO;
import com.web.seenema.reserve.dto.BranchTheaterDTO;
import com.web.seenema.reserve.dto.RstepDTO;
import com.web.seenema.reserve.dto.SeatDTO;
import com.web.seenema.reserve.dto.TableRstepDTO;
import com.web.seenema.reserve.dto.TimeDTO;
import com.web.seenema.reserve.dto.TimeInfoDTO;

public interface ReserveRepository {
	//public List<Map<String, Object>> selectMovieList() throws Exception;
	public List<MovieDTO> selectMovieList(String location, String name) throws Exception;
	public List<TimeDTO> selectTimeList(String location, String name,
			int rating, String title, String moviedate) throws Exception;
	public List<BranchDTO> selectBranchList(String location) throws Exception;
	public List<TableRstepDTO> selectRestInfo(TableRstepDTO dto) throws Exception;
	public List<Map<String, Object>> selectSeatCnt(RstepDTO dto) throws Exception;
	public List<Map<String, Object>> selectSeatFrame(RstepDTO dto) throws Exception;
	public List<Integer> selectRseatList(RstepDTO dto) throws Exception;
	public boolean updateSeat(RstepDTO dto) throws Exception;
	public int selectPrice(RstepDTO dto) throws Exception;
	public Map<String, Object> selectSeatCnt(int tid) throws Exception;
	public List<SeatDTO> selectSeatAll(int timeid) throws Exception;
	public int searchprice(int id) throws Exception;
	public List<BranchTheaterDTO> selectMovieTheater(int tid) throws Exception;
	public int selectSeat(int id, char row, int col) throws Exception;
	public int updateSeat(int sid) throws Exception;
	public int insertReserve(String orderid, int sid, int timeid, int userid, int rcnt, int totalpay, char payment) throws Exception;
	public int getMovieId(String title) throws Exception;
	public int getBranchTheater(String location, String name, String tname) throws Exception;
	public int getMTid(int mid, String location, String name, String tname) throws Exception;
	public List<TimeInfoDTO> getTimelist(int mtid, String moviedate, String starttime, String endtime) throws Exception;
}

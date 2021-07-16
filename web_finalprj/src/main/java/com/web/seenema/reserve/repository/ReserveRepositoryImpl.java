package com.web.seenema.reserve.repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.reserve.dto.BranchDTO;
import com.web.seenema.reserve.dto.BranchTheaterDTO;
import com.web.seenema.reserve.dto.ReservationDTO;
import com.web.seenema.reserve.dto.RstepDTO;
import com.web.seenema.reserve.dto.SeatDTO;
import com.web.seenema.reserve.dto.SeatSelectDTO;
import com.web.seenema.reserve.dto.TableRstepDTO;
import com.web.seenema.reserve.dto.TimeDTO;
import com.web.seenema.reserve.dto.TimeInfoDTO;

@Repository
public class ReserveRepositoryImpl implements ReserveRepository{

	@Autowired
	SqlSession sqlSession;

//	@Override
//	public List<Map<String, Object>> selectMovieList() throws Exception {
//		return sqlSession.selectList("reserveMapper.movieAll_list");
//	}
	
	@Override
	public List<MovieDTO> selectMovieList(String location, String name) throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("location", location);
		data.put("name", name);
		return sqlSession.selectList("reserveMapper.movieAll_list", data);
	}

	@Override
	public List<TimeDTO> selectTimeList(String location, String name,
			int rating, String title, String moviedate) throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("location", location);
		data.put("name", name);
		data.put("rating", rating);
		data.put("title", title);
		data.put("moviedate", moviedate);
		System.out.println("repo" + data);
		return sqlSession.selectList("reserveMapper.timelist", data);
	}
	
	@Override
	public List<BranchDTO> selectBranchList(String location) throws Exception {
		return sqlSession.selectList("reserveMapper.branchlist", location);
	}

	@Override
	public List<TableRstepDTO> selectRestInfo(TableRstepDTO dto) throws Exception {
		return null;
	}

	@Override
	public List<Map<String, Object>> selectSeatCnt(RstepDTO dto) throws Exception {
		return null;
	}

	@Override
	public List<Map<String, Object>> selectSeatFrame(RstepDTO dto) throws Exception {
		return null;
	}

	@Override
	public List<Integer> selectRseatList(RstepDTO dto) throws Exception {
		return null;
	}

	@Override
	public boolean updateSeat(RstepDTO dto) throws Exception {
		return false;
	}

	@Override
	public int selectPrice(RstepDTO dto) throws Exception {
		return 0;
	}

	@Override
	public Map<String, Object> selectSeatCnt(int tid) throws Exception {
		int scnt = sqlSession.selectOne("reserveMapper.seatcnt", tid);
		int s_leftcnt = sqlSession.selectOne("reserveMapper.s_leftcnt", tid);
		
		Map<String, Object> seatmap = new HashMap<String, Object>();
		
		seatmap.put("scnt", scnt);
		seatmap.put("s_leftcnt", s_leftcnt);
		
		return seatmap;
	}
	
	@Override
	public List<SeatDTO> selectSeatAll(int timeid) throws Exception {
		List<SeatDTO> seatdata = sqlSession.selectList("reserveMapper.seat_all", timeid);
		
		return seatdata;
	}

	@Override
	public int searchprice(int id) throws Exception {
		int pay = sqlSession.selectOne("reserveMapper.pay_all", id);
		return pay;
	}

	@Override
	public List<BranchTheaterDTO> selectMovieTheater(int tid) throws Exception {
		List<BranchTheaterDTO> mtlist = sqlSession.selectList("reserveMapper.search_Branch", tid);
		
		return mtlist;
	}

	@Override
	public int selectSeat(int tid, char row, int col) throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("tid", tid);
		data.put("row", row);
		data.put("col", col);
		List<SeatDTO> sdto = sqlSession.selectList("reserveMapper.checkseat", data);
		return sdto.get(0).getId();
	}

	@Override
	public int updateSeat(int sid) throws Exception{
		return sqlSession.update("reserveMapper.updateSeat", sid);
	}

	@Override
	public int getBranchTheater(String location, String name, String tname) throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("location", location);
		data.put("name", name);
		data.put("tname", tname);
		return sqlSession.selectOne("reserveMapper.getTid", data);
	}

	@Override
	public int getMovieId(String title) throws Exception {
		return sqlSession.selectOne("reserveMapper.getMid", title);
	}

	@Override
	public int getMTid(int mid, String location, String name, String tname) {
		Map<String, Object> data = new HashMap<>();
		data.put("mid", mid);
		data.put("location", location);
		data.put("name", name);
		data.put("tname", tname);
		
		return sqlSession.selectOne("reserveMapper.getMTid", data);
	}

	@Override
	public List<TimeInfoDTO> getTimelist(int mtid, String moviedate, String starttime, String endtime) throws Exception {
		Map<String, Object> data = new HashMap<>();
		data.put("mtid", mtid);
		data.put("moviedate", moviedate);
		data.put("starttime", starttime);
		data.put("endtime", endtime);
		
		return sqlSession.selectList("reserveMapper.getTimeid", data);
	}

	@Override
	public int insertReserve(String orderid, int sid, int timeid, int userid, int rcnt,
			int totalpay, char payment) throws Exception {
		ReservationDTO resdto = new ReservationDTO();
		resdto.setOrderid(orderid);
		resdto.setSid(sid);
		resdto.setTimeid(timeid);
		resdto.setAid(userid);
		resdto.setRcnt(rcnt);
		resdto.setTotalpay(totalpay);
		resdto.setPayment(payment);
		
		return sqlSession.insert("reserveMapper.reserveInsert", resdto);
	}

}

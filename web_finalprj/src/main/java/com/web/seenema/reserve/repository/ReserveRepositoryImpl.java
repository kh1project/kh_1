package com.web.seenema.reserve.repository;

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
import com.web.seenema.reserve.dto.SeatDTO;
import com.web.seenema.reserve.dto.TimeDTO;
import com.web.seenema.reserve.dto.TimeInfoDTO;

@Repository
public class ReserveRepositoryImpl implements ReserveRepository{

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MovieDTO> selectMovieList(String location, String name) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("location", location);
		data.put("name", name);
		return sqlSession.selectList("reserveMapper.movieAll_list", data);
	}

	@Override
	public List<TimeDTO> selectTimeList(String location, String name,
			int rating, String title, String moviedate) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
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
	public List<SeatDTO> Seatlist(int id) throws Exception {
		return sqlSession.selectList("reserveMapper.Seatlist", id);
	}

	@Override
	public int updateSeat(int sid) throws Exception{
		return sqlSession.update("reserveMapper.updateSeat", sid);
	}
	
	@Override
	public int cencelSeat(int sid) throws Exception {
		return sqlSession.update("reserveMapper.cencelSeat", sid);
	}

	@Override
	public int getBranchTheater(String location, String name, String tname) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
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
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("mid", mid);
		data.put("location", location);
		data.put("name", name);
		data.put("tname", tname);
		
		return sqlSession.selectOne("reserveMapper.getMTid", data);
	}

	@Override
	public List<TimeInfoDTO> getTimelist(int mtid, String moviedate, String starttime, String endtime) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
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

	@Override
	public int deletReservation(int id) throws Exception {
		return sqlSession.delete("reserveMapper.ReserveDelete", id);
	}

	@Override
	public List<ReservationDTO> Reservelist(String orderid, int aid) throws Exception {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("orderid", orderid);
		data.put("aid", aid);
		return sqlSession.selectList("reserveMapper.ReserveList", data);
	}

}

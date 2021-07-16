package com.web.seenema.review.repository;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.seenema.board.dto.BoardSearchDTO;
import com.web.seenema.comment.dto.CommentSimpleDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.review.dto.ReviewAddDTO;
import com.web.seenema.review.dto.ReviewDTO;
import com.web.seenema.review.dto.ReviewListDTO;
import com.web.seenema.review.dto.ReviewPostDTO;

@Repository
public class ReviewRepositoryImpl implements ReviewRepository {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewListDTO> selectReviewList() throws Exception {
		return sqlSession.selectList("reviewMapper.selectReviewList");
	}

	@Override
	public List<ReviewListDTO> selectOrderbyLikeList() throws Exception {
		return sqlSession.selectList("reviewMapper.selectOrderbyLikeList");
	}
	
	@Override
	public List<ReviewListDTO> selectReviewSearchList(BoardSearchDTO search) throws Exception {
		return sqlSession.selectList("reviewMapper.selectReviewSearchList", search);
	}

	@Override
	public List<ReviewListDTO> selectReviewSeenList(int aid) throws Exception {
		return sqlSession.selectList("reviewMapper.selectReviewSeenList", aid);
	}

	@Override
	public List<ReviewListDTO> selectOrderbyLikeSeenList(int aid) throws Exception {
		return sqlSession.selectList("reviewMapper.selectOrderbyLikeSeenList", aid);
	}

	@Override
	public List<ReviewListDTO> selectReviewSearchSeenList(BoardSearchDTO search) throws Exception {
		return sqlSession.selectList("reviewMapper.selectReviewSearchSeenList", search);
	}

	@Override
	public ReviewDTO selectReview(int rid) throws Exception {
		return sqlSession.selectOne("reviewMapper.selectReview", rid);
	}

	@Override
	public List<CommentSimpleDTO> selectCommList(int rid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Integer> selectWatchList(int aid) throws Exception {
		
		return null;
	}

	@Override
	public MovieDTO selectMovie(int mid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertReview(ReviewAddDTO radto) throws Exception {
		boolean result = false;
		int rs = sqlSession.insert("reviewMapper.insertReview", radto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean updateReview(ReviewDTO dto) throws Exception {
		boolean result = false;
		int rs = sqlSession.update("reviewMapper.updateReview", dto);
		if(rs == 1) {
			result = true;
		}
		System.out.println("[Repo] updateReview result : " + result);
		return result;
	}

	@Override
	public boolean deleteReview(int rid) throws Exception {
		boolean result = false;
		int rs = sqlSession.update("reviewMapper.deleteReview", rid);
		if(rs == 1) {
			result = true;
		}
		return result;
	}
	
	@Override
	public Integer firstInsertPost(ReviewPostDTO rpdto) throws Exception {
		int rs = sqlSession.insert("reviewMapper.firstInsertPost", rpdto);
		int mpid = rpdto.getMergePost();
		return mpid;
	}

	@Override
	public int firstUpdatePost(ReviewPostDTO post) throws Exception {
		int rs = sqlSession.update("reviewMapper.firstUpdatePost", post);
		int mpid = post.getMergePost();
		System.out.println("firstUpdatePost 정상동작");
		return mpid;
	}
	
	@Override
	public boolean insertPost(ReviewPostDTO rpdto) throws Exception {
		boolean result = false;
		int rs = sqlSession.insert("reviewMapper.insertPost", rpdto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}
	
	@Override
	public boolean updatePost(ReviewPostDTO post) throws Exception {
		boolean result = false;
		int rs = sqlSession.update("reviewMapper.updatePost", post);
		if(rs == 1) {
			result = true;
		}
		System.out.println("updatePost 정상동작");
		return result;
	}
	
	@Override
	public List<ReviewPostDTO> selectMergePost(String cont) throws Exception {
		return sqlSession.selectList("reviewMapper.selectMergePost", cont);
	}
	
	@Override
	public boolean rollbackPost(int mergeId) throws Exception {
		boolean result = false;
		int rs = sqlSession.delete("reviewMapper.rollbackPost", mergeId);
		if(rs == 1) {
			result = true;
		}
		System.out.println("rollbackPost 정상동작");
		return result;
	}
	
	@Override
	public int updateGcnt(ReviewDTO rdto) throws Exception {
		int rs = sqlSession.update("reviewMapper.updateGcnt", rdto);
		int data = rdto.getGcnt();
		if(rs == 1) {
			System.out.println("[Repo] updateGcnt 정상동작 - data : " + data);
		}
		return data;
	}
	
	@Override
	public int updateBcnt(ReviewDTO rdto) throws Exception {
		int rs = sqlSession.update("reviewMapper.updateBcnt", rdto);
		int data = rdto.getBcnt();
		if(rs == 1) {
			System.out.println("[Repo] updateBcnt 정상동작 - data : " + data);
		}
		return data;
	}

	@Override
	public int updateVcnt(ReviewDTO rdto) throws Exception {
		int rs = sqlSession.update("reviewMapper.updateVcnt", rdto);
		int data = rdto.getVcnt();
		if(rs == 1) {
			System.out.println("[Repo] updateVcnt 정상동작 - data : " + data);
		}
		return data;
	}

	public int blockReview(int id) throws Exception {
		return sqlSession.update("reviewMapper.blockReview", id);
	}

	@Override
	public String selectUserNickname(int id) throws Exception {
		return sqlSession.selectOne("reviewMapper.selectUserNickname", id);
	}

	@Override
	public List<Integer> selectAddReviewList(int aid) throws Exception {
		return sqlSession.selectList("reviewMapper.selectAddReviewList", aid);
	}
}
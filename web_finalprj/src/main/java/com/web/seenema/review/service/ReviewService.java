package com.web.seenema.review.service;

import java.util.*;

import com.web.seenema.board.dto.BoardSearchDTO;
import com.web.seenema.comment.dto.CommentSimpleDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.review.dto.ReviewAddDTO;
import com.web.seenema.review.dto.ReviewDTO;
import com.web.seenema.review.dto.ReviewListDTO;
import com.web.seenema.review.dto.ReviewPostDTO;

public interface ReviewService {

    public List<ReviewListDTO> reviewList() throws Exception;
	public List<ReviewListDTO> reviewLikeList() throws Exception;
	public List<ReviewListDTO> reviewSearchList(BoardSearchDTO search) throws Exception;
	public List<ReviewListDTO> reviewSeenList(int aid) throws Exception;
	public List<ReviewListDTO> reviewLikeSeenList(int aid) throws Exception;
	public List<ReviewListDTO> reviewSearchSeenList(BoardSearchDTO search) throws Exception;
    public ReviewDTO reviewOne(int rid) throws Exception;
    public List<CommentSimpleDTO> commentList(int rid) throws Exception;
    public List<MovieImageDTO> movieImageList(int mid) throws Exception;
    public MovieDTO movieOne(int mid) throws Exception;
    public boolean addReview(ReviewAddDTO radto) throws Exception;
    public boolean updateReview(ReviewDTO dto) throws Exception;
    public boolean deleteReview(int rid) throws Exception;
    public int addPost(ArrayList<Map<String, String>> postlist) throws Exception;
	public List<ReviewPostDTO> MergePost(String cont) throws Exception;
	public List<String> firstContent(String mid) throws Exception;
	public int updatePost(ArrayList<Map<String, String>> postlist, String existingCont, String boardId) throws Exception;
	public int updateGcnt(int id) throws Exception;
	public int updateBcnt(int id) throws Exception;
	public int updateVcnt(int id) throws Exception;
	public String getNickname(int id) throws Exception;
	public List<Integer> myAddReviewList(int aid) throws Exception;
    
}
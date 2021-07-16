package com.web.seenema.review.repository;

import java.util.*;

import com.web.seenema.board.dto.BoardSearchDTO;
import com.web.seenema.comment.dto.CommentSimpleDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.review.dto.ReviewAddDTO;
import com.web.seenema.review.dto.ReviewDTO;
import com.web.seenema.review.dto.ReviewListDTO;
import com.web.seenema.review.dto.ReviewPostDTO;

public interface ReviewRepository {

    public List<ReviewListDTO> selectReviewList() throws Exception;
    public List<ReviewListDTO> selectOrderbyLikeList() throws Exception;
    public List<ReviewListDTO> selectReviewSearchList(BoardSearchDTO search) throws Exception;
    public List<ReviewListDTO> selectReviewSeenList(int aid) throws Exception;
    public List<ReviewListDTO> selectOrderbyLikeSeenList(int aid) throws Exception;
    public List<ReviewListDTO> selectReviewSearchSeenList(BoardSearchDTO search) throws Exception;
    public ReviewDTO selectReview(int rid) throws Exception;
    public List<CommentSimpleDTO> selectCommList(int rid) throws Exception;
    public List<Integer> selectWatchList(int aid) throws Exception;
    public MovieDTO selectMovie(int mid) throws Exception;
    public boolean insertReview(ReviewAddDTO dto) throws Exception;
    public boolean updateReview(ReviewDTO dto) throws Exception;
    public boolean deleteReview(int rid) throws Exception;
    public Integer firstInsertPost(ReviewPostDTO rpdto) throws Exception;
    public boolean insertPost(ReviewPostDTO rpdto) throws Exception;
    public List<ReviewPostDTO> selectMergePost(String cont) throws Exception;
    public int firstUpdatePost(ReviewPostDTO post) throws Exception;
    public boolean updatePost(ReviewPostDTO post) throws Exception;
    public boolean rollbackPost(int mergeId) throws Exception;
    public int updateGcnt(ReviewDTO rdto) throws Exception;
    public int updateBcnt(ReviewDTO rdto) throws Exception;
    public int updateVcnt(ReviewDTO rdto) throws Exception;

}
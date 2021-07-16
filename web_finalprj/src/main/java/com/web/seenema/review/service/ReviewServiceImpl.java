package com.web.seenema.review.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.seenema.comment.dto.CommentSimpleDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.repository.MovieRepositoryImpl;
import com.web.seenema.review.dto.ReviewAddDTO;
import com.web.seenema.review.dto.ReviewDTO;
import com.web.seenema.review.dto.ReviewListDTO;
import com.web.seenema.review.dto.ReviewPostDTO;
import com.web.seenema.review.dto.ReviewSimpleDTO;
import com.web.seenema.review.repository.ReviewRepositoryImpl;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private int mergeId;
	
	@Autowired
	private ReviewRepositoryImpl dto;
	
	@Autowired
	private MovieRepositoryImpl mdto;

	@Override
	public List<ReviewListDTO> reviewList() throws Exception {
		List<ReviewListDTO> data = dto.selectReviewList();
		return data;
	}

	@Override
	public ReviewDTO reviewOne(int rid) throws Exception {
		ReviewDTO data = dto.selectReview(rid);
		return data;
	}

	@Override
	public List<CommentSimpleDTO> commentList(int rid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MovieDTO movieOne(int mid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addReview(ReviewAddDTO radto) throws Exception {
		return dto.insertReview(radto);
	}

	@Override
	public boolean updateReview(ReviewDTO rdto) throws Exception {
		return dto.updateReview(rdto);
	}

	@Override
	public boolean deleteReview(int rid) throws Exception {
		return dto.deleteReview(rid);
	}

	@Override
	public List<MovieImageDTO> movieImageList(int mid) throws Exception {
		List<MovieImageDTO> data = mdto.selectMovieImageList(mid);
		return data;
	}

	@Override
	public int addPost(ArrayList<Map<String, String>> postlist) throws Exception {
		boolean result = false;
		for(int i = 0; i < postlist.size(); i++) {
			Map<String, String> post = postlist.get(i);
			ReviewPostDTO rpdto = new ReviewPostDTO();
			rpdto.setPostimg(post.get("postimg"));
			rpdto.setPosttext(post.get("posttext"));
			if(i == 0) {
				mergeId = dto.firstInsertPost(rpdto);
				if(mergeId > 0) {
					result = true;
				}
			} else {
				rpdto.setMergePost(mergeId);
				result = dto.insertPost(rpdto);
			}			
			if(result == false) {
				break;
			}
		}
		
		return mergeId;
	}

	@Override
	public int updatePost(ArrayList<Map<String, String>> postlist, String existingCont, String boardId) throws Exception { //이거 검증해야함! 그리고 둘 중 하나 다를 때 insert 아니고 해당 머지아이디에 update 쿼리로 가게 해야함.
		/**
		 *  현재2 = 과거2
			현재1 과거1 - (equals 비교) - 같으면 기존포스트를 새 머지아이디에 담음, 다르면 새 포스트를 새 머지아이디에 담음
			현재2 과거2 - (equals 비교) - 같으면 기존포스트를 아까 새로만든 머지아이디에 담음, 다르면 새 포스트를 아까 머지아이디에 담음
			
			현재2 > 과거1
			현재1 과거1 - (equals 비교) - 같으면 기존포스트를 새 머지아이디에 담음, 다르면 새 포스트를 새 머지아이디에 담음
			현재2 과거X - 새 포스트를 새 머지아이디에 담음 ... 현재사이즈 끝날때까지 반복
			
			현재1 > 과거2
			현재1 과거1 - (equals 비교) - 같으면 기존포스트를 새 머지아이디에 담음, 다르면 새 포스트를 새 머지아이디에 담음
			현재X 과거2 - 기존 포스트를 새 머지아이디에 담음 ... 과거사이즈 끝날때까지 반복
		 * */
		System.out.println("[Service] updatePost 진입");
		boolean result = false;
		boolean equalsFlag = false; //전체 포스트가 다 동일한지 여부
		int flagCount = 0; //같은 포스트 수
		
		List<ReviewPostDTO> existingList = MergePost(existingCont);
		int pastSize = existingList.size(); //과거 사이즈
		int nowSize = postlist.size(); //현재 사이즈
		System.out.println("과거 - 현재 사이즈 : " + pastSize + " - " + nowSize + " = " + (pastSize - nowSize));
		int loopCnt = 0; //반복문 실행 횟수
		if(pastSize - nowSize >= 0) { loopCnt = pastSize; } else { loopCnt = nowSize; } //횟수 저장. 같거나 과거가 더 많으면 과거사이즈, 현재가 더 많으면 현재사이즈.
		System.out.println("loopCnt" + loopCnt);
		
		//포스트가 DB에 들어가는 순서가 포스트 순서가 아님.. 해결 필요!
		//기존 저장되어있던 머지아이디를 가지고와서, 그것과 이번 수정한 파일을 비교해본다.
		for(int i = 0; i < loopCnt; i++) { //과거,현재 중 사이즈가 더 큰 것만큼 반복.
			System.out.println("===========================================");
			System.out.println((i+1) + "번째 포스트 확인중, 기존 포스트사이즈 " + pastSize + "");
			System.out.println("===========================================");
			ReviewPostDTO ppost = null;
			ReviewPostDTO npost = null;
			if(i < pastSize) { //반복횟수가 과거사이즈보다 크거나 같은 경우에만 과거 포스트 DTO 생성.
				//(현재 갯수가 더 많은 경우)
				System.out.println("현재 카운트 i " + i + " < 과거 사이즈 pastSize " + pastSize);
				ppost = existingList.get(i);
			}
			if(i < nowSize) { //반복횟수가 현재사이즈보다 크거나 같은 경우에만 새 포스트 DTO 생성.
				//(과거 갯수가 더 많은 경우)
				System.out.println("현재 카운트 i " + i + " < 현재 사이즈 nowSize " + nowSize);
				Map<String, String> temp = postlist.get(i);
				npost = new ReviewPostDTO();
				npost.setId(Integer.parseInt(boardId));
				npost.setPostimg(temp.get("postimg"));
				npost.setPosttext(temp.get("posttext"));
			}
			if(i == 0) { //첫번째 반복은 무조건 (equals 비교) - 같으면 기존포스트를 새 머지아이디에 담음, 다르면 새 포스트를 새 머지아이디에 담음 : 동작. 새 머지아이디를 만들어야 함.
				System.out.println(">>>>>첫번째 반복");
				if(!ppost.getPostimg().equals(npost.getPostimg()) && !ppost.getPosttext().equals(npost.getPosttext())) { //둘 다 다른 경우
					//새 포스트를 생성하여 새 머지아이디에 담음.
					System.out.println("새 포스트를 생성하여 새 머지아이디에 담음.");
					System.out.println(npost.getPostimg());
					System.out.println(npost.getPosttext());
					mergeId = dto.firstInsertPost(npost);
				} else if(!ppost.getPostimg().equals(npost.getPostimg()) || !ppost.getPosttext().equals(npost.getPosttext())) { //둘 중 하나만 다른 경우
					//기존 포스트를 수정하여 새 머지아이디에 담음.
					System.out.println("기존 포스트를 수정하여 새 머지아이디에 담음.");
					mergeId = dto.firstUpdatePost(npost);
				} else { //둘 다 같은 경우
					//기존 포스트를 새 머지아이디에 담음.
					System.out.println("기존 포스트를 새 머지아이디에 담음.");
					mergeId = dto.firstInsertPost(ppost);
					flagCount++;
				}
			} else if (i > 0 && loopCnt > i) { //처음 반복이 아니고, 총 반복 사이즈보다 작은 경우
				System.out.println(">>>>>처음 반복이 아니고, 총 반복 사이즈보다 작은 경우");
				if(ppost != null && npost != null) { //현재 과거 DTO 모두 존재하는 경우.
					System.out.println("현재 과거 DTO 모두 존재하는 경우.");
					if(!ppost.getPostimg().equals(npost.getPostimg()) && !ppost.getPosttext().equals(npost.getPosttext())) { //둘 다 다른 경우
						//새 포스트를 생성하여 만들어진 머지아이디에 담음.
						System.out.println("새 포스트를 생성하여 만들어진 머지아이디에 담음.");
						npost.setMergePost(mergeId);
						result = dto.insertPost(npost);
					} else if(!ppost.getPostimg().equals(npost.getPostimg()) || !ppost.getPosttext().equals(npost.getPosttext())) { //둘 중 하나만 다른 경우
						//기존 포스트를 수정하여 만들어진 머지아이디에 담음.
						System.out.println("기존 포스트를 수정하여 만들어진 머지아이디에 담음.");
						npost.setMergePost(mergeId);
						result = dto.updatePost(npost);
					} else { //둘 다 같은 경우
						//기존 포스트를 만들어진 머지아이디에 담음.
						System.out.println("기존 포스트를 만들어진 머지아이디에 담음.");
						ppost.setMergePost(mergeId);
						result = dto.insertPost(ppost);
						flagCount++;
					}
				} else if(ppost == null) { //과거 DTO가 없는 경우. (현재 갯수가 더 많은 경우)
					//새 포스트를 생성하여 만들어진 머지아이디에 담음 ... 현재사이즈 끝날때까지 반복
					System.out.println("새 포스트를 생성하여 만들어진 머지아이디에 담음 ... 현재사이즈 끝날때까지 반복");
					for(int j = 0; j < (nowSize - i); j++) {
						npost.setMergePost(mergeId);
						result = dto.insertPost(npost);
					}
				} else if(npost == null) {
					//기존 포스트를 만들어진 머지아이디에 담음 ... 과거사이즈 끝날때까지 반복
					System.out.println("기존 포스트를 만들어진 머지아이디에 담음 ... 과거사이즈 끝날때까지 반복");
					for(int j = 0; j < (pastSize - 1); j++) {
						ppost.setMergePost(mergeId);
						result = dto.insertPost(ppost);
						flagCount++;
					}
				}
			}
		} if(loopCnt == flagCount) { //현재 동작하는 루프 == 같은 포스트 수 : 완전히 똑같다는 얘기
			equalsFlag = true;
			System.out.println("수정된 포스트 하나도 없음");
			//새 머지아이디로 저장된 post 전체 삭제하는 sql 실행.
			dto.rollbackPost(mergeId);
			System.out.println("rollbackPost 정상 작동");
			//머지아이디 시퀀스 -1 하는 sql 실행. ALTER SEQUENCE merge_seq INCREMENT BY -1;
			return Integer.parseInt(existingCont); //기존의 머지아이디 그대로 다시 반환
		} else {
			return mergeId;
		}
	}
	
	@Override
	public List<ReviewPostDTO> MergePost(String cont) throws Exception {
		List<ReviewPostDTO> mergePost = dto.selectMergePost(cont);
		return mergePost;
	}

	@Override
	public List<String> firstContent(String mid) throws Exception {
		List<ReviewPostDTO> contents = dto.selectMergePost(mid);
		List<String> firstPost = new ArrayList<String>();
		firstPost.add(contents.get(0).getPosttext());
		firstPost.add(contents.get(0).getPostimg());
		if(firstPost.size() == 0) {
			firstPost.add("-1");
		}
		return firstPost;
	}

	@Override
	public int updateGcnt(int id) throws Exception {
		ReviewDTO rdto = dto.selectReview(id);
		rdto.setGcnt(rdto.getGcnt() + 1);
		return dto.updateGcnt(rdto);
	}

	@Override
	public int updateBcnt(int id) throws Exception {
		ReviewDTO rdto = dto.selectReview(id);
		rdto.setBcnt(rdto.getBcnt() + 1);
		return dto.updateBcnt(rdto);
	}
	
	@Override
	public int updateVcnt(int id) throws Exception {
		ReviewDTO rdto = dto.selectReview(id);
		rdto.setVcnt(rdto.getVcnt() + 1);
		return dto.updateVcnt(rdto);
		
	}
}
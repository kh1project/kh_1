package com.web.seenema.review.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.seenema.account.repository.AccountRepositoryImpl;
import com.web.seenema.board.dto.BoardSearchDTO;
import com.web.seenema.comment.dto.CommentSimpleDTO;
import com.web.seenema.movie.dto.MovieDTO;
import com.web.seenema.movie.dto.MovieImageDTO;
import com.web.seenema.movie.repository.MovieRepositoryImpl;
import com.web.seenema.review.dto.ReviewAddDTO;
import com.web.seenema.review.dto.ReviewDTO;
import com.web.seenema.review.dto.ReviewListDTO;
import com.web.seenema.review.dto.ReviewPostDTO;
import com.web.seenema.review.repository.ReviewRepositoryImpl;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	private int mergeId;
	
	@Autowired
	private ReviewRepositoryImpl dto;
	
	@Autowired
	private MovieRepositoryImpl mdto;
	
	@Autowired
	private AccountRepositoryImpl adto;

	@Override
	public List<ReviewListDTO> reviewList() throws Exception {
		List<ReviewListDTO> data = dto.selectReviewList();
		return data;
	}
	
	@Override
	public List<ReviewListDTO> reviewLikeList() throws Exception {
		List<ReviewListDTO> data = dto.selectOrderbyLikeList();
		return data;
	}

	@Override
	public List<ReviewListDTO> reviewSearchList(BoardSearchDTO search) throws Exception {
		List<ReviewListDTO> data = dto.selectReviewSearchList(search);
		return data;
	}
	
	@Override
	public List<ReviewListDTO> reviewSeenList(int aid) throws Exception {
		List<ReviewListDTO> data = dto.selectReviewSeenList(aid);
		return data;
	}
	
	@Override
	public List<ReviewListDTO> reviewLikeSeenList(int aid) throws Exception {
		List<ReviewListDTO> data = dto.selectOrderbyLikeSeenList(aid);
		return data;
	}

	@Override
	public List<ReviewListDTO> reviewSearchSeenList(BoardSearchDTO search) throws Exception {
		List<ReviewListDTO> data = dto.selectReviewSearchSeenList(search);
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
			
			현재1 < 과거2
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
		System.out.print("과거 - 현재 사이즈 : " + pastSize + " - " + nowSize + " = " + (pastSize - nowSize));
		int loopCnt = 0; //반복문 실행 횟수
		if(pastSize - nowSize >= 0) { loopCnt = pastSize; } else { loopCnt = nowSize; } //횟수 저장. 같거나 과거가 더 많으면 과거사이즈, 현재가 더 많으면 현재사이즈.
		System.out.println(" -------------------------------> loopCnt : " + loopCnt);
		
		//기존 저장되어있던 머지아이디를 가지고와서, 그것과 이번 수정한 파일을 비교해본다.
		for(int i = 0; i < loopCnt; i++) { //과거,현재 중 사이즈가 더 큰 것만큼 반복.
			/** 먼저 현재와 과거 사이즈를 비교하여 상황에 맞게 DTO를 생성한다. */
			System.out.println("===========================================");
			System.out.println((i+1) + "번째 포스트 확인중, 기존 포스트사이즈 " + pastSize + "");
			System.out.println("===========================================");
			ReviewPostDTO ppost = null;
			ReviewPostDTO npost = null;
			if(i < pastSize) { //반복횟수가 과거사이즈보다 크거나 같은 경우에만 과거 포스트 DTO 생성.
				//(현재 갯수가 더 많은 경우)
				ppost = existingList.get(i);
				System.out.println("현재 반복 : " + (i+1) + "회 < 과거 사이즈 pastSize : " + pastSize);
			}
			if(i < nowSize) { //반복횟수가 현재사이즈보다 크거나 같은 경우에만 새 포스트 DTO 생성.
				//(과거 갯수가 더 많은 경우)
				Map<String, String> temp = postlist.get(i);
				npost = new ReviewPostDTO();
				npost.setId(Integer.parseInt(boardId));
				npost.setPostimg(temp.get("postimg"));
				npost.setPosttext(temp.get("posttext"));
				System.out.println("현재 반복 : " + (i+1) + "회 < 현재 사이즈 nowSize " + nowSize);
			}
			
			/** 객체에 데이터 담는 작업 시작 */
			if(i == 0) { //첫번째 반복은 무조건 (equals 비교) - 같으면 기존포스트를 새 머지아이디에 담음, 다르면 새 포스트를 새 머지아이디에 담음 : 동작. 새 머지아이디를 만들어야 함.
				System.out.println(">>>>>첫번째 반복");
				if(!ppost.getPostimg().equals(npost.getPostimg()) || !ppost.getPosttext().equals(npost.getPosttext())) { //둘중 하나라도 다 다른 경우
					//새 포스트를 생성하여 새 머지아이디에 담음.
					mergeId = dto.firstInsertPost(npost);
					System.out.println("새 포스트를 생성하여 새 머지아이디에 담음.");
				} else { //둘 다 같은 경우
					//기존 포스트를 새 머지아이디에 담음.
					mergeId = dto.firstInsertPost(ppost);
					System.out.println("기존 포스트를 새 머지아이디에 담음.");
					flagCount++;
				}
			} else if (i > 0 && pastSize == nowSize) { //사이즈 같음
				System.out.println(">>>>>처음 반복이 아니고, 둘의 사이즈가 같음 (" + i + "번째)" );
				if(!ppost.getPostimg().equals(npost.getPostimg()) || !ppost.getPosttext().equals(npost.getPosttext())) { //둘중 하나라도 다 다른 경우
					//새 포스트를 생성하여 만들어진 머지아이디에 담음.
					npost.setMergePost(mergeId);
					result = dto.insertPost(npost);
					System.out.println("새 포스트를 생성하여 만들어진 머지아이디에 담음.");
				} else { //둘 다 같은 경우
					//기존 포스트를 새 머지아이디에 담음.
					ppost.setMergePost(mergeId);
					result = dto.insertPost(ppost);
					flagCount++;
					System.out.println("기존 포스트를 만들어진 머지아이디에 담음.");
				}
			} else if (i > 0) { //사이즈 다름
				if(npost != null && ppost != null) {
					if(!ppost.getPostimg().equals(npost.getPostimg()) || !ppost.getPosttext().equals(npost.getPosttext())) { //둘중 하나라도 다 다른 경우
						//새 포스트를 생성하여 만들어진 머지아이디에 담음.
						npost.setMergePost(mergeId);
						result = dto.insertPost(npost);
						System.out.println("새 포스트를 생성하여 만들어진 머지아이디에 담음.");
					} else if(ppost.getPostimg().equals(npost.getPostimg()) && ppost.getPosttext().equals(npost.getPosttext())) { //둘 다 같은 경우
						//기존 포스트를 새 머지아이디에 담음.
						ppost.setMergePost(mergeId);
						result = dto.insertPost(ppost);
						flagCount++;
						System.out.println("기존 포스트를 만들어진 머지아이디에 담음.");
					}
				} else if (i > 0 && pastSize < nowSize) { //현재가 더 많으면 
					npost.setMergePost(mergeId);
					result = dto.insertPost(npost);
					System.out.println("새 포스트를 생성하여 만들어진 머지아이디에 담음.");
				}
			}
		}
		if(loopCnt == flagCount) { //현재 동작하는 루프 == 같은 포스트 수 : 완전히 똑같다는 얘기
			equalsFlag = true;
			System.out.println("수정된 포스트 하나도 없음");
			//새 머지아이디로 저장된 post 전체 삭제하는 sql 실행.
			dto.rollbackPost(mergeId); //DB용량관리차원에서 이전 머지아이디는 삭제함
			System.out.println("rollbackPost 정상 작동");
			//머지아이디 시퀀스 -1 하는 sql 실행. ALTER SEQUENCE merge_seq INCREMENT BY -1;
			return Integer.parseInt(existingCont); //기존의 머지아이디 그대로 다시 반환
		} else {
			dto.rollbackPost(mergeId-1); //DB용량관리차원 이전 머지아이디는 삭제함
			System.out.println("return 전의 mergeId : " + mergeId);
			return mergeId;
		}
	}
	
	@Override
	public List<ReviewPostDTO> MergePost(String cont) throws Exception {
		List<ReviewPostDTO> mergePost = dto.selectMergePost(cont);
		return mergePost;
	}

	@Override
	public List<String> firstContent(String cont) throws Exception {
		List<ReviewPostDTO> contents = MergePost(cont);
		List<String> firstPost = new ArrayList<String>();
		
		if(contents.get(0).getPosttext() != null && contents.get(0).getPostimg() != null) {
			firstPost.add(contents.get(0).getPosttext());
			firstPost.add(contents.get(0).getPostimg());
		} else {
			System.out.println("!!!!firstPost 정보 담지 못 함!!!!");
		}
		
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
	public int updateGcntDown(int id) throws Exception {
		ReviewDTO rdto = dto.selectReview(id);
		rdto.setGcnt(rdto.getGcnt() - 1);
		return dto.updateGcntDown(rdto);
	}

	@Override
	public int updateBcnt(int id) throws Exception {
		ReviewDTO rdto = dto.selectReview(id);
		rdto.setBcnt(rdto.getBcnt() + 1);
		if(rdto.getBcnt() > 50) {
			dto.blockReview(id);
		}
		return dto.updateBcnt(rdto);
	}
	
	@Override
	public int updateVcnt(int id) throws Exception {
		ReviewDTO rdto = dto.selectReview(id);
		rdto.setVcnt(rdto.getVcnt() + 1);
		return dto.updateVcnt(rdto);
		
	}

	@Override
	public String getNickname(int id) throws Exception {
		return dto.selectUserNickname(id);
	}

	@Override
	public List<Integer> myAddPossibleList(int aid) throws Exception {
		List<Integer> possiblelist = dto.selectAddPossibleList(aid);
		if(possiblelist.size() == 0) {
			possiblelist.add(-1);
		}
		return possiblelist;
	}
}
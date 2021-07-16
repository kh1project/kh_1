<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="review_header.jsp"></jsp:include>
	<input type="hidden" id="sessionAid" name="sessionAid" value="${sessionAid }"/>
	<div class="page-title"><div class="container"><h1>영화 리뷰 보기</h1></div></div>
	<div class="container">
		<div class="review-detail-wrap">
			<div class="review-detail-header">
				<h3>${data.getTitle() }
					<p>
						<small id="cdate" class="cdate" data-cdate="${data.getCdateFM() }"></small>
						<small><i class="far fa-user-circle"></i>${nickname }</small>
						<small><i class="far fa-eye"></i>${data.getVcnt() }</small>
					</p>
				</h3>
				<div>
					<p>
						<c:if test="${sessionAid eq data.getAid() }">
							<a href="javascript:;" onclick="reviewUpdate()">수정</a>
							<a href="javascript:;" onclick="reviewDelete()">삭제</a>
						</c:if>
						<a href="javascript:;" onclick="history.back();">목록</a>
					</p>
					<div class="starRating">
						<i class="far fa-star" data-rating="1"></i>
						<i class="far fa-star" data-rating="2"></i>
						<i class="far fa-star" data-rating="3"></i>
						<i class="far fa-star" data-rating="4"></i>
						<i class="far fa-star" data-rating="5"></i>
						<i class="far fa-star" data-rating="6"></i>
						<i class="far fa-star" data-rating="7"></i>
						<i class="far fa-star" data-rating="8"></i>
						<i class="far fa-star" data-rating="9"></i>
						<i class="far fa-star" data-rating="10"></i>
						<input type="hidden" id="star" name="star" value="${data.getStar() }">
					</div>
				</div>
			</div>
			
			<c:forEach var="i" items="${contlist }" varStatus="loop">
				<div class="review-post-wrap">
					<img src="${i.getPostimg() }">
					<p>${i.getPosttext() }</p>
				</div>
			</c:forEach>
			<div class="detail-btn-wrap">
				<button type="button" class="btn-gcnt" data-id="${data.getId() }"><i class="far fa-thumbs-up fa-fw"></i><span>${data.getGcnt() }</span></button>
				<button type="button" class="btn-bcnt" data-id="${data.getId() }"><i class="far fa-thumbs-down fa-fw"></i><span>${data.getBcnt() }</span></button>
			</div>
			<%--<div class="detail-comment-wrap">
				<p>댓글 (0)</p>
				<textarea rows="" cols="" name=""></textarea>
				<div class="comment-info-btn">
					<span>0 / 100</span>
					<button>등록</button>
				</div>
			</div> --%>
		</div>
<jsp:include page="review_footer.jsp"></jsp:include>
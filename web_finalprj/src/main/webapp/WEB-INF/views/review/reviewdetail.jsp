<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="review_header.jsp"></jsp:include>
	<div class="page-title"><div class="container"><h1>영화 리뷰 보기</h1></div></div>
	<div class="container">
		<div class="review-detail-wrap">
			<div class="review-detail-header">
				<h3>${data.getTitle() }
					<small id="cdate" class="cdate" data-cdate="${data.getCdateFM() }"></small>
				</h3>
				<div>
					<p><a href="<%=request.getContextPath() %>/review/update?rid=${data.getId() }">수정</a> <a href="<%=request.getContextPath() %>/review/delete?rid=${data.getId() }">삭제</a> <a href="javascript:;" onclick="history.back();">목록</a></p>
					<p><span><i class="far fa-user-circle"></i>${data.getAid() }</span>
					<span><i class="far fa-eye"></i>${data.getVcnt() }</span></p>
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
		</div>
<jsp:include page="review_footer.jsp"></jsp:include>
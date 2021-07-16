<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="review_header.jsp"></jsp:include>
	<input type="hidden" id="blockerror" name="blockerror" value="${blockerror }"/>
	<div class="page-title"><div class="container"><h1>영화 리뷰 수정</h1></div></div>
	<div class="container">
		<c:url var="update" value="/review/update" />
		<div id="update">
		<div class="add-step-header">원하시는 예고편/스틸컷을 선택해주세요!</div>
		<form action="${update }" name="step2form" method="post">
			<div class="row">
				<div class="col-6 postimagewrap">
					<div id="add-imagelist" class="row">
					</div>
				</div>
				<div class="col-6 postwrap">
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
					<c:forEach var="i" items="${contlist }" varStatus="loop">
						<%-- 이미지1, 텍스트1 묶음 START --%>
						<div id="post${loop.count }" class="col post" onclick="selectPost(${loop.count })">
							<img class="selectImg" src="${i.getPostimg() }" alt="이미지 없음">
							<textarea placeholder="내용을 작성해 주세요." id="ptext${loop.count }" onkeyup="ptextLengthCk(${loop.count });">${i.getPosttext() }</textarea>
							<div class="pTextCnt">(0 / 80)</div>
							<img id="delBtn${loop.count }" class="delBtn" src="<%=request.getContextPath() %>/resources/images/common/btn-x-close.png" onclick="delPost(${loop.count });">
						</div>
						<%-- 이미지1, 텍스트1 묶음 END --%>
					</c:forEach>
					<button id="btn_addpost" type="button" onclick="addPost()">포스트추가</button>
					<input id="hiddencontents" type="hidden" name="contents" value="">
					<input id="hiddenid" type="hidden" name="id" value="${data.getId() }">
				</div>
			</div>
			<div class="btn_wrap">
				<button type="button" onclick="history.back(-1);">취소</button>
				<button id="btn_step2submit" type="button" onclick="updateReview()">수정</button>
			</div>
		</form>
	</div>
<jsp:include page="review_update_footer.jsp"></jsp:include>
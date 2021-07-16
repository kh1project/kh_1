<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="review_header.jsp"></jsp:include>
	<div class="page-title"><div class="container"><h1>영화 리뷰 작성</h1></div></div>
	<div class="container">
		<div id="add-step1">
			<div class="add-step-header">리뷰를 작성하실 영화를 선택해주세요!<span>등록가능한 영화 <strong>${mywlist.size() } </strong>건</span></div>
	
			<div class="row row-cols-lg-4">
				<c:forEach var="i" items="${mywlist }" varStatus="loop">
					<c:forEach var="j" items="${i }" begin="0" end="0">
						<label for="wm${j.getId() }" onclick="selectmovie(${j.getId() });"><div id="wm${j.getId() }wrap" class="p-3 border bg-light wmwrap">
							<div id="checkbg${j.getId() }" class="checkbg"><i class="fa fa-check"></i></div>
							<img src="<%=request.getContextPath() %>${j.getPath() }${j.getName() }">
							<p>${j.getTitle() }</p>
							<input type="radio" name="wm" id="wm${j.getId() }" class="r_movieselect" value="wm${j.getId() }">
						</div></label>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		
		<c:url var="add" value="/review/add" />
		<div id="add-step2">
		<div class="add-step-header">원하시는 예고편/스틸컷을 선택해주세요!</div>
		<form action="${add }" name="step2form" method="post">
			<div class="row">
				<div class="col-6 postimagewrap">
					<div id="add-imagelist" class="row">
					</div>
				</div>
				<div class="col-6 postwrap">
					별점 : <input type="number" id="star" name="star" min="1" max="10" value="1"><!-- 나중에 별 체크하는걸로 바꿔야함. 임시. -->
					<!-- 이미지1, 텍스트1 묶음 START -->
					<div id="post1" class="col post" onclick="selectPost(1)">
						<img class="selectImg" src="<%=request.getContextPath() %>/resources/images/sub/bg-img-select.png" alt="이미지 없음">
						<textarea placeholder="내용을 작성해 주세요." id="ptext1" onkeyup="ptextLengthCk(1);"></textarea>
						<div class="pTextCnt">(0 / 80)</div>
						<img id="delBtn1" class="delBtn" src="<%=request.getContextPath() %>/resources/images/common/btn-x-close.png" onclick="delPost(1);">
					</div>
					<!-- 이미지1, 텍스트1 묶음 END -->
					<button id="btn_addpost" type="button" onclick="addPost()">포스트추가</button>
					<input id="hiddenmid" type="hidden" name="mid" value="">
					<input id="hiddentitle" type="hidden" name="title" value="">
					<input id="hiddencontents" type="hidden" name="contents" value="">
				</div>
			</div>
			<div class="btn_wrap">
				<button type="button" onclick="history.back(-1);">취소</button>
				<button id="btn_step2submit" type="button" onclick="addReview()">등록</button>
			</div>	
		</form>
	</div>
<jsp:include page="review_add_footer.jsp"></jsp:include>
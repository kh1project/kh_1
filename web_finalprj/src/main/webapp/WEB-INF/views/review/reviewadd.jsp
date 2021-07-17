<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="review_header.jsp"></jsp:include>
	<input type="hidden" id="error" name="error" value="${error }"/>
	<input type="hidden" id="sessionAid" name="sessionAid" value="${sessionAid }"/>
	<div class="page-title"><div class="container"><h1>영화 리뷰 작성</h1></div></div>
	<div id="pageContainer" class="container">
	
		<div id="add-step1">
			<div class="add-step-header">리뷰를 작성하실 영화를 선택해주세요!
				<c:if test="${possiblelist[0] == -1 }">
					<span>등록가능한 영화<strong>&nbsp;${mywlist.size() } </strong>건</span>
				</c:if>
				<c:if test="${mywlist.size() > possiblelist.size() and possiblelist[0] != -1 }">
					<span>등록가능한 영화<strong>&nbsp;${mywlist.size() - possiblelist.size() } </strong>건</span>
				</c:if>
			</div>
	
			<div class="row row-cols-lg-4">
				<c:if test="${possiblelist[0] == -1 }"> <!-- 모두 등록 가능 -->
					<c:forEach var="i" items="${mywlist }" varStatus="iloop">
						<label for="wm${i[iloop.index].id }" onclick="selectmovie(${i[iloop.index].id });"><div id="wm${i[iloop.index].id }wrap" class="p-3 border bg-light wmwrap">
							<div id="checkbg${i[iloop.index].id }" class="checkbg"><i class="fa fa-check"></i></div>
							<img src="<%=request.getContextPath() %>${i[iloop.index].path }${i[iloop.index].name }">
							<p>${i[iloop.index].title }</p>
							<input type="radio" name="wm" id="wm${i[iloop.index].id }" class="r_movieselect" value="wm${i[iloop.index].id }">									
						</div></label>
					</c:forEach>
				</c:if>
				<c:if test="${possiblelist[0] != -1 and possiblelist.size() != mywlist.size() }"> <!-- DB에서 작성할 수 없는 영화 ID가 넘어올 예정 -->
					<c:forEach var="i" items="${mywlist }" varStatus="iloop">
						<c:forEach var="j" items="${possiblelist }" varStatus="jloop">
							<c:set var="jloop_flag" value="false" />
							<c:choose>
								<c:when test="${i[iloop.index].id eq j }">
									<label for="wm${i[iloop.index].id }"><div id="wm${i[iloop.index].id }wrap" class="p-3 border bg-light wmwrap">
										<div id="checkbg${i[iloop.index].id }" class="checkbg on"><span>작성완료</span></div>
										<img src="<%=request.getContextPath() %>${i[iloop.index].path }${i[iloop.index].name }">
										<p>${i[iloop.index].title }</p>
										<input type="radio" name="wm" id="wm${i[iloop.index].id }" class="r_movieselect" value="wm${i[iloop.index].id }">									
									</div></label>
									<c:set var="loop_flag" value="true" />
								</c:when>
								<c:otherwise>
									<c:if test="${not jloop_flag }">
										<label for="wm${i[iloop.index].id }" onclick="selectmovie(${i[iloop.index].id });"><div id="wm${i[iloop.index].id }wrap" class="p-3 border bg-light wmwrap">
											<div id="checkbg${i[iloop.index].id }" class="checkbg"><i class="fa fa-check"></i></div>
											<img src="<%=request.getContextPath() %>${i[iloop.index].path }${i[iloop.index].name }">
											<p>${i[iloop.index].title }</p>
											<input type="radio" name="wm" id="wm${i[iloop.index].id }" class="r_movieselect" value="wm${i[iloop.index].id }">									
										</div></label>
										
									</c:if>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:forEach>
				</c:if>
				<c:if test="${possiblelist.size() == mywlist.size() }"> <!-- 모두 등록 불가능 -->
					<c:forEach var="i" items="${mywlist }" varStatus="iloop">
						<label for="wm${i[iloop.index].id }"><div id="wm${i[iloop.index].id }wrap" class="p-3 border bg-light wmwrap">
							<div id="checkbg${i[iloop.index].id }" class="checkbg on"><span>작성완료</span></div>
							<img src="<%=request.getContextPath() %>${i[iloop.index].path }${i[iloop.index].name }">
							<p>${i[iloop.index].title }</p>
							<input type="radio" name="wm" id="wm${i[iloop.index].id }" class="r_movieselect" value="wm${i[iloop.index].id }">									
						</div></label>
					</c:forEach>
				</c:if>
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
						<input type="hidden" id="star" name="star">
					</div>
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
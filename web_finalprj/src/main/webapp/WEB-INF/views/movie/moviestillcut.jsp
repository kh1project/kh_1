<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>"${movie.getTitle() }" - 주요정보</title>
<c:url var="root" value='/' />
<script type="text/javascript"
	src="${root }resources/jquery/js/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${root }resources/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="${root }resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${root }resources/static/css/common.css">
<script type="text/javascript" src="${root }resources/static/js/moviedetail.js"></script>
<script type="text/javascript" src="${root }resources/static/js/moviestillcut.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
</style>
<link type="text/css" rel="stylesheet" href="${root }resources/static/css/moviedetail.css">
<link type="text/css" rel="stylesheet" href="${root }resources/static/css/moviestillcut.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
	<header>
		<%@ include file="../module/header.jsp"%>
	</header>
<body>
	<div class="bgcolor"></div>
	<div class="inner-wrap">
		<div>
			<div class="info-container">
				<img class="bg-poster" alt="movie-id${movie.getId() }-img"
					src="${root }resources/images/movie/${movie.getId() }/poster/movie_image (1).jpg">
				<div class="info">
					<div class="title ">${movie.getTitle()}</div>
					<div class="subtitle ">${movie.getSubtitle()}</div>
					<div class="util-btn">
						<c:set var="liked" value="false" />
						<c:forEach var="likeList" items="${likeList }">
							<c:if test="${movie.getId() eq likeList.getMid() }">
								<c:set var="liked" value="true" />
							</c:if>
						</c:forEach>
						<c:choose>
							<c:when test='${liked eq "true" }'>
								<div class="like-btn" onclick="doUnlike(${movie.getId() })">
									♥ 
									<c:choose>
									<c:when test="${gcnt.get(movie.getId()) eq null}">
										0
									</c:when>
									<c:otherwise>
										${gcnt.get(movie.getId()) }
									</c:otherwise>
									</c:choose>
								</div>
							</c:when>
							<c:otherwise>
								<div class="like-btn" onclick="doLike(${movie.getId() })">
									♡ 
									<c:choose>
									<c:when test="${gcnt.get(movie.getId()) eq null}">
										0
									</c:when>
									<c:otherwise>
										${gcnt.get(movie.getId()) }
									</c:otherwise>
									</c:choose>
								</div>
							</c:otherwise>
						</c:choose>

					</div>
					<div class="score-info">
						<div class="score">
							<p class="score-title">평점</p>
							<p class="score-data">${movie.getGrade() }</p>
						</div>
						<div class="rank">
							<p class="score-title">예매율</p>
							<p class="score-data">${reserveRating }%</p>
						</div>
						<div class="float-right" id="right-util-btn">
							<button type="button" class="share">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
									fill="white" class="bi bi-share svg-btn" viewBox="0 -2 20 20">
  								<path
										d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
								</svg>
							</button>
							<a class="reserve" href="/seenema/reserve?location=">예매하기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="poster float-right">
				<p>
					<c:url var="rating" value="${root }resources/imgs/static/rating/" />
					<c:choose>
						<c:when test="${movie.getRating() eq 0 }">
							<span class="rating badge badge-pill badge-success">ALL</span>
						</c:when>
						<c:when test="${movie.getRating() eq 12 }">
							<span class="rating badge badge-pill badge-primary">12</span>
						</c:when>
						<c:when test="${movie.getRating() eq 15 }">
							<span class="rating badge badge-pill badge-warning">15</span>
						</c:when>
						<c:otherwise>
							<span class="rating badge badge-pill badge-danger">청불</span>
						</c:otherwise>
					</c:choose>
				</p>
				<img class="rounded img-fluid float-right"
					alt="${movie.getTitle() }"
					src="${root }resources/images/movie/${movie.getId() }/poster/movie_image.jpg">
			</div>
			<div id="info-menu" class="pt-5">
				<div class="menues pb-5">
					<span class="menu">영화 정보</span>
					<span class="menu">한줄평</span>
					<span class="menu">무비포스트</span>
					<span class="menu-selected">스틸컷</span>
				</div>
			</div>
		</div>		
		<!-- 하단 내용 -->
		<div id="stillcut">
			<div class="stillcut-count-box">
				<h4 class="stillcut-count-text">
					<span class="colored">${movie.getTitle() }</span>
					<span> 에 대한 스틸컷이 </span>
					<c:set var="size" value="${moviePosters.size()+movieStillcuts.size() }" />
					<span class="colored">${size }</span> 
					<span> 개 있어요!</span>
				</h4>
			<hr>
			</div>
			<div class="image-container">
				<div class="image-box pb-5">
				<c:set var="count" value="0" />
				<c:forEach var="poster" items="${moviePosters }">
					<div class="movie-poster shadow bg-white rounded" onclick="modalShow(${size}, ${count = count+1 })">
						<img src="${root }${poster.getPath()}${poster.getName()}">
					</div>
					<%-- <input type="hidden" value="${count = count+1 }" /> --%>
				</c:forEach>
				<c:forEach var="stillcut" items="${movieStillcuts }">
					<div class="movie-stillcut shadow bg-white rounded" onclick="modalShow(${size}, ${count = count+1 })">
						<img src="${root }${stillcut.getPath()}${stillcut.getName()}">
					</div>
					<%-- <input type="hidden" value="${count = count+1 }" /> --%>
				</c:forEach>
				</div>
			</div>
		</div>
		<!-- 하단 내용 -->	
	</div>	
	<!-- 모달 -->
	
	<!-- 링크 공유 모달 -->
	<div id="modal" class="modal-container">
		<div class="modal-window">
			<div class="modal-title">
				<h5>공유하기</h5>
			</div>
			<div class="close-btn">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
				  <path
						d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z" />
				</svg>
			</div>
			<hr>
			<div class="copybox">
				<input type="text" readonly
					value="http://localhost:8080/movie/detail?mid=${movie.getId()}">
				<button>URL 복사</button>
			</div>
		</div>
	</div>
	
	<!-- 이미지 캐러셀 모달 -->
	<div id="crs">
		<div class="crs-bg">
			<div class="crs-window">
				<div class="crs-close" onclick="modalHide()">
					<button type="button" class="close" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="crs-imagebox">
					<img src="">
				</div>
				<div class="crs-buttonbox">
					<input type="hidden" value="" />
					<span class="crs-pre" onclick="pre(${size})">
						<i class="bi bi-arrow-left-circle-fill"></i>
					</span>
					<span class="crs-next" onclick="next(${size})">
						<i class="bi bi-arrow-right-circle-fill"></i>
					</span>
				</div>
			</div>
		</div>	
	</div>
</body>

<footer>
	<%@ include file="../module/footer.jsp"%>
</footer>
</body>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/static/js/moviedetail.js"></script>
</html>
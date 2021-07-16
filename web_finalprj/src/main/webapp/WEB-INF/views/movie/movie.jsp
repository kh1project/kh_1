<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>박스오피스 - SEENEMA</title>
<!-- jstl context path -->
<c:url var="root" value="/" />
<script type="text/javascript"
	src="${root}resources/jquery/js/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${root}resources/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="${root}resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${root}resources/static/css/movie.css">
<link type="text/css" rel="stylesheet"
	href="${root}resources/static/css/common.css">
<script type="text/javascript" src="${root}resources/static/js/movie.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap')
	;
</style>
<style type="text/css">
* {
	font-family: 'Noto Sans KR', sans-serif;
}

ul {
	list-style: none;
	padding-left: 10px;
}

.carousel-item {
	height: 65vh;
	min-height: 350px;
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
</head>
<body>
	<!-- ----------------</header>---------------- -->
	<header>
		<%@ include file="../module/header.jsp"%>
	</header>
	<!-- ----------------</header>---------------- -->
	<!-- ----------------<body>---------------- -->
	<container id="container">
	<div class="page-util">
		<div class="inner-wrap">

			<span class="svg"> <a
				href="<%=request.getContextPath()%>/index"> <svg
						xmlns="http://www.w3.org/2000/svg" width="16" height="16"
						fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
					  <path fill-rule="evenodd"
							d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
					  <path fill-rule="evenodd"
							d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
					</svg>
			</a>
			</span> <span class="svg"> <svg xmlns="http://www.w3.org/2000/svg"
					width="16" height="16" fill="currentColor"
					class="bi bi-caret-right" viewBox="0 0 16 16">
				  <path
						d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z" />
				</svg>
			</span> <span class="page-util-text"> <a href="/movie"> 영화 </a>
			</span>
		</div>
	</div>
	<div class="movies-container">
		<div class="inner-wrap">

			<div id="filter-container">
				<h2>전체영화</h2>
				<select class="custom-select">
					<c:choose>
						<c:when test="${sort eq 1 }">
							<option class="reserve-sort" selected value="1">예매율</option>
							<option class="score-sort" value="2">추천</option>
							<option class="recommend-sort" value="3">별점</option>
						</c:when>
						<c:when test="${sort eq 2 }">
							<option class="reserve-sort" value="1">예매율</option>
							<option class="score-sort" selected value="2">추천</option>
							<option class="recommend-sort" value="3">별점</option>
						</c:when>
						<c:when test="${sort eq 3 }">
							<option class="reserve-sort" value="1">예매율</option>
							<option class="score-sort" value="2">추천</option>
							<option class="recommend-sort" selected value="3">별점</option>
						</c:when>
						<c:otherwise>
							<option class="reserve-sort" selected value="1">예매율</option>
							<option class="score-sort" value="2">추천</option>
							<option class="recommend-sort" value="3">별점</option>
						</c:otherwise>
					</c:choose>
				</select>
				<c:if test="${isAdmin eq true }">
					<button type="button" class="btn btn-primary add-btn">Add
						Movie</button>
				</c:if>
			</div>
			<br>
			<div class="movie-center">
				<c:set var="rank" value="0" />
				<fmt:formatNumber value="${rank }" type="number" var="numRank" />
				<c:forEach var="item" items="${movieList }">
					<div class="movies shadow bg-white rounded">
						<div class="poster">
							<div class="rank">${numRank = numRank+1 }</div>
							<a href="${root}movie/detail?mid=${item.getId() }"><img
								src="${root}/${mainposter.get(item.getId()-1).getPath()}/${mainposter.get(item.getId()-1).getName()}"
								alt="${item.getTitle() }"></a>
						</div>
						<div class="title-box">
							<div class="title">
								<c:url var="rating" value="/resources/imgs/static/rating/" />
								<c:choose>
									<c:when test="${item.getRating() eq 0 }">
										<span class="badge badge-pill badge-success">ALL</span>
									</c:when>
									<c:when test="${item.getRating() eq 12 }">
										<span class="badge badge-pill badge-primary">12</span>
									</c:when>
									<c:when test="${item.getRating() eq 15 }">
										<span class="badge badge-pill badge-warning">15</span>
									</c:when>
									<c:otherwise>
										<span class="badge badge-pill badge-danger">청불</span>
									</c:otherwise>
								</c:choose>
								${item.getTitle() }
							</div>
						</div>
						<hr>
						<div class="info-box">
							<div class="reserve-rating">예매율
								${reserveRating.get(item.getId()) }%</div>
							<p class="partition"></p>
							<div class="grade-box">
								<div class="grade">★</div>
								${item.getGrade()}
							</div>
							<div class="rate-date">개봉일 ${item.playdate }</div>
							<div class="btn-util" id="btns-${item.getId() }">
								<c:set var="liked" value="false" />
								<c:forEach var="likeList" items="${likeList }">
									<c:if test="${item.getId() eq likeList.getMid() }">
										<c:set var="liked" value="true" />
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test='${liked eq "true" }'>
										<span id="like-${item.getId() }"> <span
											class="btn btn-outline-dark"
											onclick="iHateIt(${item.getId() })"> ♥ <c:choose>
													<c:when test="${gcnt.get(item.getId()) eq null}">
												0
											</c:when>
													<c:otherwise>
												${gcnt.get(item.getId()) }
											</c:otherwise>
												</c:choose>
										</span>
										</span>
									</c:when>
									<c:otherwise>
										<span id="unlike-${item.getId() }"> <span
											class="btn btn-outline-dark"
											onclick="iLikeIt(${item.getId() })"> ♡ <c:choose>
													<c:when test="${gcnt.get(item.getId()) eq null}">
												0
											</c:when>
													<c:otherwise>
												${gcnt.get(item.getId()) }
											</c:otherwise>
												</c:choose>
										</span>
										</span>
									</c:otherwise>
								</c:choose>
								<span class="btn btn-outline-dark" id="reserve-${item.getId() }"
									onclick="window.location.href = '${root}reserve?location=';">
									예매 </span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</container>
	<!-- ----------------</body>---------------- -->
	<!-- ----------------<footer>---------------- -->
	<footer>
		<%@ include file="../module/footer.jsp"%>
	</footer>
	<!-- ----------------</footer>---------------- -->
</body>
</html>
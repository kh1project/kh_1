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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<script type="text/javascript"
	src="${root}resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="${root}resources/static/css/movie.css">
<link type="text/css" rel="stylesheet"
	href="${root}resources/static/css/common.css">
<link type="text/css" rel="stylesheet"
	href="${root}resources/static/css/common2.css">
<script type="text/javascript" src="https://kit.fontawesome.com/74ba2bf207.js" crossorigin="anonymous"></script>
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
	<div class="movie-page-util">
		<div class="container">
			<i class="fas fa-home" style="color: #fff"></i>
			<i class="fas fa-angle-right" style="color: #fff"></i>
			<span class="page-util-text"> <a href="<%=request.getContextPath()%>/movie" style="color: #fff"> 영화 </a></span>
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
							<a href="${root}movie/detail?mid=${item.getId() }">
								<c:choose>
									<c:when test="${mainposter.get(item.getId()).getName() ne null}">
										<img src="${root}/${mainposter.get(item.getId()).getPath()}/${mainposter.get(item.getId()).getName()}" alt="${item.getTitle() }">
									</c:when>
									<c:otherwise>
										<img src="${root }resources/images/movie/0/imageNotExist.jpg" alt="${item.getTitle() }">
									</c:otherwise>
								</c:choose>
							</a>
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
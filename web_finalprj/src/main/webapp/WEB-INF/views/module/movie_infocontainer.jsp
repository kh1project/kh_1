<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="info-container">
	<img class="bg-poster" alt="movie-id${movie.getId() }-img"
		src="${root }${mainposter.get(movie.getId()-1).getPath()}${mainposter.get(movie.getId()-1).getName()}">
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
	<img class="rounded img-fluid float-right" alt="${movie.getTitle() }"
		src="${root }${mainposter.get(movie.getId()-1).getPath()}${mainposter.get(movie.getId()-1).getName()}">
</div>
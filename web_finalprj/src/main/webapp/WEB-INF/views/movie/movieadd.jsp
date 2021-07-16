<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화 등록</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/static/js/movieadd.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/common.css">
	<style>
	@import
		url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
	</style>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/movieadd.css">
</head>
<body>
	<header>
		<%@ include file="../module/header.jsp"%>
	</header>
<body class="pt-5">
	<div class="inner-wrap">
		<form class="pt-5">
			<label for="mid">영화 등록번호</label>
			<input class="form-control" id="mid" name="mid" type="text" placeholder="영화 등록번호" value="${mid }" readonly></input>
			<div>
				<div class="info-container pt-5">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">메인 포스터</span>
						</div>
						<div class="custom-file">
							<input type="file" required class="custom-file-input" id="mainposter" aria-describedby="inputGroupFileAddon01">
							<label class="custom-file-label" for="mainposter">선택된 파일 없음</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon02">배경 포스터</span>
						</div>
						<div class="custom-file">
							<input type="file" required class="custom-file-input" id="subposter" aria-describedby="inputGroupFileAddon02"> 
							<label class="custom-file-label" for="subposter">선택된 파일 없음</label>
						</div>
					</div>
					<div>
						<label for="title">영화 제목</label>
						<input class="form-control" id="title" name="title" type="text" placeholder="영화 제목" required></input>
					</div>
					<div>
						<label for="subtitle">영화 부제목</label>
						<input class="form-control" id="subtitle" name="subtitle" type="text" placeholder="영화 부제목"></input>
					</div>
				</div>
			</div>
			<div class="content-text">
				<div class="summary">
					<label for="summary">줄거리</label>
					<textarea class="form-control" name="summary" id="summary" cols="30" rows="10" required></textarea>
				</div>
				<hr>
				<div class="movie-textinfo">
					<div>
					 	<label for="type">상영타입</label>
						<input type="text" class="form-control" id="type" placeholder="상영타입" required>
					</div>
					<div style="margin-bottom: -15px">
						<p>
							<label for="director">감독</label>
							<input type="text" class="form-control" id="director" placeholder="상영타입" required>
						</p>
						<p class="partition" />
						<p>
							<label for="genre">장르</label>
							<input type="text" class="form-control" id="genre" placeholder="장르" required>
						</p>
						 &emsp;/&emsp; 
						<p> 
						 	<label for="runningtime">러닝타임</label>
							<input type="number" step="1" class="form-control" id="runningtime" placeholder="러닝타임" required>
						</p>
						<p class="partition" />
						<p>
							<label for="rating">관람제한등급</label>
							<select	class="custom-select" id="rating" required>
								<option selected disabled value="">관람제한등급</option>
								<option value="0">All</option>
								<option value="12">12</option>
								<option value="15">15</option>
								<option value="19">청불</option>
							</select>
						</p>
						<p class="partition" />
						<p>
						<label for="playdate">개봉일</label>
							<input  class="form-control" name="playdate" id="playdate" type="date" required></input>
						</p>
					</div>
					<p>
					<label for="actor">배우</label>
						<input class="form-control" name="actor" id="actor" type="text" placeholder="경영왕 이경영" required></input>
					</p>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form>
	</div>
	<hr>
	</div>

</body>

<footer>
	<%@ include file="../module/footer.jsp"%>
</footer>

</body>
</html>
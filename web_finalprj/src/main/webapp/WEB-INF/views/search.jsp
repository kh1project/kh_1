<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/static/css/font.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/static/css/search.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://kit.fontawesome.com/74ba2bf207.js" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="module/header.jsp"></jsp:include>
	<div class="page-util">
		<div class="container">
			<i class="fas fa-home"></i>
			<i class="fas fa-angle-right"></i>
			<span class="page-util-text"> <a href="<%=request.getContextPath()%>/index/search"> 영화 </a></span>
			<i class="fas fa-angle-right"></i>
			<span class="page-util-text"> <a href="<%=request.getContextPath()%>/index/search"> 전체영화 </a></span>
		</div>
	</div>
	<h3>전체영화</h3>
	<ul class="nav nav-tabs">
	  <li><a class="nav-link active" href="#">박스오피스</a></li>
	  <li><a class="nav-link" href="#">상영예정작</a></li>
	</ul>
	<div class="tab-content">
		<!-- 박스오피스 -->
		<div class="tab-pane">
			<div class="tab-header">
				<!-- 토글버튼 -->
				<h5><span></span>개의 영화가 검색되었습니다.</h5>
				<div>
					<form>
						<input type="text" placeholder="영화">
					</form>
				</div>
			</div>
			<div class="tab-body">
			
			</div>
		</div>
		
		<!-- 상영예정작 -->
		<!-- 
		<div class="tab-pane">
		</div> -->
	</div>
</body>
</html>
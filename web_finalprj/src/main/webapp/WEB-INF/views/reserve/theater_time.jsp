<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 - SEENEMA</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/reserve/theater.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/common.css">
<script type="text/javascript" src="https://kit.fontawesome.com/74ba2bf207.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
</head>
<body class="pt-3">
	<header>
  		<%@ include file="../module/header.jsp" %>
	</header>
	<c:url var="location" value="/reserve" />
	<section class="theater-frame pt-5">
		<div class="page-util">
			<div class="container">
				<i class="fas fa-home"></i>
				<i class="fas fa-angle-right"></i>
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/reserve/theater"> 영화관 </a></span>
				<i class="fas fa-angle-right"></i>
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/reserve/timelist"> 상영시간표 </a></span>
			</div>
		</div>
		<div class="page-title">
			<div class="container">
				<h1>영화관</h1>
				<button class="btn" id="tooltip"
					type="button" data-toggle="tooltip" data-placement="top" title="❤">
					<span>선호극장</span>
				</button>
			</div>
			<hr>
		</div>
		<div id="container">
			<section class="pt-4">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" href="${location }/theater">극장정보</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="${location }/timelist">상영시간표</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${location }/price">관람료</a>
					</li>
				</ul>
			</section>
		</div>
	</section>
	<footer>
	 	<%@ include file="../module/footer.jsp" %>
	</footer>
<script type="text/javascript">
	$(document).ready(function () {
		alert("[✔준비중인 페이지입니다]");
	});
	$(document).ready(function () {
	  $("[data-toggle='tooltip']").tooltip();
	});
</script>
</body>
</html>
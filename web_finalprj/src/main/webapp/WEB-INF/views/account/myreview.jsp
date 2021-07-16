<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/review.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://kit.fontawesome.com/74ba2bf207.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/static/js/common.js"></script>

<title>나의 SEENEMA - 내가 쓴 리뷰</title>
</head>
<body>
	<header>
		<jsp:include page="../module/header.jsp"></jsp:include>
	</header>
	<container id="container">
		<div class="page-util">
			<div class="container">
				<i class="fas fa-home"></i>
				<i class="fas fa-angle-right"></i>
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/mypage"> 마이페이지 </a></span>
				<i class="fas fa-angle-right"></i>
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/myreview"> 내가 쓴 리뷰 </a></span>
			</div>
		</div>
		<div class="page-title"><div class="container"><h1>내가 쓴 리뷰</h1></div></div>
		</container>
</body>
</html>
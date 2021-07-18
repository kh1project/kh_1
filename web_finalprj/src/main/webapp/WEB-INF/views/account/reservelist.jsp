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

<title>나의 SEENEMA - 예매한 영화</title>
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
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/reservelist"> 예매한 영화 </a></span>
			</div>
		</div>
		<div class="page-title"><div class="container"><h1>예매한 영화</h1></div></div>
		</container>
		
		<!-- 
		<div class="my-page-container">
			<div class="my-page-wrapper">
				<div class="my-page-header">예약한 영화 목록</div>
				<div class="movie-reserve-list">
					<%
						if (list == null) {
					%>
					<div>예약한 영화가 없습니다</div>
					<%
						} else {
							for (int i = 0; i < list.size(); i++) {
								CGVReserveDto reserveDto = list.get(i);
					%>
					<div class="movie-reserve">
						<div class="movie-reserve-age"><%=reserveDto.getMovieAge() %></div>
						<div class="movie-reserve-title"><%=reserveDto.getTitle() %></div>
						<div class="movie-reserve-theater-wrapper">
							<div><%=reserveDto.getSelectedTheater() %></div>
							&nbsp;/&nbsp;
							<div class="ticket-numeber"><%=reserveDto.getTicketNumber() %>장</div>
						</div>
						<div class="movie-reserve-seats"><%=reserveDto.getSelectedSeat() %></div>
						<div class="movie-reserve-date-wrapper">
							<div class="movie-reserve-date"><%=reserveDto.getMovieDate() %></div>
							<div class="movie-reserve-runningTime"><%=reserveDto.getRunningTime() %></div>
						</div>
						<div class="movie"></div>

						<div class="pay-information-wrapper">
							<div class="pay-information-date-wrapper">
								<div class="pay-information-date-title">결제한 날</div>
								<div class="pay-information-date"><%=reserveDto.getCgvPayDto().getPayDate() %></div>
							</div>

							<div class="pay-information-money-wrapper">
								<div class="pay-information-money-title">결제한 비용</div>
								<div class="pay-information-money"><%=reserveDto.getCgvPayDto().getPayMoney() %>원</div>
							</div>

							<div class="barcode-wrapper">
								<div>CGV</div>
								<img src="images/barcode.png">
							</div>

						</div>
					</div> -->
		<!-- 
		<div class="card" style="width: 18rem;">
		  <img src="..." class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Card title</h5>
		    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
		  </div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">An item</li>
		    <li class="list-group-item">A second item</li>
		    <li class="list-group-item">A third item</li>
		  </ul>
		  <div class="card-body">
		    <a href="#" class="card-link">Card link</a>
		    <a href="#" class="card-link">Another link</a>
		  </div>
		</div>
		 -->
</body>
</html>
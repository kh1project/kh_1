<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 - 결제 완료</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/reserve.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/reservation.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<c:url var="cencel" value="/ajax/reserve/cencel"/>
<script type="text/javascript">
	function cencel() {
		$.ajax({
			url: "${cencel}",
			type: "get",
			datatype: "json",
			data: {
				orderid: document.getElementById("id_orderid").value
			},
			success: function(data) {
				if(data.result == false) {
					alert("예매를 취소 할 수 없습니다.");
				} else {
					alert("예매를 취소했습니다.");
					location.href="<%=request.getContextPath() %>/index";
				}
			}
		});
	}
</script>
</head>
<body class="pt-5">
	<header>
		<%@ include file="../module/header.jsp" %>
	</header>
	
	<section class="reserve-frame pt-5">
		<div class="reserve-window">
			<%@ include file="../module/ReserveFrame.jsp" %>
			
			<div class="main-frame">
				<div class="info-title">
					<label class="title">결제 완료</label>
				</div>
				
				<c:forEach var="movie" items="${moviedata }">
					<c:set var="title" value="${movie.title }" />
				</c:forEach>
				
				<c:forEach var="btlist" items="${btlist }">
						<c:set var="location" value="${btlist.location }" />
						<c:set var="spot" value="${btlist.name }" />
						<c:set var="theater" value="${btlist.tname }" />
					</c:forEach>
				
				<c:forEach var="paylist" items="${paylist }">
					<c:set var="title" value="${paylist.title }" />
					<c:set var="rcnt" value="${paylist.peple }" />
					<c:set var="payment" value="${paylist.methodPay }" />
					<c:set var="totalpay" value="${paylist.total }" />
				</c:forEach>
				
				<c:forEach var="timelist" items="${timelist }">
					<c:set var="moviedate" value="${timelist.moviedate }" />
					<c:set var="starttime" value="${timelist.starttime }" />
					<c:set var="endtime" value="${timelist.endtime }" />
				</c:forEach>
				
				<div class="info-reserve">
					<div class="info-ticket">
						<div class="reserve-title">
							<label class="reserve-ticket">예매 티켓</label>
						</div>
						<div class="list-ticket">
							<label class="reserve-list">예매 내역</label>
							<hr class="check">
							<label class="list">예매 번호</label><input class="info reservation" name="reservationId" id="id_orderid" value="${orderid }" readonly>
							<label class="list">예매 영화</label><input class="info" name="movieTitle" value="${title }" readonly>
							<label class="list">상영관</label><input class="info" name="BranchTheater" value="${location } ${spot } ${theater }" readonly>
							<label class="list">예매 일시</label><input class="info" name="moviedate" value="${moviedate }" readonly>
							<label class="list">인원</label><input class="info" name="rcnt" value="${rcnt }" readonly>
							<label class="list">좌석</label>
							<div class="info-seat">
							<c:forEach var="seatlist" items="${seatlist }">
								<input class="info-seat" name="seats" value="${seatlist.seatrow }${seatlist.seatcol }" readonly>
							</c:forEach>
							</div>
							<label class="list">결제 금액</label><input class="info" name="totalpay" value="${totalpay }" readonly>
							<label class="list">결제 수단</label><input class="info" name="payment" value="${payment }" readonly>
						</div>
					</div>
				</div>
				<div class="mainpage">
					<input type="button" class="mainbnt" value="Home" onclick="location.href='<%=request.getContextPath() %>/index';">
					<input type="button" class="cancelbnt" value="예매 취소" onclick="cencel()">
				</div>
			</div>
		</div>
	</section>
	
	<footer>
		<%@ include file="../module/footer.jsp" %>
	</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.requestURL}" />
<div class="left-menu">
	<ul>
		<c:choose>
			<c:when test="${fn:endsWith(path, 'reserve.jsp') }">
				<li class="choice-movie active" onclick="location.href='<%=request.getContextPath() %>/reserve?location='">지점</li>
				<c:choose>
				  <c:when test="${empty param.location  || empty param.name }">
					<li class="choice-schedule" onclick="alert('지역/지점을 선택해주세요.');">영화</li>
				  </c:when>
				  <c:otherwise>
				  	<li class="choice-schedule" onclick="location.href='<%=request.getContextPath() %>/reserve/schedule?location=${param.location }&name=${param.name }'">영화</li>
				  </c:otherwise>
				</c:choose>
				<c:choose>
				  <c:when test="${empty param.title }">
				  	<li class="choice-time"
					onclick="alert('지역/지점을 선택해주세요.');">상영시간</li>
				  </c:when>
				  <c:otherwise>
				  	<li class="choice-time"
					onclick="location.href='<%=request.getContextPath() %>/reserve/time?location=${param.location }&name=${param.name }&rating=${param.rating }&title=${fn:replace(param.title, '#', '%23') }&moviedate=${param.moviedate }'">상영시간</li>
				  </c:otherwise>
				</c:choose>
				<li class="choice-seat">좌석</li>
				<li class="choice-payment" >결제</li>
				<li class="choice-paySuccess" >결제완료</li>
			</c:when>
			<c:when test="${fn:endsWith(path, 'schedule.jsp') }">
				<li class="choice-movie" onclick="location.href='<%=request.getContextPath() %>/reserve?location='">지점</li>
				<li class="choice-schedule active" onclick="location.href='<%=request.getContextPath() %>/reserve/schedule?location=${param.location }&name=${param.name }'">영화</li>
				<c:choose>
				  <c:when test="${empty param.title }">
				  	<li class="choice-time"
					onclick="alert('관람하실 영화를 선택해주세요.');">상영시간</li>
				  </c:when>
				  <c:otherwise>
				  	<li class="choice-time"
					onclick="location.href='<%=request.getContextPath() %>/reserve/time?location=${param.location }&name=${param.name }&rating=${param.rating }&title=${fn:replace(param.title, '#', '%23') }&moviedate=${param.moviedate }'">상영시간</li>
				  </c:otherwise>
				</c:choose>
				<li class="choice-seat">좌석</li>
				<li class="choice-payment">결제</li>
				<li class="choice-paySuccess">결제완료</li>
			</c:when>
			<c:when test="${fn:endsWith(path, 'time.jsp') }">
				<li class="choice-movie" onclick="location.href='<%=request.getContextPath() %>/reserve?location='">지점</li>
				<li class="choice-schedule" onclick="location.href='<%=request.getContextPath() %>/reserve/schedule?location=${param.location }&name=${param.name }'">영화</li>
				<li class="choice-time active"
					onclick="location.href='<%=request.getContextPath() %>/reserve/time?location=${param.location }&name=${param.name }&rating=${param.rating }&title=${fn:replace(param.title, '#', '%23') }&moviedate=${param.moviedate }'">상영시간</li>
				<li class="choice-seat">좌석</li>
				<li class="choice-payment" >결제</li>
				<li class="choice-paySuccess" >결제완료</li>
			</c:when>
			<c:when test="${fn:endsWith(path, 'seats.jsp') }">
				<li class="choice-movie" onclick="location.href='<%=request.getContextPath() %>/reserve?location='">지점</li>
				<li class="choice-schedule" onclick="location.href='<%=request.getContextPath() %>/reserve/schedule?location=${param.location }&name=${param.name }'">영화</li>
				<li class="choice-time"
					onclick="location.href='<%=request.getContextPath() %>/reserve/time?location=${param.location }&name=${param.name }&rating=${param.rating }&title=${fn:replace(param.title, '#', '%23') }&moviedate=${param.moviedate }'">상영시간</li>
				<li class="choice-seat active">좌석</li>
				<li class="choice-payment">결제</li>
				<li class="choice-paySuccess" >결제완료</li>
			</c:when>
			<c:when test="${fn:endsWith(path, 'reservecheck.jsp') }">
				<li class="choice-movie" onclick="location.href='<%=request.getContextPath() %>/reserve?location='">지점</li>
				<li class="choice-schedule" style="cursor: default">영화</li>
				<li class="choice-time" style="cursor: default">상영시간</li>
				<li class="choice-seat">좌석</li>
				<li class="choice-payment active">결제</li>
				<li class="choice-paySuccess">결제완료</li>
			</c:when>
			<c:otherwise>
				<li class="choice-movie" onclick="location.href='<%=request.getContextPath() %>/reserve?location='">지점</li>
				<li class="choice-schedule" onclick="location.href='<%=request.getContextPath() %>/schedule?location=${param.location }&name=${param.name }'">영화</li>
				<li class="choice-time"
					onclick="location.href='<%=request.getContextPath() %>/reserve/time?location=${param.location }&name=${param.name }&rating=${param.rating }&title=${fn:replace(param.title, '#', '%23') }&moviedate=${param.moviedate }'">상영시간</li>
				<li class="choice-seat">좌석</li>
				<li class="choice-payment">결제</li>
				<li class="choice-paySuccess active">결제완료</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
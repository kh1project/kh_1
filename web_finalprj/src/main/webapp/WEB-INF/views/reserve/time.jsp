<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영시간표 - SEENEMA</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/reserve/reserve.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/reserve/time.css">
<!-- 툴팁 활성화시 필요! -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://kit.fontawesome.com/74ba2bf207.js" crossorigin="anonymous"></script>
</head>
<body class="pt-3">
  <header>
  	<%@ include file="../module/header.jsp" %>
  </header>
  <section class="reserve-frame pt-5">
   	<div class="page-util">
		<div class="container">
			<i class="fas fa-home"></i>
			<i class="fas fa-angle-right"></i>
			<span class="page-util-text"> <a href="<%=request.getContextPath()%>/reserve?location="> 예매 </a></span>
		</div>
	</div>
  <c:url var="location" value="/reserve" />
  <form method="get" action="${location }/seats">
	  <div class="reserve-window">
	  <%@ include file="../module/ReserveFrame.jsp" %>
		<div class="row" id="title">
		  <div class="col-12">
		  	<c:set var="now" value="<%=new java.util.Date()%>" />
			<label class="time_info"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd (E)" /></label>
		  </div>
		</div>
		<div class="row" id="time_form">
		  <div class="col">
		    <label id="sub">
		    <c:choose>
		        <c:when test="${param.rating eq '0'}">
		          <span class="badge badge-pill badge-success">ALL</span>
		        </c:when>
		        <c:when test="${param.rating eq '12'}">
		          <span class="badge badge-pill badge-primary">12</span>
		        </c:when>
		        <c:when test="${param.rating eq '15'}">
		          <span class="badge badge-pill badge-warning">15</span>
		        </c:when>
		        <c:otherwise>
		          <span class="badge badge-pill badge-danger">19</span>
		        </c:otherwise>
            </c:choose>
		    ${param.title } - 시간표</label><hr>
			<div class="row" id="not">
			<c:if test="${empty timelist }">
				<div class="col">
					<label>상영시간이 존재하지 않습니다.</label>
				</div>
			</c:if>
			<c:if test="${!empty timelist }">
			  <c:forEach var="TimeDTO" items="${timelist}" varStatus="status">
		    	<div class="col-4">
			    	<a class="btn btn-primary" id="tooltip" type="button" data-toggle="tooltip" data-placement="top" title="${TimeDTO.endtime }"
			    	  href="${location }/seats?location=${param.location }&name=${param.name }&rating=${param.rating }&title=${fn:replace(param.title, '#', '%23') }&moviedate=${param.moviedate }&tid=${TimeDTO.tid }&starttime=${TimeDTO.starttime }&endtime=${TimeDTO.endtime }">
				      <dl>
				        <dt>
				          <strong>${TimeDTO.starttime }</strong>
				        </dt>
				        <dd>
				          <strong>${TimeDTO.seat_reserved }</strong>
				           / ${TimeDTO.seat_count }
				        </dd>
				        <dd>${TimeDTO.name }</dd>
				      </dl>
					</a>
				</div>
			  </c:forEach>
			</c:if>
			</div>
		  </div>
		</div>
		<input type="hidden" name="location" value="${param.location }">
		<input type="hidden" name="name" value="${param.name }">
		<input type="hidden" name="rating" value="${param.rating }">
        <input type="hidden" name="title" value="${param.title }">
        <input type="hidden" name="tid" value="${TimeDTO.tid }">
        <input type="hidden" name="starttime" value="${param.startime }">
        <input type="hidden" name="endtime" value="${param.endtime }">
        <input id="idnow" type="hidden" name="moviedate">
	  </div>
	</form>
	</section>
  <footer>
  	<%@ include file="../module/footer.jsp" %>
  </footer>
<script type="text/javascript">
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var day = today.getDate();
	if(month <= 9) {
		month = "0" + month;
	}
	if(day <= 9) {
		day = "0" + day;
	}
	today = year + "-" + month + "-" + day;
	document.getElementById("idnow").value = today;
	
	$(document).ready(function () {
		  $("[data-toggle='tooltip']").tooltip();
		});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 - SEENEMA</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/reserve.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/reserve_list.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/common.css">
</head>
<body class="pt-5">
  <header>
  	<%@ include file="../module/header.jsp" %>
  </header>
  <section class="reserve-frame pt-5">
  <c:url var="location" value="/reserve" />
  <form name="form" method="get" action="${location }/schedule">
	<div class="reserve-window">
	<%@ include file="../module/ReserveFrame.jsp" %>
	  <div class="row" id="title">
	  	<div class="col-12">
	  	  <label id="sub">지역</label>
	  	</div>
	  </div>
	  <div class="row" id="movielist">
        <div class="col-6">
          <label id="sub">전체</label><hr>
          <div class="row">
            <div class="col">
			  <div class="list-group list-group-flush" id="list-tab" role="tablist">
				<!-- 지역 클릭시 active 활성화 -->
				<c:choose>
				  <c:when test="${param.location eq '서울' }">
			    	<a class="list-group-item py-4 list-group-item-action active" id="location-list"
			    	href="${location }?location=서울" role="tab" aria-controls="seoul">서울</a>
			      </c:when>
			      <c:otherwise>
			        <a class="list-group-item py-4 list-group-item-action" id="location-list"
			    	href="${location }?location=서울" role="tab" aria-controls="seoul">서울</a>
			      </c:otherwise>
			    </c:choose>
			    <c:choose>
			      <c:when test="${param.location eq '경기' }">
			        <a class="list-group-item py-4 list-group-item-action active" id="location-list"
				    href="${location }?location=경기" role="tab" aria-controls="gyeonggi">경기</a>
			      </c:when>
			      <c:otherwise>
			        <a class="list-group-item py-4 list-group-item-action" id="location-list"
				    href="${location }?location=경기" role="tab" aria-controls="gyeonggi">경기</a>
			      </c:otherwise>
			    </c:choose>
			    <c:choose>
			      <c:when test="${param.location eq '인천' }">
			        <a class="list-group-item py-4 list-group-item-action active" id="location-list"
				    href="${location }?location=인천" role="tab" aria-controls="incheon">인천</a>
			      </c:when>
			      <c:otherwise>
			        <a class="list-group-item py-4 list-group-item-action" id="location-list"
				    href="${location }?location=인천" role="tab" aria-controls="incheon">인천</a>
			      </c:otherwise>
			    </c:choose>
			    <c:choose>
			      <c:when test="${param.location eq '대전/충청/세종' }">
			        <a class="list-group-item py-4 list-group-item-action active" id="location-list"
				    href="${location }?location=대전/충청/세종" role="tab" aria-controls="daejeon">대전/충청/세종</a>
			      </c:when>
			      <c:otherwise>
			        <a class="list-group-item py-4 list-group-item-action" id="location-list"
				    href="${location }?location=대전/충청/세종" role="tab" aria-controls="daejeon">대전/충청/세종</a>
			      </c:otherwise>
			    </c:choose>
			    <c:choose>
			      <c:when test="${param.location eq '부산/대구/경상' }">
			        <a class="list-group-item py-4 list-group-item-action active" id="location-list"
				    href="${location }?location=부산/대구/경상" role="tab" aria-controls="busan">부산/대구/경상</a>
			      </c:when>
			      <c:otherwise>
			        <a class="list-group-item py-4 list-group-item-action" id="location-list"
				    href="${location }?location=부산/대구/경상" role="tab" aria-controls="busan">부산/대구/경상</a>
			      </c:otherwise>
			    </c:choose>
			    <c:choose>
			      <c:when test="${param.location eq '광주/전라' }">
			        <a class="list-group-item py-4 list-group-item-action active" id="location-list"
				    href="${location }?location=광주/전라" role="tab" aria-controls="gwangju">광주/전라</a>
			      </c:when>
			      <c:otherwise>
			        <a class="list-group-item py-4 list-group-item-action" id="location-list"
				    href="${location }?location=광주/전라" role="tab" aria-controls="gwangju">광주/전라</a>
			      </c:otherwise>
			    </c:choose>
			    <c:choose>
			      <c:when test="${param.location eq '강원' }">
			        <a class="list-group-item py-4 list-group-item-action active" id="location-list"
				    href="${location }?location=강원" role="tab" aria-controls="gangwon">강원</a>
			      </c:when>
			      <c:otherwise>
			        <a class="list-group-item py-4 list-group-item-action" id="location-list"
				    href="${location }?location=강원" role="tab" aria-controls="gangwon">강원</a>
			      </c:otherwise>
			    </c:choose>
			  </div>
		    </div>
          </div>
        </div>
        <div class="col-6">
          <c:choose>
	        <c:when test="${param.location != '' }">
              <label id="sub">지점</label><hr>
            </c:when>
            <c:otherwise>
              <label id="sub">지역을 선택해주세요</label>
            </c:otherwise>
            </c:choose>
          <div class="row">
            <div class="col">
			  <div class="list-group list-group-flush" id="list-tab" role="tablist">
			    <!-- 지점리스트 출력 -->
			  	<c:forEach var="branchDTO" items="${branchlist}" varStatus="status">
			  	  <c:choose>
			  	    <c:when test="${branchDTO.name eq param.name }">
			  	      <a class="list-group-item py-4 list-group-item-action active" id="name-list"
			  	        href="${location }?location=${param.location }&name=${branchDTO.name }" role="tab" aria-controls="home">
				      ${branchDTO.name}</a>
			  	    </c:when>
			  	    <c:otherwise>
		  	    	  <a class="list-group-item py-4 list-group-item-action" id="name-list"
		  	    	    href="${location }?location=${param.location }&name=${branchDTO.name }" role="tab" aria-controls="home">
			          ${branchDTO.name}</a>
			  	    </c:otherwise>
			  	  </c:choose>
			    </c:forEach>
			  </div>
		    </div>
          </div>
        </div>
        <div class="col" id="next">
	       <input type="hidden" name="location" value="${param.location }">
	       <input type="hidden" name="name" value="${param.name }">
	       <input class="btn btn-outline-primary" type="button" onclick="check()" value="다음 >">
	    </div>
      </div>
	</div>
  </form>
  </section>
  <footer>
  	<%@ include file="../module/footer.jsp" %>
  </footer>
<script type="text/javascript">
function check() {
	if(${param.location eq ''}) {
		alert("지역을 선택해주세요.");
		return false;
	} else if(${param.name eq null}) {
		alert("지점을 선택해주세요.");
		return false;
	} else {
		form.submit();
	}
}
</script>
</body>
</html>
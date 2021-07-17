<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SEENEMA - movie theater</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/static/css/font.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/static/css/main.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<c:url var="url" value="/indexAjax" />
<script type="text/javascript">
	function like(mid, ele) {
		if(ele.children.heart.innerText == '♥ ') {
			alert('이미 좋아요를 누른 영화입니다.');
			return;
		}
		
		// el태그 표기법 확인해야 함.
		if(${sessionScope.account != null && sessionScope.account.id == mygcnt.aid }) {
			// 로그인이 된 상태
			$.ajax({
				url: "${url }",
				type: "get",
				datatype: "json",
				data: {
					mid: mid
				},
				success: function(data) {
					if(data.res == "success") {
						var span = ele.children;
						span.gcnt.innerText = data.gcnt;
						span.heart.innerText = "♥ ";
						span.heart.style.color = "red";
					}
				}
				/*error: function(request, status, error) {
					console.log("error code: " + request.status + "\nmessage: " + request.responseText + "\nerror: " + error);
				}*/
			});
		} else {
			// 로그인이 안 된 상태
			alert('로그인 후 이용가능한 서비스입니다.');
		}
	}
</script>
</head>
<!-- 
<style>
	#boxoffice {
		background-image: url('https://source.unsplash.com/RCAhiGJsUUE/1920x1080');
		color: white;
		padding: 50px 0px 100px;
	}
</style>
-->

<body class="pt-5">
    <%@ include file="./module/header.jsp" %>

	<div>
	  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	    </ol>
	    <div class="carousel-inner" role="listbox">
	    
	      <c:forEach var="item" items="${carousel }" varStatus="status">
	      	<c:choose>
	      		<c:when test="${status.index == 0 }">
	      			<div class="carousel-item active">
	      		</c:when>
	      		<c:otherwise>
	      			<div class="carousel-item">
	      		</c:otherwise>
	      	</c:choose>
	      		<c:url var="path1" value="/resources/images/movie/${item }/stillcut/movie_image (5).jpg" />
	      		<img src="${path1 }">
	      	</div>
	      </c:forEach>
	    </div>
	   	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	          <span class="sr-only">Previous</span>
	    </a>
	    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	          <span class="carousel-control-next-icon" aria-hidden="true"></span>
	          <span class="sr-only">Next</span>
	    </a>
	  </div>
	</div>
	
	
	
	
	    
	<div id="boxoffice">
		<div class="caption">
			박스오피스
		</div>
		<div class="container-fluid">
			<c:url var="more" value="/movie" />
			<a href="${more }"><p id="more">영화 더 보기<span style="display: inline-block; font-size: xx-large">+</span></p></a>
			<div class="row">
			  <div class="col-md-2">
			  </div>
			  
			  <c:forEach var="item" items="${boxoffice }" varStatus="status" >
				  <div class="col-md-2">
				    <div class="card">     
				    	<c:url var="path2" value="/resources/img/${item.id }/poster/movie_image.jpg" />
				  		<img class="card-img mb-2" src="${path2 }">
					    <div class="card-img-overlay">
				      		<h1 class="card-title">${status.count }</h1>
				      	</div>
				      	<!-- <c:url var="detail" value="/movie/detail?id=${item.id }" /> -->
				      	<div class="card-img-overlay summary" onclick="location.href='/seenema/movie/detail?id=${item.id }'">
				      		<p class="card-text">${item.summary }</p>
				      	</div>
				    </div>
				    <div class="cover">
				        <button class="btn btn1 btn-outline-light" onclick="like(${item.id }, this);">
				        
				        	<c:choose>
					        	<c:when test="${empty mygcnt }">
							        <span name="heart">♡ </span><span name="gcnt">${item.gcnt }</span>
					        	</c:when>
					        	<c:otherwise>
					        		<c:set var="flag" value="false" />
							        <c:forEach var="mv" items="mygcnt" varStatus="i">
							        	<c:if test="${varStatus <= 3 && not flag}">
							        		<c:choose>
							        			<c:when test="${item.id == mv }">
							        				<span name="heart">♥ </span><span name="gcnt">${item.gcnt }</span>
							        				<c:set var="flag" value="true" />
							        			</c:when>
							        			<c:otherwise>
							        				<span name="heart">♡ </span><span name="gcnt">${item.gcnt }</span>
							        			</c:otherwise>
							        		</c:choose>
							        	</c:if>
							        </c:forEach>
					        	</c:otherwise>
					        </c:choose>
					        
				        </button>
				        <a href="<c:url value='/reserve?location=' />" class="btn btn2 btn-primary">예매하기</a>
					</div>
				  </div> 
			  </c:forEach>
			  
			  <div class="col-md-2">
			  </div>
		   </div>
		</div>
	</div>
	
	

	
    <%@ include file="./module/footer.jsp" %>

<script type="text/javascript">
	$(function() {
		$('.container:first-child').on('click', function() {
			$('#box').show();
		});
	});
	$(function() {
		// 이미지 슬라이드 컨트롤을 사용하기 위해서는 carousel를 실행해야한다.
		var target = $('#carouselExampleIndicators').carousel({
			// 슬라이딩 자동 순환 지연 시간
			// false로 설정하여 bootstrap에서는 cycle를 움직이지 못하게 한다..
			interval: false,
			// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
			pause: "hover",
			// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
			wrap: true,
			// 키보드 이벤트 설정 여부
			keyboard : true
			});

		// Interval를 설정해서 next가 아닌 prev로 하면 반대로 움직인다.
		setInterval(function() {
			target.carousel('prev');
			}, 3000);
	});
</script>
</body>
</html>
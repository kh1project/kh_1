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
	<div class="page-title"><div class="container"><h1>내가 쓴 리뷰</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	  			<button class="btn btn-primary" type="button" onclick="location.href='/seenema/index'" style="border: none; 
	  			padding: 12px 25px 12px 25px; font-size:1.2rem; background-color: #503396;">메인으로</button>
			</div>
	</div>
	</div>
		</container>
		
		<div class="row">
			<c:if test="${list == null}">
				<h1 class="listnull">리뷰 리스트가 존재하지 않습니다.</h1>
			</c:if>
			<c:if test="${list != null }">
				<c:forEach var="i" items="${list }" varStatus="loop">
						  <!-- 리뷰 1개 영역 START -->
					<div class="col-md-3">
						<div class="card mb-3 shadow-sm rlist">
							<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><div class="card-image"><img src="${i.getImgurl() }"></div></a>
							<div class="card-body">
								<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><small class="text-muted">${i.getNickname() }</small></a>
								<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><h5>${i.getTitle() }</h5></a>
								<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><p>${i.getContents() }</p></a>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary btn-gcnt" data-id="${i.getId() }"><i class="far fa-thumbs-up fa-fw"></i><span>${i.getGcnt() }</span></button>
										<button type="button" class="btn btn-sm btn-outline-secondary btn-bcnt" data-id="${i.getId() }"><i class="far fa-thumbs-down fa-fw"></i><span>${i.getBcnt() }</span></button>
										<button type="button" class="btn btn-sm btn-outline-secondary btn-cnt"><i class="far fa-comment-alt fa-fw"></i><span>${i.getCommcnt() }</span></button>
									</div>
									<small id="cdate${loop.count }" class="text-muted cdate" data-cdate="${i.getCdateFM() }"></small>
								</div>
							</div>
						</div>
					</div>
					<!-- 리뷰 1개 영역 END -->
				</c:forEach>
			</c:if>
		</div>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<footer>
		<%@ include file="../module/footer.jsp" %>	
	</footer>
		
</body>
</html>
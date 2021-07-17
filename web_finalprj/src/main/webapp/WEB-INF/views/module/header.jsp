<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.navbar .container { display:flex; flex-direction: column; position:relative; }
.navbar .container .mini-menu { width:100%; text-align:right; position:absolute; right:15px; top:-5px; }
.navbar .container .mini-menu a { color:#fff; font-size:1.05rem; position:relative; padding-left:10px; } 
.navbar .container .menu { width:100%; display:flex; justify-content: space-between; align-items: center;}
.navbar .container .menu a { color:#fff; font-size:1.2rem; letter-spacing:0.1rem; position:relative; top:7px; }
.navbar .container .menu img { height:56px; padding:0.5rem 0; cursor:pointer }
.navbar .container > div a:hover {text-decoration:none;}
body { padding-top:66px !important; }
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
  	<div class="mini-menu">
  	<ul>
	<ul class="nav justify-content-end">
			<c:choose>
			<c:when test="${sessionScope.logined }">
					<li class="nav-item">
						<c:url var="mypage" value="/account/mypage?id=${account.id  }" />
						<a class="nav-link" a href="${mypage } ">마이페이지</a>
					</li>
					<li class="nav-item">
						<c:url var="logout" value="/account/logout" />
						<a class="nav-link" a href="${logout }">로그아웃</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav justify-content-end">
					<li class="nav-item">
						<c:url var="login" value="/account/login" />
						<a class="nav-link" a href="${login }">로그인</a>
					</li>				
					<li class="nav-item">
						<c:url var="join" value="/account/join" />
						<a class="nav-link" href="${join }">회원가입</a>
					</li>
			</c:otherwise>
			</c:choose>
		</ul>

  	</div>
  	&nbsp;
  	<div class="menu">
	  	<a href="<%=request.getContextPath() %>/movie">영화</a>
	  	<a href="<%=request.getContextPath() %>/reserve/theater">영화관</a>
	    <img src="<%=request.getContextPath() %>/resources/images/common/logo.png" class="d-inline-block align-top" alt="SEENEMA 로고" onclick="location.href='<%=request.getContextPath() %>/index';">
	    <a href="<%=request.getContextPath() %>/reserve?location=${branchDTO.location }">예매</a>
	    <a href="<%=request.getContextPath() %>/review">리뷰</a>
    </div>
  </div>
</nav>
&nbsp;
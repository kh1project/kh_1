<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEENEMA - 환영합니다!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css" integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/review.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://kit.fontawesome.com/74ba2bf207.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/static/js/common.js"></script>

	<c:url var="main" value="/index" />
	<c:url var="login" value="/account/login" />
	<c:url var="join" value="/account/join" />

<style type="text/css">
:root{
	--body-background-color: #f5f6f7;
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--purple-color: #8041D9;
}
	
*{
	margin:0;
	padding:0;
}
body{
	background:var(--body-background-color);
}
.main-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.main-container .main-wrap{
	width:768px;
}
.main-container .main-wrap .logo-wrap{
	padding-top:55px;
}
.main-container .main-wrap .logo-wrap img
{
	width: 231px;
	height: 44px;
}
.main-container .main-wrap header .logo-wrap{
	display:flex;	
	flex-direction: column;
	align-items: center;
}
.login-input-section-wrap{
	padding-top: 60px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.login-input-wrap{
	width: 465px;
	height :48px;
	border: solid 1px var(	--border-gray-color );
	background: white;
}
.password-wrap{
	margin-top: 13px;
}
.login-input-wrap input{
	border: none;
	width:430px;
	margin-top: 10px;
	font-size: 14px;
	margin-left: 10px;
	height:30px;
}
.login-button-wrap {
	padding-top: 13px;
}
.login-button-wrap button{
	width: 465px;
	height :48px;
	font-size: 20px;
	background: var(--purple-color);
	color: white;
	border: none;
}
.login-stay-sign-in{
	width: 465px;
	height: 52px;
	
	display: flex;
	font-size: 15px;
	color: #4e4e4e;
	align-items: center;
	justify-content: flex-start;
	border-bottom: solid 1px var(--border-gray-color);
}
.login-stay-sign-in i{
	font-size: 25px;
	color: #9ba1a3;
}
.login-stay-sign-in span{
	padding-left: 5px;
	line-height: 25px;
}
.Easy-sgin-in-wrap{
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 40px;
}
.Easy-sgin-in-wrap h2{
	font-size: 20px;
}
.Easy-sgin-in-wrap .sign-button-list
{
	padding-top:25px;
	list-style: none;
	width: 465px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.Easy-sgin-in-wrap .sign-button-list li{
	padding-bottom: 10px;
}
.Easy-sgin-in-wrap .sign-button-list li button{
	width: 465px;
	height: 56px;
	border: solid 1px var(--border-gray-color);
	text-align: center;
	background: white;
}
.Easy-sgin-in-wrap .sign-button-list li button span{
	font-size: 18px;
}
</style>
</head>
	<header>
		<%@ include file="../module/header.jsp" %>
	</header>
		<container id="container">
		<div class="page-util">
			<div class="container">
				<i class="fas fa-home"></i>
				<i class="fas fa-angle-right"></i>
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/login"> 로그인 </a></span>
			</div>
		</div>	
		<div class="page-title"><div class="container"><h1>로그인</h1></div>
	
	<form action="${login }" method="post">
	
	<div class="main-container">
		<div class="main-wrap">

		<section class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input id="id_email" name="email" type="text" placeholder="아이디" required></input>
			</div>
			<div class="login-input-wrap password-wrap">	
				<input id="id_password" name="password" type="password" placeholder="비밀번호" required></input>
			</div>
			<div>
				<label style="color: red;">${error }</label>
			</div>
			<div class="login-button-wrap">
				<button type="submit" class="loginButton">로그인</button>
				<c:url var="main" value="/index" />
			</div>
			<div class="login-stay-sign-in">
				<div class="sort1">
					<input type="checkbox" id="checkSaveId"> <span>아이디 저장</span>
				</div>
			</div>
		</section>
		<section class="Easy-sgin-in-wrap">
			<ul class="sign-button-list">
				<li><button type="button" class="moveRegister" onclick="location.href='${join }'"
				style="margin-top: 10px;"></i><span>회원가입</span></button></li>
			</ul>
		</section>
		</div>
	</div>
	<footer>
		<%@ include file="../module/footer.jsp" %>	
	</footer>

</html>
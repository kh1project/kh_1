<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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

.login-input-section-wrap{
	padding-top: 20px;
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
</style>
<title>나의 SEENEMA - 회원 탈퇴</title>
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
<c:url var="delete" value="/account/delete" />
 
<script type="text/javascript">
	function send() {
		var pass = document.getElementById("id_password");
		if (pass.value == "" || pass.value == undefined) {
			alert("패스워드를 입력하세요.");
			password.focus();
			return;
		}
		$("input[name=email]").attr("disabled", false);
		document.deleteInfo.submit();
	}
</script>
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
					<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/mypage?id=${account.id  }"> 마이페이지 </a></span>
					<i class="fas fa-angle-right"></i>
					<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/update?id=${account.id  }"> 회원 탈퇴 </a></span>
				</div>
			</div>	
		<div class="page-title"><div class="container"><h1>회원 탈퇴</h1>
	
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	 	 		
	  			<button class="btn btn-primary" type="button" onclick="location.href='/seenema/account/mypage'" style="border: none; 
	  			padding: 12px 25px 12px 25px; font-size:1.2rem; background-color: #503396;">취소하기</button>
			</div>
		</div>
	</div>
		&nbsp;
		&nbsp;
	
	<div class="main-container">
	<div class="main-wrap">
		<form name="deleteInfo" action="${delete }" method="post">
		<input type="hidden" id="id" name="id" value="${accountData.getId() }">
		
			<h5 style="text-align:center">비밀번호 입력</h5>	
				<section class="login-input-section-wrap">
					<div class="login-input-wrap">	
						<input id="id_email" name="email" type="text" value="${accountData.getEmail() }" disabled></input>
					</div>
					<div class="login-input-wrap password-wrap">	
						<input id="id_password" name="password" type="password" placeholder="비밀번호" required></input>
					</div>
				&nbsp;
					<div>
						<label class="error" style="color: red;">${error }</label>
					</div>
				</section>
				&nbsp;
				<div style="text-align: center;">
					<button type="button" class="btn btn-primary btn-lg" style="margin-right: 10px; padding: 12px 25px 12px 25px; border: none; background-color: #503396;" 
					onclick="send();">회원 탈퇴</button>
				</div>
			</div>
		</form>
	</div>
		&nbsp;
		&nbsp;
	<footer>
		<%@ include file="../module/footer.jsp" %>	
	</footer>
</body>
</html>
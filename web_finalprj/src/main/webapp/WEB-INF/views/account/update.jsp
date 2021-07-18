<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<style> 
table.my {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  margin : 20px 10px;
}
table.my th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: middle;
  border: 1px solid #ccc;
  height: 80px;
  background-color: #EAEAEA;
  text-align: center;
}
table.my td {
  width: 85%;
  padding: 10px;
  padding-left: 20px;
  vertical-align: middle;
  border: 1px solid #ccc;
}
</style>

<title>나의 SEENEMA - 회원 정보 수정</title>

<c:url var="reservelist" value="/account/reservelist" />
<c:url var="myreview" value="/account/myreview" />
<c:url var="updateAccount" value="/account/updateAccount" />
<c:url var="nickname_check" value="/accountAjax/nickname" />
<c:url var="update" value="/account/mypage" />
<c:url var="delete" value="/account/delete" />

<script type="text/javascript">

function send() {
	$("input[name=email]").attr("disabled", false);
	$("input[name=username]").attr("disabled", false);
	$("input[name=age]").attr("disabled", false);
	$("input[name=gender]").attr("disabled", false);
	$("input[name=joindate]").attr("disabled", false);
	document.updateInfo.submit();
	alert("회원 정보가 수정되었습니다.");
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
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/mypage"> 마이페이지 </a></span>
				<i class="fas fa-angle-right"></i>
				<span class="page-util-text"> <a href="<%=request.getContextPath()%>/account/update"> 회원정보 수정 </a></span>
			</div>
		</div>	
	<div class="page-title"><div class="container"><h1>회원정보 수정</h1>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	  			<button class="btn btn-primary" type="button" onclick="location.href='/seenema/index'" style="border: none; 
	  			padding: 12px 25px 12px 25px; font-size:1.2rem; background-color: #503396;">메인으로</button>
			</div>
	</div>
	</div>
	
	<form name="updateInfo" action="${update }" method="post">
	
	<input type="hidden" id="id" name="id" value="${accountData.getId() }">
	&nbsp;
	
		<div class="container" style="padding: 30px 10px 10px 10px;">
			<table class="my">
			  <tr>
			    <th scope="row">아이디</th>
			    <td><input id="id_email" type="text" name="email" value="${accountData.getEmail() }" disabled></td>
			  </tr>
			  <tr>
			    <th scope="row">비밀번호</th>
			    <td><input id="id_password" type="password" name="password" value="${accountData.getPassword() }"></td>
			  </tr>
			</table>
		</div>
		
		<div class="container" style="padding: 30px 10px 10px 10px;">
			<table class="my">
			  <tr>
			    <th scope="row">이름</th>
			    <td><input id="id_username" type="text" name="username" value="${accountData.getUsername() }" disabled></td>
			  </tr>
			  <tr>
			    <th scope="row">닉네임</th>
			    <td><input id="id_nickname" type="text" name="nickname" value="${accountData.getNickname() }"></td>
			  </tr>
			  <tr>
			    <th scope="row">나이</th>
			    <td><input id="id_age" type="number" name="age" value="${accountData.getAge() }" disabled></td>
			  </tr>
			  <tr>
			    <th scope="row">성별</th>
			    <td><input id="id_gender" type="text" name="gender" value="${accountData.getGender() }" disabled></td>
			  </tr>
			  <tr>
			    <th scope="row">연락처</th>
			    <td><input id="id_phone" type="tel" name="phone" value="${accountData.getPhone() }"></td>
			  </tr>
			  <tr>
			    <th scope="row">가입일자</th>
			    <td><input id="id_joindate" type="date" name="joindate" value="${accountData.getJoindate() }" disabled></td>
			  </tr>
			</table>

		&nbsp;
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary btn-lg" style="margin-right: 10px; border: none; background-color: #503396;" 
			onclick="send();">수정</button>
			
			<button type="button" class="btn btn-secondary btn-lg" style="border: none; background-color: #A6A6A6;" 
			onclick="location.href='${delete }'">탈퇴</button>
		</div>
	</div>
		&nbsp;
		&nbsp;
	
</body>
</html> 
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
<title>나의 SEENEMA</title>
</head>
<c:url var="reservelist" value="/account/reservelist" />
<c:url var="myreview" value="/account/myreview" />
<c:url var="expire" value="/accountAjax/expire" />

<script type="text/javascript">
function updateInfo() {
	var nickCheck = document.getElementById("nickname_check_res").innerText;
	var nickname = document.getElementById("id_nickname").value
	
	if(nickname == "") {
		alert("닉네임을 입력하세요.");
		return;
	}
	
	if(nickname != "${account.getNickname() }" && nickCheck == "사용 가능한 닉네임입니다.") {
		// 닉네임을 변경하는 경우
		document.update_account.submit();
	} else if(nickname == "${account.getNickname() }") {
		// 닉네임을 변경하지 않고 성별 및 나이만 변경하는 경우
		document.update_account.submit();
	} else {
		alert("닉네임 중복 체크 먼저 진행하세요.");
	}
}
function expire() {
	$.ajax({
		url: "${expire }",
		type: "post",
		datatype: "json",
		data: {
			id: document.getElementById("id").value
		},
		success: function(data) {
			if(data.res == "success") {
				alert("탈퇴 처리가 완료되었습니다.")
				location.href = "${pageContext.request.contextPath }/account/logout"
			} else {
				alert("탈퇴 처리에 실패하였습니다.")
			}
		}
	});
}
</script>
<c:url var="nickname_check" value="/accountAjax/nickname" />
<c:url var="update" value="/account/mypage" />

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
			</div>
		</div>	
	<div class="page-title"><div class="container"><h1>마이 페이지</h1>

		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
 	 		<button class="btn btn-primary me-md-2" type="button" onclick="location.href='${myreview }'"
 	 		 style="margin-right: 10px; border: none;  
 	 		padding: 12px 25px 12px 25px; font-size:1.0rem; background-color: #503396;">내가 쓴 리뷰</button>
 	 		
  			<button class="btn btn-primary" type="button" onclick="location.href='${reservelist }'" style="border: none; 
  			padding: 12px 25px 12px 25px; font-size:1.0rem; background-color: #503396;">예매한 영화</button>
		</div>
	</div>
</div>
	<form name="update_account" action="${update }" method="post">
	<input type="hidden" id="id" name="id" value="${requestScope.account.getId() }">
	&nbsp;
	
		<div class="container" style="padding: 30px 10px 10px 10px;">
			<table class="my">
			  <tr>
			    <th scope="row">아이디</th>
			    <td><input id="id_email" type="text" name="email" value="${requestScope.account.getEmail() }" disabled></td>
			  </tr>
			  <tr>
			    <th scope="row">비밀번호</th>
			    <td>비밀번호</td>
			  </tr>
			</table>
		</div>
		
		<div class="container" style="padding: 30px 10px 10px 10px;">
			<table class="my">
			  <tr>
			    <th scope="row">이름</th>
			    <td><input id="id_username" type="text" name="username" value="${requestScope.account.getUsername() }" disabled></td>
			  </tr>
			  <tr>
			    <th scope="row">닉네임</th>
			    <td><input id="id_nickname" type="text" name="nickname" value="${requestScope.account.getNickname() }">
					<button type="button" onclick="nicknameCheck('${nickname_check }', document.getElementById('id_nickname').value);">중복확인</button>
					<label id="nickname_check_res"></label></td>
			  </tr>
			  <tr>
			    <th scope="row">나이</th>
			    <td><input id="id_age" type="number" name="age" value="${requestScope.account.getAge() }" disabled></td>
			  </tr>
			  <tr>
			    <th scope="row">성별</th>
			    <td>성별</td>
			  </tr>
			  <tr>
			    <th scope="row">연락처</th>
			    <td><input id="id_phone" type="tel" name="phone" value="${requestScope.account.getPhone() }"></td>
			  </tr>
			  <tr>
			    <th scope="row">가입일자</th>
			    <td><input id="id_phone" type="tel" name="phone" value="${requestScope.account.getPhone() }" disabled></td>
			  </tr>
			</table>
		&nbsp;
		<div style="text-align: center;">
			<button type="button" class="btn btn-primary btn-lg" style="margin-right: 10px; border: none; background-color: #503396;" 
			onclick="updateInfo();">수정</button>
			
			<button type="button" class="btn btn-secondary btn-lg" style="border: none; background-color: #A6A6A6;" 
			onclick="expire();">탈퇴</button>
		</div>
	</div>
		&nbsp;
		&nbsp;
	
</body>
</html> 
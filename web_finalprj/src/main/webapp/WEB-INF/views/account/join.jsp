<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/static/js/common.js"></script>

<c:url var="email_check" value="/accountAjax/email" />
<c:url var="nickname_check" value="/accountAjax/nickname" />
	
<script type="text/javascript">
	function emailCheck() {
		var email = document.getElementById("id_email").value;
		if(email == "" || email == undefined) {
			alert("아이디를 입력하세요.");
			document.getElementById("id_email").focus();
		}
		$.ajax({
			url: "${email_check }",
			type: "get",
			datatype: "json",
			data: {
				email: document.getElementById("id_email").value
			},
			success: function(data) {
				if(data.result == false) {
					document.getElementById("email_check_res").innerText = "사용 가능한 아이디입니다.";
				} else {
					document.getElementById("email_check_res").innerText = "이미 사용중인 아이디입니다.";
				}
			}
		});
	}
	
</script>

<style>
html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #f5f6f7;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
#logo {
    width: 240px;
    height: 44px;
    cursor: pointer;
}

#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
}
#wrapper {
    position: relative;
    height: 100%;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}


h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}

.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

input {
    font-family: Dotum,'돋움',Helvetica,sans-serif;    
}

.box.int_id {
    padding-right: 110px;
}

.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}

.step_url {
    position: absolute;
    top: 16px;
    right: 5px;
    font-size: 15px;
    color: #8e8e8e;
}

select {
    width: 100%;
    height: 29px;
    font-size: 15px;
    background: #fff 100% 50% no-repeat;
    background-size: 20px 8px;
    -webkit-appearance: none;
    display: inline-block;
    text-align: start;
    border: none;
    cursor: default;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #fff;
    background-color: #8041D9;
    font-size: 20px;
    font-weight: 400;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

#btnCancel {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: #000000;
    background-color: #D5D5D5;
    font-size: 20px;
    font-weight: 400;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

</style>
<title>SEENEMA의 가족이 되어주세요!</title>
</head>
	<c:url var="main" value="/index" />
	<c:url var="join" value="/account/join" />
<body>
	<header>
		<%@ include file="../module/header.jsp" %>
	</header>

	<form name="account_form" action="${join }" method="post">

        <div id="header">
           	<button type="button" onclick="location.href='${main }'" style="margin-top: 10px;">
					<img src="<%=request.getContextPath() %>/resources/images/common/logo.png"
					 width="30" height="30" class="d-inline-block align-top" alt="로고">
			</button>
		</div>

            <div id="content">

                <div>
                    <h3 class="join_title">
                        <label for="id_email">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="id_email" class="int" maxlength="20" name="email" required>
                    </span>
						<button type="button" onclick="emailCheck();" class="btn btn-outline-secondary" style="margin-top: 1px;">중복확인</button>
						<label id="email_check_res" style="padding-top: 10px; padding-left:5px; color:red"></label>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="id_password">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="id_password" class="int" maxlength="20" name="password" required>
                    </span>
                </div>


                <div>
                    <h3 class="join_title"><label for="id_username">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="id_username" class="int" name="username" maxlength="20" required>
                    </span>
                </div>
                

                <div>
                    <h3 class="join_title"><label for="id_nickname">닉네임</label></h3>
                    <span class="box int_name">
                        <input type="text" id="id_nickname" class="int" name="nickname" maxlength="20"
                        oninput="nicknameCheck('${nickname_check }', this.value);" required>
                        <label id="nickname_check_res" style="padding-top: 15px; color:red"></label>
                    </span>

                </div>
				&nbsp;
				<div>
                    <h3 class="join_title"><label for="name">나이</label></h3>
                    <span class="box int_name">
                        <input type="number" id="id_age" class="int" name="age" min="1" max="199" step="1" required>
                    </span>
                </div>

                <div>
                    <h3 class="join_title"><label for="gender" checked>성별</label></h3>
                    <span class="box gender_code">
                        <select id="gender" class="sel">
                            <option>성별</option>
                            <option value="M" id="id_gender_m" name="gender">남자</option>
                            <option value="F" id="id_gender_f" name="gender">여자</option>
                        </select>
                        <input name="gender" type="hidden" value="" />                            
                    </span>
                </div>

                <div>
                    <h3 class="join_title"><label for="id_phone">연락처</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="id_phone" class="int" name="phone" maxlength="16" placeholder="전화번호 입력" required>
                    </span>  
                </div>

                <div class="btn_area">
                    <button type="button" onclick="send(); return ; " id="btnJoin">
                        <span>가입하기</span>
                    </button>
                    &nbsp;
                    <button type="button" onclick="history.back();" id="btnCancel">
                        <span>취소</span>
                    </button>
                </div>
            </div> 

	</form>
	<!-- <footer>
		<%@ include file="../module/footer.jsp" %>
	</footer> -->
</body>
<script>
function send() {
	var email = document.getElementById("id_email");
	if(email.value == "" || email.value == undefined) {
		alert("아이디를 입력하세요.")
		email.focus();
		return;
	}
		
	var password = document.getElementById("id_password");
	if(password.value == "" || password.value == undefined) {
		alert("비밀번호를 입력하세요.")
		password.focus();
		return;
	}		
	
	var username = document.getElementById("id_username");
	if(username.value == "" || username.value == undefined) {
		alert("이름을 입력하세요.")
		username.focus();
		return;
	}

	var nickname_check = document.getElementById("nickname_check_res").innerText;
	if(nickname_check == "" || nickname_check == undefined) {
		alert("닉네임을 입력하세요.");
		document.getElementById("id_nickname").focus();
		return;
	} else if(nickname_check != "사용 가능한 닉네임입니다.") {
		alert("해당 닉네임으로는 가입을 할 수 없습니다.");
		document.getElementById("id_nickname").focus();
		return;
	}
	
	var email_check = document.getElementById("email_check_res").innerText;
	if(email_check == "" || email_check == undefined) {
		alert("아이디 중복확인을 먼저 진행하세요.");
		document.getElementById("id_email").focus();
		return;
	} else if(email_check != "사용 가능한 아이디입니다.") {
		alert("해당 아이디로는 가입을 할 수 없습니다.");
		document.getElementById("id_email").focus();
		return;
	}	
	
	var age = document.getElementById("id_age");
	if(age.value == "" || age.value == undefined) {
		alert("나이를 입력하세요.")
		age.focus();
		return;
	}
	
	var phone = document.getElementById("id_phone");
	if(phone.value == "" || phone.value == undefined) {
		alert("연락처를 입력하세요.")
		phone.focus();
		return;
	}
	//select 값을 input태그에 전달
	document.querySelector("#gender").nextElementSibling.value = document.querySelector("#gender").value
	
	document.account_form.submit();
}
</script>
</html>
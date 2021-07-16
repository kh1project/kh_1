/**
 * 
 */
 
 function emailCheck(url, value) {
	$.ajax({
		url: url,
		type: "get",
		datatype: "json",
		data: {
			email: value
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

function nicknameCheck(url, value) {
	$.ajax({
		url: url,
		type: "get",
		datatype: "json",
		data: {
			nickname: value
		},
		success: function(data) {
			if(data.result == false) {
				document.getElementById("nickname_check_res").innerText = "사용 가능한 닉네임입니다.";
			} else {
				document.getElementById("nickname_check_res").innerText = "이미 사용중인 닉네임입니다.";
			}
		}
	});
}
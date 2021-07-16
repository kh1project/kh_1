<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		</div>
	</container>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</body>
<c:url var="addstep1" value="/reviewajax/addstep1" />
<c:url var="addstep2" value="/reviewajax/addstep2" />
<c:url var="updatestep" value="/reviewajax/updatestep" />
<script>
$(document).ready(function(){
	$('#post1').addClass("selected");
	if(window.location.pathname == "<%=request.getContextPath() %>/review/update") {
		selectmovie(${data.getMid()});
	}
	const updatewrap = $('#update > form > .row > .col-6');
	$(updatewrap).css("height", window.innerHeight - 300);
});

var movienum;

function selectmovie(num) {
	movienum = num;
	if(window.location.pathname == "/seenema/review/add") {
		var ckbg = document.getElementById("checkbg" + num);
		var anotherckbg = document.getElementsByClassName("checkbg");
		var ckradio = document.getElementById("wm" + num);
		if(ckradio.checked) {
			for(i = 0; i < anotherckbg.length; i++) {
				anotherckbg[i].style.display = "none";
			}
			ckbg.style.display = "block";
		}
	}
	
	$.ajax({
		url: "${addstep1}",
		type: "post",
		datatype: "json",
		data: {
			selectmovie: num
		},
		success: function(smovieimgs) {
			if(smovieimgs.length > 0) {
				i = 1;
				for(var ele in smovieimgs) {
					$("#add-imagelist").append("<img id='smovieimg" + i + "' class='col selectImg' src='<%=request.getContextPath() %>" + smovieimgs[ele].path + smovieimgs[ele].name + "' onclick='selectImg(" + i + ")'>");
					i++;
				}
				$("#hiddenmid").attr("value", num);
				$("#hiddentitle").attr("value", smovieimgs[ele].title);
				if(document.getElementById("add-step1")) {
					document.getElementById("add-step1").style.display = "none";
					document.getElementById("add-step2").style.display = "block";
				}
			} else {
				alert("영화 이미지가 없습니다.");
			}
		}
	});
}

var thispost;
function selectPost(num) {
	$("#post" + num).addClass("selected");
	$("#post" + num).siblings().removeClass("selected");
}

function selectImg(num) {
	if(document.getElementsByClassName("selectImg")) {
		if($(".post.selected").length < 1) {
			$(".postwrap").find(".post").first().addClass("selected");
		}
		$(".selected .selectImg").remove();
		$("#smovieimg" + num).clone().prependTo(".post.selected").last(); //last post id를 가져와야 함.
		$(".selected .selectImg").removeAttr("onclick");
		$(".selected .selectImg").attr("id", num);
	}
}

function ptextLengthCk(id) {
	var ptextid = $("#ptext" + id);
    ptextid.next().html("("+ptextid.val().length+" / 80)");
    if(ptextid.val().length > 80) {
    	ptextid.val($(ptextid).val().substring(0, 80));
    	ptextid.next().html("(80 / 80)");
	}
}

function delPost(id) {
	if($(".postwrap .post").length > 1) {
		$("#delBtn" + id).parent().remove();
	} else {
		alert("1건 미만인 경우, 삭제할 수 없습니다.");
	}
}

var postClass = document.getElementsByClassName("post");
var postid = (document.getElementsByClassName("post").length + 1);
function addPost(){ 
	if(postClass) {
		$("#btn_addpost").before("<div id='post" + postid + "' class='col post' onclick='selectPost(" + postid + ")'><img class='selectImg' src='<%=request.getContextPath() %>/resources/images/sub/bg-img-select.png' alt='이미지 없음'><textarea placeholder='내용을 작성해 주세요.' id='ptext" + postid + "' onkeyup='ptextLengthCk(" + postid + ");'></textarea><div class='pTextCnt'>(0 / 80)</div><img id='delBtn" + postid + "' class='delBtn' src='<%=request.getContextPath() %>/resources/images/common/btn-x-close.png' onclick='delPost(" + postid + ");'>");
	}
	postid++;
} 
var nullFlag = false;

function nullCheck() {
	for(i = 0; i < postClass.length; i++) {
		console.log("---------- 현재 포스터의 개수 : " + postClass.length);
		var postnum = $("#"+postClass[i].id);
		if(postnum.length) {
			var postimgSrc = postnum.children("img").attr("src");
			var posttextVal = postnum.children("textarea").val();
			
			console.log("----------현재 " + (i + 1) + "번째 포스터 체크중----------");
			if(postimgSrc == "/seenema/resources/images/sub/bg-img-select.png"){
				console.log((i + 1) + "번째 이미지 확인중");
				alert("이미지를 선택해주세요.");
				nullFlag = false;
				console.log((i + 1) + "번째 이미지 없음");
				return;
			} else if(posttextVal.length < 1) {
				console.log((i + 1) + "번째 내용 확인중");
				alert("내용을 입력해주세요.");
				nullFlag = false;
				console.log((i + 1) + "번째 내용 없음");
				return;
			}
		}
	}
	nullFlag = true;
	console.log("모든 이미지와 내용이 들어가있음 : nullFlag = true");
}

function add2send() {
	var param = [];
	for(i = 0; i < postClass.length; i++) {
		var postnum = $("#post" + (i + 1));
		var postimgSrc = postnum.children("img").attr("src");
		var posttextVal = postnum.children("textarea").val();
		
		//값 저장
		var data = {
			postimg : postimgSrc,
			posttext : posttextVal
		};
		param.push(data);
	};
	var jsonData = JSON.stringify(param);
	jQuery.ajaxSettings.traditional = true;
	
	$.ajax({
        url : '${addstep2}',
        type: 'POST',
        traditional: true, //배열 및 리스트로 값을 넘기기 위해서는 꼭 선언되어야 한다고 함.
        dataType:'json',
        data: {"jsonData" : jsonData},
        success: function(mergeId) {
        	$("#hiddencontents").attr("value", mergeId);
        	console.log("mergeId : " + mergeId);
        	document.step2form.submit();
        }
    });
}

function updatesend() {
	var param = [];
	for(i = 0; i < postClass.length; i++) {
		var postnum = $("#"+postClass[i].id);
		console.log("postnum : " + postnum);
		var postimgSrc = postnum.children("img").attr("src");
		var posttextVal = postnum.children("textarea").val();
		
		//값 저장
		var data = {
			postimg : postimgSrc,
			posttext : posttextVal
		};
		param.push(data);
	};
	var jsonData = JSON.stringify(param);
	jQuery.ajaxSettings.traditional = true;
	
	$.ajax({
        url : '${updatestep}',
        type: 'POST',
        traditional: true, //배열 및 리스트로 값을 넘기기 위해서는 꼭 선언되어야 한다고 함.
        dataType:'json',
        data: {
        		"jsonData" : jsonData,
        		"boardId" : ${data.getId() },
        		"existingCont" : ${data.getContents() }
        	  },
        success: function(mergeId) {
        	$("#hiddencontents").attr("value", mergeId);
        	console.log("mergeId : " + mergeId);
        	document.step2form.submit();
        }
    });
}

function addReview() {
	nullCheck();
	if(nullFlag) { 
		add2send();
	}
}

function updateReview() {
	nullCheck();
	if(nullFlag) { 
		updatesend();
	}
}
</script>
</html>
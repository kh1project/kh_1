$(document).ready(function(){
	const likeBtn = document.querySelector(".like-btn");
	likeBtn.onmouseover = function() {
		likeBtn.style.backgroundColor = "white";
		likeBtn.style.color = "black";
	}
	likeBtn.onmouseout = function() {
		likeBtn.style.backgroundColor = "transparent";
		likeBtn.style.color = "white";
	}
	
	const shareBtn = document.querySelector(".share");
	shareBtn.onclick = function(){
		document.body.classList.add("no-scroll");
		document.querySelector("#modal").style.display = "flex";
	}
	
	const closeBtn = document.querySelector(".close-btn");
	closeBtn.onclick = function(){
	document.body.classList.remove("no-scroll");
		document.querySelector("#modal").style.display = "none";
	}
	
	const text = document.querySelector(".copybox > button");
	text.onclick = function(){
		document.querySelector(".copybox > input").select();
		document.execCommand("copy");
		alert("URL이 복사되었습니다. 클립보드로 복사하세요.");
	}
	
	const menu = document.querySelector(".menues");
	let mid = window.location.search;
	menu.children[0].onclick = function(){
		window.location= "/seenema/movie/detail"+mid;
	}
	
	menu.children[1].onclick = function(){
		window.location= "/seenema/movie/detail/comment"+mid;
	}
	
	menu.children[2].onclick = function(){
		window.location= "/seenema/movie/detail/post"+mid;
	}
	
	menu.children[3].onclick = function(){
		window.location= "/seenema/movie/detail/stillcut"+mid;
	}
	
});

function doLike(mid) {
	$.ajax({
		url: "/seenema/movieajax/like",
		type: "post",
		datatype: "json",
		data: {
			userid: 1,
			"mid": mid
		},
		success: function(data) {
			if(data == -1)
	                return alert("로그인이 필요한 기능입니다.");
	                
			document.querySelector('.util-btn').innerHTML =
				"<div class=\"like-btn\" onclick=\"doUnlike(" + mid + ")\">♥ " + data + "</div>";
			const likeBtn = document.querySelector(".like-btn");
			likeBtn.onmouseover = function() {
				likeBtn.style.backgroundColor = "white";
				likeBtn.style.color = "black";
			}
			likeBtn.onmouseout = function() {
				likeBtn.style.backgroundColor = "transparent";
				likeBtn.style.color = "white";
			}
		},
		error: function() {
			console.log("like 실패");
		}
	})
}

function doUnlike(mid) {
	$.ajax({
		url: "/seenema/movieajax/unlike",
		type: "post",
		datatype: "json",
		data: {
			userid: 1,
			"mid": mid
		},
		success: function(data) {
			if(data == -1)
	                return alert("로그인이 필요한 기능입니다.");
                
			document.querySelector('.util-btn').innerHTML =
				"<div class=\"like-btn\" onclick=\"doLike(" + mid + ")\">♡ " + data + "</div>";
			const likeBtn = document.querySelector(".like-btn");
			likeBtn.onmouseover = function() {
				likeBtn.style.backgroundColor = "white";
				likeBtn.style.color = "black";
			}
			likeBtn.onmouseout = function() {
				likeBtn.style.backgroundColor = "transparent";
				likeBtn.style.color = "white";
			}
		},
		error: function() {
			console.log("like 실패");
		}
	})
	
}

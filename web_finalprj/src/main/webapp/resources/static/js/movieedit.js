
	let removeList = [];

	function showBtn(id){
	    document.querySelector(".btn-"+id).style.display = "inline-block";
	}
	
	function hideBtn(id){
	    document.querySelector(".btn-"+id).style.display = "none";
	}
	
	function removePoster(imageId, count){
		document.querySelectorAll(".blind")[count-1].style.display = "inline-block";
		let imagebox = document.querySelector(".img-cnt"+imageId);
		imagebox.removeAttribute("onmouseover");
		imagebox.removeAttribute("onmouseout");
		let delBtn = document.querySelector(".delBtn-"+imageId);
		delBtn.innerText = "삭제취소";
		delBtn.className= "btn btn-dark btn-"+imageId+" unDel-"+imageId;
		delBtn.setAttribute("onclick", "unDel("+imageId+", "+count+")");
		
		removeList.push(imageId);
		console.log(removeList);
	
	}
	
	function removeStillcut(imageId, count){
		document.querySelectorAll(".blind")[count-1].style.display = "inline-block";
		let imagebox = document.querySelector(".img-cnt"+imageId);
		imagebox.removeAttribute("onmouseover");
		imagebox.removeAttribute("onmouseout");
		let delBtn = document.querySelector(".delBtn-"+imageId);
		delBtn.innerText = "삭제취소";
		delBtn.className= "btn btn-dark btn-"+imageId+" unDel-"+imageId;
		delBtn.setAttribute("onclick", "unDel("+imageId+", "+count+")");
		
		removeList.push(imageId);
		console.log(removeList);
	
	}
	
	function unDel(imageId, count){
		document.querySelectorAll(".blind")[count-1].style.display = "none";
		let imagebox = document.querySelector(".img-cnt"+imageId);
		imagebox.onmouseover = function(){
			document.querySelector(".btn-"+imageId).style.display = "inline-block";
		}
		imagebox.onmouseout = function(){
			document.querySelector(".btn-"+imageId).style.display = "none";
		}
		let delBtn = document.querySelector(".unDel-"+imageId);
		delBtn.innerText = "삭제";
		delBtn.className= "btn btn-dark btn-"+imageId+" delBtn-"+imageId;
		delBtn.setAttribute("onclick", "removePoster("+imageId+", "+count+")");
		
		removeList.splice(removeList.indexOf(imageId), 1);

	}
	

	
	function remove(){
		$.ajax({
	        url: "/seenema/movieajax/edit/remove", 
	        type: "post",
	        datatype: "json",
	        data: {
	            "removeList" : removeList
	        },
	        success: function(data){
				console.log("삭제작업 완료");
	        },
	        error: function(){
				console.log("삭제실패");
	        }
	    })
	}
	
	function edit(){
		remove();
	}
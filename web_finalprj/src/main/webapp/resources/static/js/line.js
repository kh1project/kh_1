function realtimeCheckcnt(ele) {
	var cnt = ele.value.length;
	document.querySelector('#currcnt').innerText = cnt;
}


function incGcnt(ele, lid) {
	console.log(lid);
	console.log(ele.nextElementSibling);
	$.ajax({
		url: "/seenema/lineajax/incGcnt",
		type: "get",
		datatype: "json",
		data: {
			lid: lid
		},
		success: function(data) {
			if(data.res == "success") {
				ele.nextElementSibling.innerText = data.gcnt;
				ele.innerHTML = "<svg width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-up-fill' viewBox='0 0 16 16'><path d='M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z'/></svg>";
			}
		}
	});
}

function deleteLine(ele, lid) {
	$.ajax({
		url: "/seenema/lineajax/delete",
		type: "get",
		datatype: "json",
		data: {
			lid: lid
		},
		success: function(data) {
			if(data.res == "success") {
				ele.closest('.user-info').remove();
				ele.closest('.line-contents').remove();
			}
		}
	});
}

function paging(ele, mid, totalrow, max_page) {
	
	let selected_page = ele.innerText;
	let i = 0;
	let email = document.querySelectorAll('.user-info');
	let star = document.querySelectorAll('.line-star');
	let contents = document.querySelectorAll('.line-contents');
	let gcntIcon = document.querySelectorAll('.line-gcntIcon');
	let gcnt = document.querySelectorAll('.line-gcnt');
	let cdate = document.querySelectorAll('.line-date');
	
	$.ajax({
		url: "/seenema/lineajax/paging",
		type: "get",
		datatype: "json",
		//contentType: "application/json",
		data: {
			selected_page: selected_page,
			mid: mid,
			totalrow: totalrow,
			max_page: max_page
		},
		success: function(data) {
			
			for(var pgdata of data.pgdatas) {
				console.log(pgdata.id);
				email[i].innerText = pgdata.email;
				star[i].innerHTML = pgdata.star;
				contents[i].innerHTML = pgdata.contents;
				$(gcntIcon[i]).on('click', function() {
					incGcnt(gcntIcon[i], pgdata.id);
				});
				gcnt[i].innerHTML = pgdata.gcnt;
				cdate[i].children[0].innerText = pgdata.cdate;
				i++;
			}
		}
	});

	if(ele.innerText == max_page) {
		// 요소들 삭제
		let remainder = max_page % 10;
		let lineone_outer = document.querySelectorAll('.lineone-outer');
		let line_date = document.querySelectorAll('.line-date');
		for(let i = remainder; i < 10; i++) {
			lineone_outer[i].remove();
			line_date[i].remove();
		}		
	}	
}

function star(cnt) {
	let ele = document.getElementById(cnt);
	let nextele = document.getElementById(cnt + 1);
	if (ele.children[0].getAttribute('class') != 'bi bi-star-fill') {
		console.log('here');
		for(let i = 1; i <= cnt; i++) {
			document.getElementById(i).innerHTML = 
			'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>';
		}
	} else if (cnt <= 4) {
		if(nextele.children[0].getAttribute('class') == 'bi bi-star-fill') {
			console.log('delete');
			for(let j = 5; j > cnt; j--) {
				document.getElementById(j).innerHTML =
				'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/></svg>';
			}
		}
	}
}
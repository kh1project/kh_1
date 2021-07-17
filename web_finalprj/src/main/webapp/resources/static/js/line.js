function realtimeCheckcnt(ele) {
	var cnt = ele.value.length;
	document.querySelector('#currcnt').innerText = cnt;
}

/*incGcnt(ele, lid) 함수*/
$(function() {
	$(document).on("click", ".line-gcntIcon", function() {
		let ele = $(this);		/*e.target 으로 하면 안 됨.*/
		let icon = "<svg width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-up-fill' viewBox='0 0 16 16'><path d='M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z'/></svg>";
		
		$.ajax({
			url: "/seenema/lineajax/incGcnt",
			type: "get",
			datatype: "json",
			data: {
				lid: $(this).attr('data-id')
			},
			success: function(data) {
				if(data.res == "success") {
					ele.next().text(data.gcnt);
					ele.html(icon);
				}
			}
		});
	});
});

/* 잘못된 incGcnt
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
*/

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



/* 잘못된 paging */
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
			
						/* 수정해야 함: 2개 동시 순회: console.log(Object.values(data.pgdatas)[0]);*/
			for(var pgdata of data.pgdatas) {

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
	
	document.querySelector('.starForm').firstChild.value = cnt;
	
	if (ele.children[0].getAttribute('class') != 'fa fa-star') {
		for(let i = 1; i <= cnt; i++) {
			starcss(i);
			document.getElementById(i).innerHTML = '<i class="fa fa-star" aria-hidden="true"></i>';
		}
	} else if (cnt <= 4) {
		if(nextele.children[0].getAttribute('class') == 'fa fa-star') {
			for(let j = 5; j > cnt; j--) {
				document.getElementById(j).innerHTML = '<i class="fa fa-star-o" aria-hidden="true"></i>';
			}
		} else {
			ele.innerHTML = '<i class="fa fa-star-o" aria-hidden="true"></i>';
			document.querySelector('.starForm').firstChild.value = 0;
		}
	}
}

function starcss(starid) {
	$(starid).css({'font-size':'x-large', 'font-weight':300, 'color':'#545151'});
}
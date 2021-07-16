<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		</div>
	</container>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</body>
<c:url var="upGcnt" value="/reviewajax/upGcnt" />
<c:url var="upBcnt" value="/reviewajax/upBcnt" />
<c:url var="orderby" value="/review" />
<script>
$(function(){
	
	var nowPath = window.location.pathname;
	
	if(nowPath == "<%=request.getContextPath() %>/review") {
		if(window.location.search == "?sort=like") {
			$(".orderlike").addClass("on");
		} else if(window.location.search == "" || window.location.search == null) {
			$(".orderdate").addClass("on");
		}
	}
	
	$(".orderdate").on('click', function(e){
		e.preventDefault();
		location.href=nowPath;
	});
	$(".orderlike").on('click', function(e){
		e.preventDefault();
		location.href=nowPath + "?sort=like";
	});
	
	$(".btn-gcnt").on('click', function(e){
		e.preventDefault();
		const btn_gcnt = $(this).children('span');
		const gcnt = btn_gcnt.html();
		
		$.ajax({
			url: "${upGcnt }",
			type: "post",
			datatype: "json",
			data: {
				id : $(this).attr("data-id")
			},
			success: function(gval) {
				$(btn_gcnt).html(gval);
			}
		});
	});

	$(".btn-bcnt").on('click', function(e){
		e.preventDefault();
		const btn_bcnt = $(this).children('span');
		const bcnt = btn_bcnt.html();
		
		$.ajax({
			url: "${upBcnt }",
			type: "post",
			datatype: "json",
			data: {
				id : $(this).attr("data-id")
			},
			success: function(bval) {
				$(btn_bcnt).html(bval);
			}
		});
	});
	
	var cdate = document.getElementsByClassName("cdate");
	for(i = 0; i < cdate.length; i++) {
		const dataid = $("#" + cdate[i].id);
		const getdata = dataid.attr("data-cdate");
		$(dataid).html(timeForToday(getdata));		
	}
});

function timeForToday(value) {
    const today = new Date();
    const timeValue = new Date(value);
    const formatDate = (current_datetime)=>{
        let formatted_date = current_datetime.getFullYear() + "-" + (current_datetime.getMonth() + 1) + "-" + current_datetime.getDate();
        return formatted_date;
    }

    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    if (betweenTime < 1) return '방금전';
    if (betweenTime < 60) {
        return betweenTime + '분전';
    }

    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) {
        return betweenTimeHour + '시간전';
    }

    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 8) {
        return betweenTimeDay + '일전';
    }

    return formatDate(timeValue);
}
</script>
</html>
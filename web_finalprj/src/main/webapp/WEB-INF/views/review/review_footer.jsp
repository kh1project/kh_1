<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		</div>
	</container>
	<jsp:include page="../module/footer.jsp"></jsp:include>
</body>
<c:url var="upGcnt" value="/reviewajax/upGcnt" />
<c:url var="upBcnt" value="/reviewajax/upBcnt" />
<script>
$(function(){
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
	
	const txt_date = $(".cdate").attr("data-cdate");
	$(".cdate").html(timeForToday(txt_date));
});

function timeForToday(value) {
    const today = new Date();
    console.log("today : " + today);
    const timeValue = new Date(value);
    console.log("timeValue : " + timeValue);
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
        return betweenTimeHour + '일전';
    }

    return formatDate(timeValue);
}
</script>
</html>
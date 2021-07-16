<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 - SEENEMA</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/reserve.css">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/seats.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
</head>
<body class="pt-5">
	<header>
		<%@ include file="../module/header.jsp" %>
	</header>
	<section class="reserve-frame pt-5">
		<c:url var="seat" value="/reserve/reservecheck" />
		<form action="${seat }" id="seat-form" method="post" onsubmit="return send()">
		<div class="reserve-window">
				<%@ include file="../module/ReserveFrame.jsp" %>
				<div class="main-frame">
					
					<c:forEach var="movie" items="${moviedata }">
						<c:set var="mid" value="${movie.id }" />
						<c:set var="title" value="${movie.title }" />
						<c:set var="rating" value="${movie.rating }" />
					</c:forEach>
					
					<c:forEach var="btlist" items="${btlist }">
						<c:set var="location" value="${btlist.location }" />
						<c:set var="spot" value="${btlist.name }" />
						<c:set var="theater" value="${btlist.tname }" />
					</c:forEach>
					
					<c:forEach var="timelist" items="${timelist }">
						<c:set var="timeid" value="${timelist.id }" />
						<c:set var="moviedate" value="${timelist.moviedate }" />
						<c:set var="starttime" value="${timelist.starttime }" />
						<c:set var="endtime" value="${timelist.endtime }" />
					</c:forEach>
					
					<div class="seat-info">
						<label class="info-title">좌석/인원 선택</label>
					</div>
						<div class="theater-info">
							<div class="title-spot">
								<input type="text" class="movie-title" name="title" value="${title }" readonly>
								<input type="hidden" class="movie-location" name="location" value="${location }" readonly>
								<input type="hidden" class="movie-spot" name="name" value="${spot }" readonly>
								<input type="hidden" class="movie-theater" name="tname" value="${theater }" readonly>
								<input type="hidden" class="movie-moviedate" name="moviedate" value="${moviedate }" readonly>
								<input type="hidden" class="movie-starttime" name="starttime" value="${starttime }" readonly>
								<input type="hidden" class="movie-endtime" name="endtime" value="${endtime }" readonly>
								<input type="hidden" class="movie-rating" name="rating" value="${rating }" readonly>
							</div>
							<div class="screen-spot">
								<label class="screen">Screen</label>
							</div>
							
								<c:forEach var="list" items="${seatlists }" >
									<c:set var="tid" value="${list.tid }" />
									<c:forEach var="seatcnt" items="${seatcnt }">
										<c:if test="${seatcnt.key eq 'scnt' }">
											<c:set var="seatamount" value="${seatcnt.value }" />
										</c:if>
									</c:forEach>
									<c:if test="${tid eq timeid }">
										<c:choose>
											<c:when test="${seatamount%2 == 0 }" >
												<c:choose>
													<c:when test="${fn: containsIgnoreCase(list.reserved, 'y')}">
															<c:choose>
																<c:when test="${(list.seatcol eq 4) || (list.seatcol eq 10)}">
																	<label style="margin-right : 10px;" class="no-seat" id="id_seat${list.id }">${list.seatrow }${list.seatcol }</label>
																</c:when>
																<c:when test="${list.seatcol eq 1}">
																	<br><label class="no-seat" id="id_seat${list.id }">${list.seatrow }${list.seatcol }</label>
																</c:when>
																<c:otherwise>
																	<label class="no-seat" id="id_seat${list.id }">${list.seatrow }${list.seatcol }</label>
																</c:otherwise>
															</c:choose>
													</c:when>
													<c:otherwise>
																<c:choose>
																	<c:when test="${(list.seatcol eq 4) || (list.seatcol eq 10)}">
																		<input class="seatinfo-checkbox" type="checkbox" id="id_seat${list.id }" name="seat" value="${list.id }">
																		<label id="${list.seatrow }${list.seatcol }" style="margin-right : 10px;" for="id_seat${list.id }">${list.seatrow }${list.seatcol }</label>
																	</c:when>
																	<c:when test="${list.seatcol eq 1}">
																		<br><input class="seatinfo-checkbox" type="checkbox" id="id_seat${list.id }" name="seat" value="${list.id }">
																		<label id="${list.seatrow }${list.seatcol }" for="id_seat${list.id }">${list.seatrow }${list.seatcol }</label>
																	</c:when>
																	<c:otherwise>
																		<input class="seatinfo-checkbox" type="checkbox" id="id_seat${list.id }" name="seat" value="${list.id }">
																		<label id="${list.seatrow }${list.seatcol }" for="id_seat${list.id }">${list.seatrow }${list.seatcol }</label>
																	</c:otherwise>
																</c:choose>
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<c:when test="${fn: containsIgnoreCase(list.reserved, 'y')}">
													<c:when test="${(list.seatcol eq 5) || (list.seatcol eq 10)}">
														<label style="margin-right : 10px;" class="no-seat" id="id_seat${list.id }">${list.seatrow }${list.seatcol }</label>
													</c:when>
												</c:when>
												<c:otherwise>
															<c:when test="${(list.seatcol eq 5) || (list.seatcol eq 10)}">
																<input class="seatinfo-checkbox" type="checkbox" id="${list.seatrow }${list.seatcol }" name="seat" value=${list.id }">
																<label id="${list.seatrow }${list.seatcol }" style="margin-right : 10px;" for="${list.seatrow }${list.seatcol }">${list.seatrow }${list.seatcol }</label>
															</c:when>
												</c:otherwise>
													<c:when test="${list.seatcol eq 1}">
														<br><label class="no-seat" id="${list.seatrow }${list.seatcol }">${list.seatrow }${list.seatcol }</label>
													</c:when>
													<c:otherwise>
														<label class="no-seat" id="${list.seatrow }${list.seatcol }">${list.seatrow }${list.seatcol }</label>
													</c:otherwise>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
						</div>
					
					<div class="seatexample">
						<span class="seat selected"></span><p class="selected">선택 불가능한 좌석</p>
						<span class="seat choose"></span><p class="selected">선택 가능한 좌석</p>
						<span class="seat select"></span><p class="selected">선택된 좌석</p>
						<c:if test="${rating == 19}">
							<p class="rating19">19세 이하의 청소년은 부모와 동반하여도 시청 불가능 합니다.</p>
						</c:if>
					</div>
					
					<div class="personnel-info">
						<input class="personnel-type" type="text" id="Adult" value="성인" disabled>
						<div class="peoples-number">
							<input class="personnel" type="button" value="-" onclick="person_value(document.getElementById('person1'), '-')">
							<input class="personnel-value" type="text" name="adult" id="person1" value="0" onchange="person_add(this, '')" readonly>
							<input class="personnel" type="button" value="+" onclick="person_value(document.getElementById('person1'), '+')">
						</div>
						<c:if test="${rating < 19}">
							<input class="personnel-type" type="text" id="Teenager" value="청소년" disabled>
							<div class="peoples-number">
								<input class="personnel" type="button" value="-" onclick="person_value(document.getElementById('person2'), '-')">
								<input class="personnel-value" type="text" name="teenager" id="person2" value="0" onchange="person_add(this, '')" readonly>
								<input class="personnel" type="button" value="+" onclick="person_value(document.getElementById('person2'), '+')">
							</div>
						</c:if>
						<div class="payment">
							<input class="payment" type="button" value="결제하기 >" onclick="send('seat-form');">
						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	
	<footer>
		<%@ include file="../module/footer.jsp" %>
	</footer>
</body>
<script type="text/javascript">
	$(document).ready(function() {
	    $(":checkbox").change(function() {
	    	var cnt = 0;
	    	var test2 = 0;
	    	var test1 = $("#person1").val();
	    	if($("#person2").val() != null){
	    		test2 = $("#person2").val();
	    	}
	    	cnt = Number(test1) + Number(test2);
	    	console.log(cnt);
	    	
	        if(cnt != 0){
	        	if( cnt == $(":checkbox:checked").length ) {
		            $(":checkbox:not(:checked)").attr("disabled", "disabled");
		        }
		        else {
		            $(":checkbox").removeAttr("disabled");
		        }
	        } else {
	        	alert("인원 수를 선택해주세요.");
	        	$("input[type=checkbox]").prop("checked",false);
        		$(":checkbox").removeAttr("checked");
        		$(":checkbox").removeAttr("disabled");
	        }
	    });
	    
	    $("#person1").change(function(){
		    $(":checkbox").removeAttr("checked");
		    $(":checkbox").removeAttr("disabled");
		});
		
	    $("#person2").change(function(){
		    $(":checkbox").removeAttr("checked");
		    $(":checkbox").removeAttr("disabled");
		});
	    
	});
	
	function person_value(person, updown){
		if(person.value >= $("input:checked[type='checkbox']").length){
			if(person.value >= 0 && person.value < 6){
				switch(updown){
			        case"+":
			        	if(person.value < 5 && person.value >= 0){
			        		person.value = parseInt(person.value) + 1;
			        		$("input[type=checkbox]").prop("checked",false);
			        		$(":checkbox").removeAttr("checked");
			        		$(":checkbox").removeAttr("disabled");
			        	} else if(person.value == 5){
			        		alert('최대 5명 선택 가능합니다.');
			        	}
			    		break;
			        case"-":
			        	if(person.value < 6 && person.value > 0){
			        		person.value = parseInt(person.value) - 1;
			        		$("input[type=checkbox]").prop("checked",false);
			        		$(":checkbox").removeAttr("checked");
			        		$(":checkbox").removeAttr("disabled");
			        	} else if(person.value == 0){
			        		alert('최소 1명이상 예매해야합니다.');
			        	}
			            break;
			    }
				
			}
		}
	}
	
	function send(form_id) {
		var f = document.getElementById(form_id);
		
		var cnt = 0;
		var adult = parseInt(document.getElementById('person1').value);
		var teen = 0;
		
		if(document.getElementById('person2') != null){
			teen = parseInt(document.getElementById('person2').value);
		}
		
		cnt = adult + teen;
		
		if($("input:checked[type='checkbox']").length == cnt){
			f.submit();
			return true;
		} else {
			alert('좌석을 선택해주세요.');
			return false;
		}
	}
</script>
</html>
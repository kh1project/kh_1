<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="review_header.jsp"></jsp:include>
		<div class="page-title"><div class="container"><h1>영화 리뷰</h1><a href="<%=request.getContextPath() %>/review/add">영화 리뷰 작성</a></div></div>
		<div class="container">
		<%-- 임시 주석.. <section>
			<div class="row row-cols-lg-6">
				<div class="col">
					<div class="p-3 border bg-light">최신 영화 순위1</div>
				</div>
				<div class="col">
					<div class="p-3 border bg-light">최신 영화 순위2</div>
				</div>
				<div class="col">
					<div class="p-3 border bg-light">최신 영화 순위3</div>
				</div>
				<div class="col">
					<div class="p-3 border bg-light">최신 영화 순위4</div>
				</div>
				<div class="col">
					<div class="p-3 border bg-light">최신 영화 순위5</div>
				</div>
				<div class="col">
					<div class="p-3 border bg-light">내가 등록한 리뷰 보기(회원정보로연결)</div>
				</div>
			</div>
		</section> --%>
		<section>
			<ul class="nav nav-tabs" id="rowTab">
			    <li><a href="<%=request.getContextPath() %>/review">모든 영화</a></li>
			    <%-- 임시 주석 <li><a href="#reviewtab2" data-toggle="tab">현재 상영작</a></li>--%>
			    <li class="active"><a href="<%=request.getContextPath() %>/review/seen">내가 본 영화</a></li>
			</ul>
			<div class="tab-content">
			    <div class="tab-pane active" id="reviewtab1">
			    	<div class="tab-header">
			    		<h5>전체 <span>${listsize } </span>건</h5>
			    		<div class="tab-header-right">
			    			<span class="orderdate" data-order="date">최신순</span>
			    			<span class="orderlike" data-order="like">공감순</span>
			    			<form method="get" action="<%=request.getContextPath() %>/review">
					    		<div class="tab-header-search">
					    			<input type="hidden" name="btype" value="${btype }">
					    			<input type="text" name="search" placeholder="제목, 장르, 감독, 배우, 닉네임">
					    			<button type="submit"><i class="fas fa-search fa-fw"></i></button>
					    		</div>
				    		</form>
			    		</div>
			    	</div>
					<div class="row">
						<c:if test="${list == null}">
							<h1 class="listnull">리뷰 리스트가 존재하지 않습니다.</h1>
						</c:if>
						<c:if test="${list != null }">
							<c:forEach var="i" items="${list }" varStatus="loop">
						   		<!-- 리뷰 1개 영역 START -->
								<div class="col-md-3">
									<div class="card mb-3 shadow-sm rlist">
										<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><div class="card-image"><img src="${i.getImgurl() }"></div></a>
										<div class="card-body">
											<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><small class="text-muted">${i.getAid() }</small></a>
											<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><h5>${i.getTitle() }</h5></a>
											<a href="<%=request.getContextPath() %>/review/detail?rid=${i.getId() }"><p>${i.getContents() }</p></a>
											<div class="d-flex justify-content-between align-items-center">
												<div class="btn-group">
													<button type="button" class="btn btn-sm btn-outline-secondary btn-gcnt" data-id="${i.getId() }"><i class="far fa-thumbs-up fa-fw"></i><span>${i.getGcnt() }</span></button>
													<button type="button" class="btn btn-sm btn-outline-secondary btn-bcnt" data-id="${i.getId() }"><i class="far fa-thumbs-down fa-fw"></i><span>${i.getBcnt() }</span></button>
													<button type="button" class="btn btn-sm btn-outline-secondary btn-cnt"><i class="far fa-comment-alt fa-fw"></i><span>${i.getCommcnt() }</span></button>
												</div>
												<small id="cdate${loop.count }" class="text-muted cdate" data-cdate="${i.getCdateFM() }"></small>
											</div>
										</div>
									</div>
								</div>
								<!-- 리뷰 1개 영역 END -->
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</section>
<jsp:include page="review_footer.jsp"></jsp:include>
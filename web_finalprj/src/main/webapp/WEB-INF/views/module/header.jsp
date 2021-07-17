<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.navbar .container { display:flex; }
.navbar .container a { color:#fff; font-size:1.2rem; letter-spacing:0.1rem; }
.navbar .container img { height:50px; padding:0.5rem 0; cursor:pointer }
body { padding-top:66px !important; }


a:first-child:hover #box { display:block; }
#box { display:none; height:350px; width:70%; box-sizing:border-box; margin:0 auto; }
#box .tab { padding-top:50px; }
#box ul,ol { list-style-type:none; }
#box .tab .on .custombtn { border-bottom:2px solid black; }
#box .tab .custombtn { display:block; color:black; background-color:transparent; border:none; cursor:pointer; letter-spacing:-1px; font-weight:500; margin:0; padding:0 0 3px 0; }
#box .contents { position:relative; min-height:211px; }
#box .contents p { overflow:hidden; position:absolute; left:40px; top:0; width:150px; height:210px; font-size:0; line-height:0 }
#box .contents img { width:100%; height:100%; }
#box .contents .list { width:600px; padding-left:200px; }
#box .contents .list ol { width:100%; }
#box .contents .list li { width:100%; height:40px; display:inline-block; vertical-aligh:middle; font-weight:300; font-size:1.86em; }
#box .contents .list li em { margin:0 20px 0 0 }
#box .contents .list li em a { display:inline-block; white-space:nowrap; text-overflow:ellipsis; overflow:hidden; font-size:0.5em !important;}
.search { width:400px; height:60px; position:absolute; left:900px; top:210px; font-size:1em; }
.search input,button { background-color:transparent; border:none; }
.search input { margin-right:-10px; width:350px; border-bottom:1px solid black; }
.search input:focus { outline:none; }
.search button { -webkit-appearance:button; border-bottom:1px solid black; }

</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
  	<!-- <a href=""><i class="fa fa-search" aria-hidden="true"></i></a> -->
  	<a href="<%=request.getContextPath() %>/movie">영화</a>
  	<a href="" onclick="alert('추가구현예정')">영화관</a>
    <img src="<%=request.getContextPath() %>/resources/images/common/logo.png" class="d-inline-block align-top" alt="SEENEMA 로고" onclick="location.href='<%=request.getContextPath() %>/index';">
    <a href="<%=request.getContextPath() %>/reserve?location=${branchDTO.location }">예매</a>
    <a href="<%=request.getContextPath() %>/review">리뷰</a>
  </div>
</nav>

	
<div id="box">
	<div class="tab">
		<ul>
			<li class="on"><button type="button" class="custombtn">예매율순</button></li>
		</ul>
	</div>
	<c:url var="path" value="/resources/images/movie/1/poster/movie_image (1).jpg" />
	<div class="contents">
		<p><img src="${path }"></p>
		<div class="list">
			<ol>
				<li><em>1</em><a>#위왓치유</a></li>
				<li><em>2</em></li>
				<li><em>3</em></li>
				<li><em>4</em></li>
				<li><em>5</em></li>
			</ol>
		</div>
	</div>
	<div class="search">
		<input type="text" placeholder="영화명을 입력하세요">
		<button><i class="fa fa-search" aria-hidden="true"></i></button>
	</div>
</div>
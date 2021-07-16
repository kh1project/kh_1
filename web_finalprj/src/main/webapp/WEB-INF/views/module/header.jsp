<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.navbar .container { display:flex; }
.navbar .container a { color:#fff; font-size:1.2rem; letter-spacing:0.1rem;}
.navbar .container img { height:50px; padding:0.5rem 0; cursor:pointer }
body { padding-top:66px !important; }
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  <div class="container">
  	<a href="<%=request.getContextPath() %>/movie">영화</a>
  	<a href="" onclick="alert('추가구현예정')">영화관</a>
    <img src="<%=request.getContextPath() %>/resources/images/common/logo.png" class="d-inline-block align-top" alt="SEENEMA 로고" onclick="location.href='<%=request.getContextPath() %>/index';">
    <a href="<%=request.getContextPath() %>/reserve?location=${branchDTO.location }">예매</a>
    <a href="<%=request.getContextPath() %>/review">리뷰</a>
  </div>
</nav>
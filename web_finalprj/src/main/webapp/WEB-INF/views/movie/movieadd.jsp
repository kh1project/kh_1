<%@ page isELIgnored="false" language="java"
     contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
     <title>영화 등록</title>
     <c:url var="root" value="/"/>
     <script type="text/javascript" src="${root }/resources/jquery/js/jquery-3.6.0.min.js"></script>
     <script type="text/javascript" src="${root }/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
     <script type="text/javascript" src="${root }/resources/static/js/movieadd.js"></script>
     <link type="text/css" rel="stylesheet" href="${root }/resources/bootstrap-4.6.0/css/bootstrap.min.css">
     <link type="text/css" rel="stylesheet" href="${root }/resources/static/css/common.css">
     <style>
     @import
          url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap');
     </style>
     <link type="text/css" rel="stylesheet" href="${root }/resources/static/css/movieadd.css">
</head>
<body>
     <header>
           <%@ include file="../module/header.jsp"%>
     </header>
<body class="pt-5">
     <div class="inner-wrap">
           <form class="pt-5" action="${root}movie/add/register" method="POST" enctype="multipart/form-data">
                <label for="mid">영화 등록번호</label>
                <!-- 아래 input name을 mid에서 id로 바꿨습니다. -->
                <input class="form-control" id="id" name="id" type="text" placeholder="영화 등록번호" value="${mid }" readonly></input>
                <div>
                     <div class="info-container pt-5">
                           <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                     <span class="input-group-text" id="inputGroupFileAddon01">포스터 등록</span>
                                </div>
                                <div class="custom-file">
                                     <input type="file" class="custom-file-input" id="poster" name="poster" required aria-describedby="inputGroupFileAddon01" multiple>
                                     <label class="custom-file-label" for="poster">선택된 파일 없음</label>
                                </div>
                           </div>
                           <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                     <span class="input-group-text" id="inputGroupFileAddon02">스틸컷 등록</span>
                                </div>
                                <div class="custom-file">
                                     <input type="file" class="custom-file-input" id="stillcut" name="stillcut" required aria-describedby="inputGroupFileAddon02" multiple>
                                     <label class="custom-file-label" for="stillcut">선택된 파일 없음</label>
                                </div>
                           </div>
                           <!-- <div class="select-poster">
                                <span>
                                     <label for="mainposter">포스터 선택</label>
                                     <select class="custom-select" id="mainposter" name="mainposter" required>
                                           <option selected disabled value="">메인 포스터</option>
                                     </select>
                                </span>
                                <span>
                                     <select class="custom-select" id="subposter" name="subposter" required>
                                           <option selected disabled value="">서브 포스터</option>
                                     </select>
                                </span>
                           </div> -->
                           
                           <div>
                                <label for="title">영화 제목</label>
                                <input type="text" class="form-control" id="title" name="title" placeholder="영화 제목" required></input>
                           </div>
                           <div>
                                <label for="subtitle">영화 부제목</label>
                                <input type="text" class="form-control" id="subtitle" name="subtitle" placeholder="영화 부제목"></input>
                           </div>
                     </div>
                </div>
                <div class="content-text">
                     <div class="summary">
                           <label for="summary">줄거리</label>
                           <textarea class="form-control" id="summary" name="summary" cols="30" rows="10" required></textarea>
                     </div>
                     <hr>
                     <div class="movie-textinfo">
                           <div>
                                <label for="type">상영타입</label>
                                <input type="text" class="form-control" id="type" name="type" placeholder="상영타입" required>
                           </div>
                           <div style="margin-bottom: -15px">
                                <p>
                                     <label for="director">감독</label>
                                     <input type="text" class="form-control" id="director" name="director" placeholder="감독" required>
                                </p>
                                <p class="partition" />
                                <p>
                                     <label for="genre">장르</label>
                                     <input type="text" class="form-control" id="genre" name="genre" placeholder="장르" required>
                                </p>
                                 &emsp;/&emsp;
                                <p>
                                     <label for="runningtime">러닝타임</label>
                                     <input type="number" class="form-control" id="runningtime" name="runningtime" step="1" placeholder="러닝타임" required>
                                </p>
                                <p class="partition" />
                                <p>
                                     <label for="rating">관람제한등급</label>
                                     <select class="custom-select" id="rating" name="rating" required>
                                           <option selected disabled value="">관람제한등급</option>
                                           <option value="0">All</option>
                                           <option value="12">12</option>
                                           <option value="15">15</option>
                                           <option value="19">청불</option>
                                     </select>
                                </p>
                                <p class="partition" />
                                <p>
                                <label for="playdate">개봉일</label>
                                     <input type="date" class="form-control" id="playdate" name="playdate" required></input>
                                </p>
                           </div>
                           <p>
                           <label for="actor">배우</label>
                                <input type="text" class="form-control" id="actor" name="actor" placeholder="경영왕 이경영" required></input>
                           </p>
                     </div>
                </div>
                <button type="submit" class="btn btn-primary">등록</button>
           </form>
     </div>
     <hr>
     </div>
</body>
<footer>
     <%@ include file="../module/footer.jsp"%>
</footer>
</body>
</html>
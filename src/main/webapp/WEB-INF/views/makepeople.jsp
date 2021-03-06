<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>레시피를 부탁해</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/full-width-pics.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style>
h1{
	font-family: 'Jua', sans-serif;
		font-size: 1.5em;
}
img {
    width: 250px;
    height:300px;
    border-radius: 150px; /* 이미지 반크기만큼 반경을 잡기*/
    text-align: center;
}
.container1 {
    width: 1400px;
    height: 400px;
    position: absolute;
    margin-left: -200px;
    margin-top: -100px;
    left: 24%;
    top: 30%;
}

ul.img {
		font-family: 'Jua', sans-serif;
		font-size: 1.5em;
        list-style-image: url( "${pageContext.request.contextPath}/resources/img/icon1.png" );
      }
</style>

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">레시피를 부탁해</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      		<c:if test="${sessionScope.GRADE eq null}">
		      <div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		        <li class="nav-item active">
		            <a class="nav-link" href="${pageContext.request.contextPath}/mem/login.do">로그인
		              <span class="sr-only">(current)</span>
		            </a>
		          </li>
		          <li class="nav-item active">
		            <a class="nav-link" href="${pageContext.request.contextPath}/use.do">사용방법
		              <span class="sr-only">(current)</span>
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/makepeople.do">만든사람들</a>
		          </li>
		        </ul>
		      </div>
	      </c:if>
	      <c:if test="${sessionScope.GRADE eq 1}">
		      <div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		          
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/rank.do">검색&인기순위</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/use.do">사용방법</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/mem/logout.do">로그아웃</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/mem/list.do?mid=${sessionScope.S_ID}">마이페이지</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/mem/delete.do?mid=${sessionScope.S_ID}">회원탈퇴</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/makepeople.do">만든사람들</a>
		          </li>
		        </ul>
		      </div>
	      </c:if>
	      <c:if test="${sessionScope.GRADE eq 9}">
		      <div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/rank.do">검색&인기순위</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/use.do">사용방법</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/admin_insert.do">레시피 등록</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/admin.do">레시피 편집</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/mem/logout.do">로그아웃</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/makepeople.do">만든사람들</a>
		          </li>
		        </ul>
		      </div>
	      </c:if>
    </div>
  </nav>
  <section class="py-5 bg-image-full " style="background-color: #FCF8F3;" >
    <div style="height: 700px;" > 
    	<div style="text-align: left;" class="container1">
    		<div style="width:250px; background-color: #FCF8F3; float: left; text-align: left;" >
    			<div style="text-align: center;">
    				<img src="${pageContext.request.contextPath}/resources/img/make_people1.png"><br>
    			</div>
    			<h1>&nbsp신경종</h1>
    			<ul class="img">
    				<li>DB 설계 및 관리</li>
    				<li>UI 디자인 구성 및 관리</li>
    			</ul>
    		</div>
    		<div style="width:100px; background-color: #FCF8F3; float: left; "><br></div>
    		
    		<div style="width:250px; background-color: #FCF8F3; float: left; text-align: left;">
    			<div style="text-align: center;">
    				<img src="${pageContext.request.contextPath}/resources/img/make_people2.png"><br>
    			</div>
    			<h1>&nbsp정상운</h1>
    			<ul class="img">
    				<li>레시피 검색 및 출력</li>
    				<li>레시피별 평점 평가</li>
					<li>댓글 등록/삭제</li>
    			</ul>
    		</div>
    		
    		<div style="width:100px; background-color: #FCF8F3; float: left; "><br></div>
    		
    		<div style="width:250px; background-color: #FCF8F3; float: left; text-align: left;">
    			<div style="text-align: center;">
    				<img src="${pageContext.request.contextPath}/resources/img/make_people3.png"><br>
    			</div>
    			<h1>&nbsp정광수</h1>
    			<ul class="img">
    				<li>로그인/로그아웃</li>
    				<li>회원가입/탈퇴</li>
    				<li>마이페이지 관리/수정</li>
    			</ul>
    		</div>
    		
    		<div style="width:100px; background-color: #FCF8F3; float: left; "><br></div>
    		
    		<div style="width:250px; background-color: #FCF8F3; float: left; text-align: left;">
    			<div style="text-align: center;">
    				<img src="${pageContext.request.contextPath}/resources/img/make_people4.png"><br>
    			</div>
    			<h1>&nbsp이기영</h1>
    			<ul class="img">
    				<li>관리자 페이지</li>
    				<li>레시피 등록/수정/삭제</li>
    			</ul>
    		</div>
    	</div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"></p>
    </div>
    <!-- /.container -->
  </footer>
  
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>

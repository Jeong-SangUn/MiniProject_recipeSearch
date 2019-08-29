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
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap&subset=korean"
	rel="stylesheet">
<style>
.container1 {
    width: 400px;
    height: 400px;
    position: absolute;
    margin-left: -200px;
    margin-top: -100px;
    left: 50%;
    top: 50%;

}
</style>
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/home.do">레시피를 부탁해</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
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
	
	<div class="container1" >
			<form action="" method="post" class="form-horizontal">
				<h4>Welcome back.</h4>
				<input type="text" id="userName" name="m_id" class="form-control" placeholder="username" /> <br /> 
				<input type="password" id="userPassword" name="m_pw" class="form-control" placeholder="password" /> <br />
				<button type="submit" class="btn btn-primary btn-md" onclick="javascript: form.action='${pageContext.request.contextPath}/mem/login.do';">로그인</button>
				<button type="submit" class="btn btn-primary btn-md" onclick="javascript: form.action='${pageContext.request.contextPath}/mem/join.do' ;method='get';">회원가입</button>
			</form>
	</div>
	
	<section class="py-5 bg-image-full" style="background-image: url('${pageContext.request.contextPath}/resources/img/background.jpg');">
    	<div style="height: 700px;"></div>
  	</section>
  	
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white"></p>
		</div>
	</footer>

</body>

</html>

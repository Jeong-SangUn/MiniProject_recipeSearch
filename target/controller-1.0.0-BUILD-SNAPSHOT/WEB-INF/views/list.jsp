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

<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/full-width-pics.css"
	rel="stylesheet">
<style>
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
  	<div style="width: 600px; height: 700px; margin: 0 auto; margin-top:100px" >
    	<div style="width: 600px; margin: 0 auto; margin-top:100px" >
	<h3>마이페이지</h3>
		<table border="1"  class="table table-bordered">
			<thead>
				<tr>
					<th>아이디</th>
						<td>
							${m.MID}
						</td>
				</tr>
				<tr>
					<th>이름</th>
						<td>
							${m.NAME}
						</td>
				</tr>
				<tr>
					<th>생년월일</th>
						<td>
							${m.MEM_BIRTH}
						</td>
				</tr>
				<tr>
					<th>폰번호</th>
						<td>
							${m.PHONE}
						</td>
				</tr>
				<tr>
					<th>주소</th>
						<td>
							${m.ADDR}
						</td>
				</tr>
		</thead>
		</table>
		<p align="right"><button class="btn btn-primary" onclick="location.href='modify.do?mid=${m.MID}'" type="submit">정보수정</button></p>
	</div>
			
    </div>

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

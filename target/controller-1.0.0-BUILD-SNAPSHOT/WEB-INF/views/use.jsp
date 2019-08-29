<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>사용방법</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/full-width-pics.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Song+Myung&display=swap&subset=korean" rel="stylesheet">
<style>
#pfont{
	font-family: 'Song Myung', serif;
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
	
	
	<!-- Header - set the background image for the header in the line below -->
  <section class="py-5 bg-image-full" style="background-image: url('${pageContext.request.contextPath}/resources/img/use_1.jpg');opacity: 0.5;">
    <div style="height: 200px;"></div>
  </section>

  <!-- Content section -->
  <section class="py-5" style="background: linear-gradient(to bottom, #FFFDF7 0%, #FEF8E6 86%);">
    <div class="container" >
      <h1 id="pfont">로그인 후 모든 기능 이용 가능</h1><br>
      <h4>레시피를 부탁해는 로그인 후에 이용가능 합니다.</h4>
    </div>
    
    
  </section>
  <!-- Header - set the background image for the header in the line below -->
  <section class="py-5 bg-image-full" style="background-image: url('${pageContext.request.contextPath}/resources/img/use_2.jpg');opacity: 0.5;">
    <div style="height: 200px;"></div>
  </section>

  <!-- Content section -->
  <section class="py-5" style="background: linear-gradient(to bottom, #FFFEFC 0%, #FEF8E6 86%);">
    <div class="container">
      <h1 id="pfont">레시피 인기 순위 확인</h1><br>
      <h4>각각의 레시피의 평점과 조회를 보고 원하는 레시피 선택이 가능합니다.</h4>
    </div>
  </section>
  
  <section class="py-5 bg-image-full" style="background-image: url('${pageContext.request.contextPath}/resources/img/use_3.jpg');opacity: 0.5;">
    <div style="height: 200px;"></div>
  </section>

  <!-- Content section -->
  <section class="py-5" style="background: linear-gradient(to bottom, #FFFEFC 0%, #FEF8E6 86%);">
    <div class="container">
      <h1 id="pfont">요리 이름으로 검색</h1><br>
      <h4>자신이 먹고 싶은 요리 이름으로 검색이 가능합니다.</h4>
    </div>
  </section>
	
	
  <section class="py-5 bg-image-full" style="background-image: url('${pageContext.request.contextPath}/resources/img/use_4.jpg');opacity: 0.5;">
    <div style="height: 200px;"></div>
  </section>

  <!-- Content section -->
  <section class="py-5" style="background: linear-gradient(to bottom, #FFFEFC 0%, #FEF8E6 86%);">
    <div class="container" >
      <h1 id="pfont">재료 검색 기능 제공</h1><br>
      <h4>들어가는 재료 검색을 통해 레시피를 선택할 수 있습니다.<br/>
      	재료를 2개 이상 입력 시 재료이름 쓰고 띄어쓰기 순으로 입력해야합니다. (예: 소금 간장 돼지고기)<br/>
      	검색시 두음절 이상의 이름으로 검색해야 결과값이 정확합니다. (예: 파(x)-> 대파 / 쪽파(O) )</h4>
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

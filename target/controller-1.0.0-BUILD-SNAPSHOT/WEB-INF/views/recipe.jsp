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
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetswal/dist/sweetswal.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>


#homeletter {
	font-family: 'Nanum Brush Script', cursive;
	font-size: 10.0em;
	text-align: center;
	vertical-align: middle;
	line-height: 600px;
}

.contents {
	white-space: pre-wrap;
	font-size: x-large;
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
    <div> 
    <table style="margin-left: auto; margin-right: auto;"
		class="ui table vertical devTableStyle">
		<colgroup>
			<col width="800px">
		</colgroup>
		<tr style="text-align: center;">
			<td><h2>${recipe.rname }</h2></td>
		</tr>
		<tr style="text-align: center;">
			<td><img src="recipeImg.do?id=${recipe.rid}" width="450px"
				height="350px" /></td>
		</tr>
		<tr style="text-align: right;">
			<td>
				<form action="${pageContext.request.contextPath }/updateScore.do" >
					<h5>점수 평가</h5>
					<p align="right">
					<select name="score" class="form-control" style="width:70px" >
						<option value="0">0</option>
						<option value="0.5">0.5</option>
						<option value="1">1</option>
						<option value="1.5">1.5</option>
						<option value="2">2</option>
						<option value="2.5">2.5</option>
						<option value="3">3</option>
						<option value="3.5">3.5</option>
						<option value="4">4</option>
						<option value="4.5">4.5</option>
						<option value="5">5</option>
					</select> <input type="hidden" name="rid" value="${recipe.rid}" />
					</p>
					<input type="submit" value="평가" class="btn btn-primary btn-xs"/>
				</form>
			</td>
		</tr>
		<tr height="200px" class="contents">
			<td>${recipe.rcontent }<br /></td>
		</tr>
		<tr height="200px" class="contents">
			<td>${recipe.ritem }<br />
		</tr>
		<tr class="contents">

			<td>${recipe.rrecipe }</td>
		</tr>

	</table>
	<br />
	<br />
	<br />
	<form:form action="${pageContext.request.contextPath}/insertcomment.do"
		modelAttribute="insert_comment" method="post">
		<table style="margin-left: auto; margin-right: auto;"
			class="ui table vertical devTableStyle" >
			
				<form:input type="hidden" path="rid" value="${recipe.rid }" />
				<form:input type="hidden" path="mid" value="${sessionScope.S_ID}" />
			
			<tr>
				<td width="90%"><form:input type="text"  class="form-control" style=" width: 100%;" path="content" /></td>
				<td width="5%" align="right"><input type="submit" class="btn btn-primary" value="댓글등록"></td>
			</tr>

		</table>
	</form:form>

	<form action="${pageContext.request.contextPath}/deletecomment.do"
		method="post">
		<table style="margin-left: auto; margin-right: auto;" class="ui table vertical devTableStyle" >
			<colgroup>
				<col width="200px">
				<col width="600px">
			</colgroup>
			<c:forEach var="comment" items="${comment}">
				<tr>
					<td width="10%">${comment.mid }</td>
					<td width="85%">${comment.content }</td>
					<td width="5%">
					<c:set value="${sessionScope.S_ID}" var="id"></c:set>
					<c:if test="${comment.mid eq id}">
						<input type="hidden" name="comment_cid"
							value="${comment.cid }" /> <input type="hidden"
							name="comment_rid" value="${comment.rid }" /> <input
							type="submit" value="삭제" class="btn btn-primary btn-xs"/>
					</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
    
    </div>
<script>
		$(".devTableStyle td").attr("style", "word-break:break-all");
</script>
<script>

	var score_chk = "${score_chk}";
	console.log(score_chk);
	if(score_chk == "score_turechk"){
		swal("이미 평가하셨습니다");
	}else if(score_chk == "score_falsechk"){
		swal("평가가 완료되었습니다");
	}
	
</script>


  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"></p>
    </div>
    <!-- /.container -->
  </footer>
</body>

</html>

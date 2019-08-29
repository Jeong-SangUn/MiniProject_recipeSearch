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
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
.mid {
	font-size: 15px;
	color: #ff0000;
}
</style>

<script>
	var msg = "${ok}";
	if (msg == 'failure') {
		alert("회원정보가 틀립니다. 아이디와 비밀번호를 확인해주세요.");
	}

	function agree() {
		var test = document.getElementById('c_info');
		if (test.checked) {
			$("#info").css("display", "block");
		} else {
			$("#info").css("display", "none");
		}
	}
</script>
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
						<li class="nav-item active"><a class="nav-link"
							href="${pageContext.request.contextPath}/mem/login.do">로그인 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item active"><a class="nav-link"
							href="${pageContext.request.contextPath}/use.do">사용방법 <span
								class="sr-only">(current)</span>
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/makepeople.do">만든사람들</a>
						</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${sessionScope.GRADE eq 1}">
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">

						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/rank.do">검색&인기순위</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/use.do">사용방법</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/mem/logout.do">로그아웃</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/mem/list.do?mid=${sessionScope.S_ID}">마이페이지</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/mem/delete.do?mid=${sessionScope.S_ID}">회원탈퇴</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/makepeople.do">만든사람들</a>
						</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${sessionScope.GRADE eq 9}">
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/rank.do">검색&인기순위</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/use.do">사용방법</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin_insert.do">레시피
								등록</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/admin.do">레시피 편집</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/mem/logout.do">로그아웃</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/makepeople.do">만든사람들</a>
						</li>
					</ul>
				</div>
			</c:if>
		</div>
	</nav>
	<div
		style="width: 600px; height: 700px; margin: 0 auto; margin-top: 100px">
		<div style="width: 600px; margin: 0 auto; margin-top: 100px">
			<h2>탈퇴 안내</h2>
			<br> 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br> 사용하고 계신 아이디 <span
				class="mid">"${map}"</span> 는 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br> 탈퇴한
			아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br> 게시판에 올린 댓글은
			탈퇴 시 자동 삭제됩니다. <br> <span class="mid">"${map}"</span>님 진짜
			회원탈퇴하시겠습니까?" <input type="checkbox" id="c_info"> <input
				type="button" value="확인" onClick="agree();" />

			<div id="info" style="display: none;" align="center">
				<br> <br>
				<form action="${pageContext.request.contextPath}/mem/delete.do" method="post">
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" style="width:100%; border: 0; outline: none;" name="m_id" value="${map}" readonly /></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="m_pw" /></td>
						</tr>
						<tr>
							<td colspan="2" align="right"><input type="submit" class="btn btn-primary" value="회원탈퇴" /></td>
						</tr>
						
					</table>
				</form>
			</div>
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

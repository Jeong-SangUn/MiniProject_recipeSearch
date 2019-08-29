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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
input {
	width: 100%;
	border: 0;
	outline: none;
}
</style>
<script src="https://unpkg.com/sweetswal/dist/sweetswal.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery('#postcode1').val(data.postcode1);
				jQuery('#postcode2').val(data.postcode2);
				jQuery('#m_addr1').val(data.address);
				jQuery('#address_etc').focus();
				console.log(data);
			}
		}).open();
	}
	function showPopup() {
		window
				.open("popup.do", "a",
						"width=500, height=200, left=700, top=200");
	}

	function checkvalue() {
		console.log(test.m_pw.value);
		console.log(test.m_pw.value.length);
		if (test.m_pw.value.length >= 6 && test.m_pw.value.length <= 16){
			if (test.m_pw.value && test.m_pw2.value) {
				if (test.m_pw.value != test.m_pw2.value) {
					test.status.value = "암호가 일치하지 않습니다";
					test.status.style.color = 'red';
				}else{
					test.status.value = "암호가 일치합니다";
					test.status.style.color = 'green';
				}
			}else {
				test.status.value = "암호를 입력해 주세요 ";
				test.status.style.width = 160;
			}
		}else{
			test.status.value = "암호는 6자 이상 16자 이하만 가능합니다";
			test.status.style.color = 'red';
		}
	}
</script>



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
		style="width: 800px; height: 700px; margin: 0 auto; margin-top: 100px">

		<form action="${pageContext.request.contextPath}/mem/join.do"
			method="post" name="test">
			<table style="margin-left: auto; margin-right: auto;"
				id="joinlocation" class="table table-bordered">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="m_id" id="m_id"
						style="background-color: #e2e2e2;" readonly /></td>
					<td colspan="2"><input type="button" onclick="showPopup();"
						value="중복체크" class="btn btn-primary btn-sm" /></td>
				</tr>
				<tr>
					<td>암호</td>
					<td colspan="3"><input type="password" id="m_pw" name="m_pw"
						onblur=checkvalue();></td>
				</tr>
				<tr>
					<td>암호확인</td>
					<td colspan="2" width="310px"><input type="password" id="m_pw2" name="m_pw2"
						onblur=checkvalue();></td>
					<td width="250px"><input type="text" name="status" readonly
						onfocus="this.blur();" value="비밀번호를 입력해 주세요 " style="font-size:12px"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="3"><input type="text" id="m_name" name="m_name" /></td>
				</tr>
				<tr>
					<td>휴대번호</td>
					<td colspan="3"><input type="text" id="m_phone" name="m_phone" /></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td colspan="3"><input type="text" id="m_birth" name="m_birth"
						placeholder="생년월일 6자리" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="m_addr1" name="m_addr1" readonly /></td>
					<td colspan="2"><input type="button" value="주소검색"
						onclick="openDaumZipAddress()" class="btn btn-primary btn-sm" /></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td colspan="3"><input type="text" id="m_addr2" name="m_addr2"
						placeholder="직접입력" id="address_etc" /></td>
				</tr>
				<tr>
					<td colspan="4" align="right"><input type="button" id="check"
						value="회원가입" class="btn btn-primary btn-sm" /></td>
				</tr>
			</table>
		</form>

	</div>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white"></p>
		</div>
		<!-- /.container -->
	</footer>

	<script>
		$(document).ready(function() {
			$("#check").click(function() {
				var m_pw = $("#m_pw").val();
				var m_pw2 = $("#m_pw2").val();
				var m_id = $("#m_id").val();
				var m_name = $("#m_name").val();
				var m_phone = $("#m_phone").val();
				var m_birth = $("#m_birth").val();
				var m_addr1 = $("#m_addr1").val();
				var m_addr2 = $("#m_addr2").val();
				
				if(m_birth.length != 6){
					swal("생년월일을 6자리 입력하세요\n(ex 1993년 7월 8일 -> 930708)");
				} else if (isNaN(m_birth)) {
					swal("생년월일은 숫자만 입력하세요(ex 1993년 7월 8일 -> 930708)");
				} else if (isNaN(m_phone)) {
					swal("휴대번호는 숫자만 입력하시요 (ex 01011112222)");
				} else if (m_id == "") {
					swal("아이디를 입력하세요");
				} else if (m_pw != m_pw2 || m_pw.length < 6 || m_pw.length > 16 ){
					swal("암호를 확인해주세요");
				} else if (m_name == "") {
					swal("이름을 입력하세요");
				} else if (m_phone == "") {
					swal("휴대번호를 입력하세요");
				} else if (m_addr1 == "") {
					swal("주소를 입력하세요");
				} else if (m_addr2 == "") {
					swal("상세주소를 입력하세요");
				} else {
					$('form').submit();
				}

			});
		});
	</script>
</body>
</html>

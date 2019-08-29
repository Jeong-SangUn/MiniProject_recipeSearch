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

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

	<div style="width: 600px; height: 700px; margin: 0 auto; margin-top: 100px">
		<div style="width: 600px; margin: 0 auto; margin-top: 100px">
			<h3>수정정보</h3>
	<form action="${pageContext.request.contextPath}/mem/modify.do" method="post">
		<table border="1" class ="table table-bordered">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid"  style="width:100%; border: 0; outline: none;" value="${map.MID}" readonly  /></td>
			</tr>
			<tr>	
				<th>이름</th>
				<td><input type="text" name="name"  style="width:100%; border: 0; outline: none;" value="${map.NAME}" readonly /></td>
			</tr>		
			<tr>	
				<th>휴대번호</th>
				<td><input type="text" id = "phone" name="phone" style="width:130px; border: 0; outline: none;"  value ="${map.PHONE}"/></td>
			</tr>
			<tr>	
				<th>주소</th>
				<td><input type="text" id=m_addr1 name="addr" style="width:380px; border: 0; outline: none;"  value="${map.ADDR}" />
					<input type="button" class="btn btn-primary" value="주소검색" onclick="openDaumZipAddress()"/>
				</td>
			</tr>
			<tr>	
				<th>생년월일</th>
				<td><input type="text" id = "birth" name = "birth" style="width:130px; border: 0; outline: none;" value="${map.MEM_BIRTH}" /></td>
			</tr>
			
		</table>
		<p align="right"><input type="button" class="btn btn-primary" id="check" value="확인" /></p>


	<script>
		$(document).ready(function() {
			$("#check").click(function() {
				var m_phone = $("#phone").val();
				var m_addr1 = $("#m_addr1").val();
				var m_birth = $("#birth").val();			
				
				try{
					if(isNaN(m_birth)) throw alert("생년월일은 숫자만 입력하세요(-제외)");
					if(isNaN(m_phone)) throw alert("휴대번호는 숫자만 입력하시요 (-제외)");
				}catch(err){
					message.innerHTML = "Input" +err;
				}
				
				if(m_phone==""){
					alert("폰번호를 입력하세요");
				}
				else if(m_addr1=""){
					alert("주소를 입력하세요");
				}
				else if(birth=""){
					alert("생년월일을 입력하세요");
				}
				else{
					$('form').submit();
				}
			
		});
		});
	</script>
	</form>
		</div>
	</div>
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white"></p>
		</div>
		<!-- /.container -->
	</footer>

</body>

</html>

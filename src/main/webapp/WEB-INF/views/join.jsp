<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js">
	
</script>
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
		window.open("popup.do", "a",
				"width=600, height=300, left=1000, top=400");
	}
</script>

<body>
	<form action="${pageContext.request.contextPath}/mem/join.do"
		method="post">
		아이디 : <input type="text" name="m_id" id="m_id" readonly /> <input
			type="button" onclick="showPopup();" value="중복체크" /><br /> 암호 : <input
			type="password" id="m_pw" name="m_pw"><br /> 암호확인 : <input
			type="password" id="m_pw2" name="m_pw2"><br /> 이름 : <input
			type="text" id="m_name" name="m_name" /><br /> 나이 : <input
			type="text" id="m_age" name="m_age" /><br /> 폰번호 : <input
			type="text" id="m_phone" name="m_phone" /><br /> 생년월일 : <input
			type="text" id="m_birth" name="m_birth" placeholder="생년월일 6자리" /><br />
		<input type="button" value="주소검색" onclick="openDaumZipAddress()" />
		주소 : <input type="text" id="m_addr1" name="m_addr1" readonly /> 상세주소
		: <input type="text" id="m_addr2" name="m_addr2" placeholder="직접입력"
			id="address_etc" /><br> <input type="button" id="check"
			value="회원가입" />
	</form>

	<script>
		$(document).ready(function() {
			$("#check").click(function() {
				var m_pw = $("#m_pw").val();
				var m_pw2 = $("#m_pw2").val();
				var m_id = $("#m_id").val();
				var m_name = $("#m_name").val();
				var m_age = $("#m_age").val();
				var m_birth = $("#m_birth").val();
				var m_addr1 = $("#m_addr1").val();
				var m_addr2 = $("#m_addr2").val();
				if (m_id == "") {
					alert("아이디를 입력하세요");
				} else if (m_pw != m_pw2) {
					alert("암호가 다릅니다.");
				} else if (m_name == "") {
					alert("이름을 입력하세요");
				} else if (m_age == "") {
					alert("나이를 입력하세요");
				} else if (m_birth == "") {
					alert("생년월일을 입력하세요");
				} else if (m_addr2 == "") {
					alert("상세주소를 입력하세요");
				} else {
					$('form').submit();
				}

			});
		});
	</script>
</body>
</html>
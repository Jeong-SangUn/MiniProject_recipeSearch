
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
	<form
		action="${pageContext.request.contextPath}/mem/registerOverlap.do"
		method="post" id="fo">
		<br> 아이디중복확인 : <input type="text" id="m_id" name="m_id"
			value="${m_id}" /> <br> <br> <input type="button"
			id="check" value="확인" />

		<div id="info"></div>
		<input type="button" id="use" style="display: none;" value="사용" />
	</form>

	<script>
		$(document).ready(function() {

			$("#check").click(function() {
				var m_id = $("#m_id").val();
				if (m_id == "") {
					alert("빈문자값을 넣으면 안됩니다");
				} else {
					$('form').submit();
				}
			});

			var msg = "${msg}";
			if (msg) {
				if (msg == "overlap") {
					$("#info").text("중복된 아이디 있습니다.");
					$("#use").css("display", "none");
				} else {
					$("#info").text("사용가능 합니다.");
					$("#use").css("display", "block");
				}

			}

			$("#use").click(function() {
				var m_id = $("#m_id").val();
				window.opener.document.getElementById("m_id").value = m_id;
				window.close();
			});

		});
	</script>



</body>
</html>
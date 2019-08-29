
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
<script src="https://unpkg.com/sweetswal/dist/sweetswal.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
	<form action="${pageContext.request.contextPath}/mem/registerOverlap.do" method="post" id="fo">
		<br> 
		<div>
			<table class="table table-bordered" >
				<tr>
					<td align="center" valign="middle">아이디중복확인</td>
					<td align="center" valign="middle"><input type="text" id="m_id" name="m_id" value="${m_id}"  style="width:100%; border: 0; outline: none;"/></td>
					<td align="center" valign="middle"><input type="button" id="check" value="확인" class="btn btn-primary btn-xs" /></td>
				</tr>
			</table>
		<input type="button" id="use" style="display: none;" value="사용" />
		</div>
	</form>

	<script>
		$(document).ready(function() {
			document.addEventListener('keydown', function(event) {
	              if (event.keyCode === 13) {
	                event.preventDefault();
	              };
	            }, true);
			$("#check").click(function() {
				var m_id = $("#m_id").val();
				if (m_id == "") {
					swal("빈문자값을 넣으면 안됩니다");
				} else {
					$('form').submit();
				}
			});

			var msg = "${msg}";
	         console.log(msg);
	         if (msg) {
	            if (msg == "overlap") {
	               swal("중복된 아이디가 있습니다.");
	            } else {
	               var m_id = $("#m_id").val();
	               window.opener.document.getElementById("m_id").value = m_id;
	               window.close();
	            }

	         }

		});
	</script>



</body>
</html>
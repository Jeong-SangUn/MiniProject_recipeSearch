<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script>
	
$(document).ready(function() {
	   swal("","로그아웃되었습니다.","success").then(function(result){
	       window.location.href = '/controller/home.do';
	     })
	});



</script>

<body>

</body>
</html>
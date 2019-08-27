<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>thumnailForm</title>
</head>
<body>
	<form action="thumnail.do" method="post" enctype="multipart/form-data">
		rid : <input type="text" name="rid"><br />
		<input type="submit" value="요리썸네일 추가" /><br/>
	</form>
	<a href="${pageContext.request.contextPath}">메인으로</a><br/>
</body>
</html>

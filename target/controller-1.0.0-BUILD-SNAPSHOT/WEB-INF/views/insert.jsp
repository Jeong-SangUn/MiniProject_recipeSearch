<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		요리이름 : <input type="text" name="rname"><br />
		이미지 : <input type="file" name="rimage1" /><br />
		간략설명 :<textarea name="rcontent" cols="70" rows="12"></textarea><br />
		재료설명 :<textarea name="ritem" cols="70" rows="12"></textarea><br />
		레시피순 :<textarea name="rrecipe" cols="70" rows="12"></textarea><br />
		<input type="submit" value="요리레시피 추가" /><br/>
	</form>
	<a href="${pageContext.request.contextPath}">메인으로</a><br/>
</body>
</html>
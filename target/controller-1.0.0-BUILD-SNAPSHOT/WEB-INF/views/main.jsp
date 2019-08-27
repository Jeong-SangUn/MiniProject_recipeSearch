<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/rank.do">인기순위</a>
	<br />
	<a href="${pageContext.request.contextPath}/search.do">검색</a>
	<br />
	<a href="${pageContext.request.contextPath}/insert.do">레시피 추가</a>
	<br />
	<a href="${pageContext.request.contextPath}/thumnail.do">썸네일 추가</a>
	<br />
	<br />
	<br />
	<br />
	<div id="wrapper">
		<c:if test="${sessionScope.S_ID eq null}">
			<form action="${pageContext.request.contextPath}/main.do"
				method="post">
				<a href="${pageContext.request.contextPath}/mem/login.do">로그인</a> <a
					href="${pageContext.request.contextPath}/mem/join.do">회원가입</a>
			</form>
		</c:if>
		<c:if test="${sessionScope.S_ID ne null}">
		${sessionScope.S_NA}님 환영합니다.
		<a href="${pageContext.request.contextPath}/mem/logout.do">로그아웃</a>
			<a href="${pageContext.request.contextPath}/mem/edit.do">정보수정</a>
			<a href="${pageContext.request.contextPath}/mem/delete.do">회원탈퇴</a>
		</c:if>
	</div>
</body>
</html>
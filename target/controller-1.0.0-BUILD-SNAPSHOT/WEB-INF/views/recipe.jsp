<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요리 정보</title>
<style>
.contents {
	white-space: pre-wrap;
	font-size: x-large;
}
</style>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<table style="margin-left: auto; margin-right: auto;"
		class="ui table vertical devTableStyle">
		<colgroup>
			<col width="800px">
		</colgroup>
		<tr style="text-align: center;">
			<td><h2>${recipe.rname }</h2></td>
		</tr>
		<tr style="text-align: center;">
			<td><img src="recipeImg.do?id=${recipe.rid}" width="450px"
				height="350px" /></td>
		</tr>
		<tr style="text-align: right;">
			<td>
				<form action="${pageContext.request.contextPath }/updateScore.do">
					<h5>점수 평가</h5>
					<select name="score">
						<option value="5">5</option>
						<option value="4.5">4.5</option>
						<option value="4">4</option>
						<option value="3.5">3.5</option>
						<option value="3">3</option>
						<option value="2.5">2.5</option>
						<option value="2">2</option>
						<option value="1.5">1.5</option>
						<option value="1">1</option>
						<option value="0.5">0.5</option>
						<option value="0">0</option>
					</select> <input type="hidden" name="rid" value="${recipe.rid}" /> <input
						type="submit" value="평가" />
				</form>
			</td>
		</tr>
		<tr height="200px" class="contents">
			<td>${recipe.rcontent }<br /></td>
		</tr>
		<tr height="200px" class="contents">
			<td>${recipe.ritem }<br />
		</tr>
		<tr class="contents">

			<td>${recipe.rrecipe }</td>
		</tr>

	</table>
	<br />
	<br />
	<br />
	<form:form action="${pageContext.request.contextPath}/insertcomment.do"
		modelAttribute="insert_comment" method="post">
		<table style="margin-left: auto; margin-right: auto;"
			class="ui table vertical devTableStyle">
			<colgroup>
				<col width="720px">
				<col width="80px">
			</colgroup>
			<tr>
				<td><form:input type="hidden" path="rid" value="${recipe.rid }" /></td>
				<td><form:input type="hidden" path="mid" value="${sessionScope.S_ID}" /></td>
			</tr>
			<tr>
				<td><form:input type="text" path="content"
						style="width: 700px;" /></td>
				<td><input type="submit" value="댓글등록"></td>
			</tr>

		</table>
	</form:form>

	<br />
	<form action="${pageContext.request.contextPath}/deletecomment.do"
		method="post">
		<table style="margin-left: auto; margin-right: auto;"
			class="ui table vertical devTableStyle" border="1">
			<colgroup>
				<col width="200px">
				<col width="600px">
			</colgroup>
			<c:forEach var="comment" items="${comment}">
				<tr>
					<td>${comment.mid }</td>
					<td>${comment.content }</td>
					<c:set value="${sessionScope.S_ID}" var="id"></c:set>
					<c:if test="${comment.mid eq id}">
						<td><input type="hidden" name="comment_cid"
							value="${comment.cid }" /> <input type="hidden"
							name="comment_rid" value="${comment.rid }" /> <input
							type="submit" value="삭제" /></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</form>
	<script>
		$(".devTableStyle td").attr("style", "word-break:break-all");
		
	</script>


</body>
</html>
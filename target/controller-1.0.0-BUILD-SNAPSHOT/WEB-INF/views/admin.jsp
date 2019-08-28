<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin_insert.do">레시피 등록</a>
	<br />

<div style="width: 800px; margin: 0 auto; margin-top: 10px">
		<table id="dt_table" class="table table-bordered" border=1>
			<thead>
				<tr>
					<th width="100px">요리명</th>						
					<th>내용</th>
					<th width="100px">편집</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr height=100>
						<td align=center>${list.rname}</td>									
						<td >${list.rcontent}</td>
						<td align=center><a href="${pageContext.request.contextPath}/admin_update.do?id=${list.rid}">편집</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
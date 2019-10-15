<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 목록</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script>
	/* $(function() {
		$("#dt_table").DataTable();
	}); */
	$(document).ready(function() {
	    $('#dt_table').DataTable( {
	        "ordering": false,
	        "info":     false
	    } );
	} );
	document.getElementsById("view_table").style.display = "none";
	
</script>
</head>

<body>
	<div style="width: 800px; margin: 0 auto; margin-top: 10px">
		<table id="dt_table" class="table table-bordered">
			<thead>
				<tr>
					<th width="60px">요리명</th>
					<th>이미지</th>
					<th>내용</th>
					<th width="30px">평점</th>
					<th width="50px">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}">
					<tr height=100>
						<td align=center>${list.rname}</td>
						<td><a href="recipe.do?id=${list.rid}"> <img
								src="recipeThumnail.do?id=${list.rid}" width="150px" height="150px" />
						</a></td>
						<td >${list.rcontent}<div class="view_table">${list.ritem}</div></td>
						<td align=center >
							<c:if test="${list.score_avg eq 0}">0.0</c:if>
							<c:if test="${list.score_avg ne 0}">
								<fmt:formatNumber value="${list.score_avg}" pattern=".0"/>
							</c:if>
						</td>
						

						<td align=center >${list.rhit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<script>
	$(".view_table").hide();
</script>
</body>
</html>
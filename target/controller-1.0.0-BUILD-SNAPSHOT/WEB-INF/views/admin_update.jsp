<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요리 정보</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<style>
.btn-file {
  position: relative;
  overflow: hidden;
}
.btn-file input[type=file] {
  position: absolute;
  top: 0;
  right: 0;
  min-width: 100%;
  min-height: 100%;
  font-size: 100px;
  text-align: right;
  filter: alpha(opacity=0);
  opacity: 0;
  outline: none;
  background: white;
  cursor: inherit;
  display: block;
}
img{
width:400px;
height:400px;
}
</style>
<style>
.contents {
	white-space: pre-wrap;
	font-size: x-large;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<%-- <form action=admin_update.do>
	<table style="margin-left: auto; margin-right: auto;"
		class="ui table vertical devTableStyle">
		<colgroup>
			<col width="800px">
		</colgroup>
		<tr style="text-align: center;">
			<td><h2><input value="${recipe.rname}" /></h2></td>
		</tr>
		<tr style="text-align: center;">
			<td><input type="file"><img src="recipeImg.do?id=${recipe.rid}" width="450px"
				height="350px" /></input></td>
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
			<td><input value="${recipe.rcontent }"></input><br /></td>
		</tr>
		<tr height="200px" class="contents">
			<td><textarea>${recipe.ritem }</textarea><br />
		</tr>
		<tr class="contents">

			<td><textarea>${recipe.rrecipe }</textarea></td>
		</tr>

	</table>
	<input type="submit" value="수정">
	<input type="submit" value="삭제">
	<button><a href="admin.do" value="관리자 페이지" /></button> 
</form>
 --%>
<!-- 부트스트랩 영역 -->
<form action="admin_update.do" method="post" enctype="multipart/form-data">
  <fieldset>
    <legend align="top">레시피 수정</legend>
    <div class="form-group row">
      <div class="col-sm-10">
      	요리명
        <input type="text" class="form-control-plaintext" name="rname" border="1" value="${recipe.rname}">
      </div>
    </div>
    <div class="col-md-12 uploadfrm">
    	<p><span class="btn btn-primary btn-file">
    	요리사진 <input  type="file" name="rimage1"  onchange="readURL(this);">
        </span></p>
	</div>	    
        <div class="preview">
        	<img id="blah" src="recipeImg.do?id=${recipe.rid}" alt="" class="img-thumbnail border-0">
        </div>
    <%-- <div class="form-group">
      <label for="exampleInputFile">요리사진</label>
      <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp"><img src="recipeImg.do?id=${recipe.rid}" width="450px"
				height="350px" />      
    </div> --%>
    <div class="form-group">
      <label for="exampleTextarea">재료명</label>
      <textarea class="form-control" name="ritem" id="exampleTextarea" rows="5">${recipe.ritem }</textarea>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">설명</label>
      <textarea class="form-control" name="rcontent" id="exampleTextarea" rows="5">${recipe.rcontent }</textarea>
    </div>
     <div class="form-group">
      <label for="exampleTextarea">요리법</label>
      <textarea class="form-control" name="rrecipe" id="exampleTextarea" rows="5">${recipe.rrecipe }</textarea>
    </div>  
    <button type="submit" class="btn btn-primary">수정</button>
    <button type="button" class="btn btn-primary" onclick="location.href='admin_delete.do?id=${recipe.rid}'">삭제</button>
    <button type="button" class="btn btn-primary" onclick="location.href='admin.do'" >관리자페이지</button>
  </fieldset>
</form>
</body>
</html>
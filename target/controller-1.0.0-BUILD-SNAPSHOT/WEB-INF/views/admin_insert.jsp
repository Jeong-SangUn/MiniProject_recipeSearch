<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERT RECPIE</title>
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
</head>
<body>
<form action="admin_insert.do" method="post" enctype="multipart/form-data">
  <fieldset>
    <legend align="top">레시피 등록</legend>
    <div class="form-group row">
      <div class="col-sm-10">
      	요리명
        <input type="text" class="form-control-plaintext" name="rname" placeholder="요리명 입력">
      </div>
    </div>
    
    <div class="col-md-12 uploadfrm">
    	<p><span class="btn btn-primary btn-file">
    	요리사진 <input  type="file" name="rimage1" onchange="readURL(this);">
        </span></p>
	</div>	    
        <div class="preview">
        	<img id="blah" src="" alt="" class="img-thumbnail border-0">
        </div>

    <div class="form-group">
      <label for="exampleTextarea">재료명</label>
      <textarea class="form-control" name="ritem" rows="5"></textarea>
    </div>
    <div class="form-group">
      <label for="exampleTextarea">설명</label>
      <textarea class="form-control" name="rcontent" rows="3"></textarea>
    </div> 
    <div class="form-group">
      <label for="exampleTextarea">요리법</label>
      <textarea class="form-control" name="rrecipe" rows="5"></textarea>
    </div>     
    </fieldset>
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="button" class="btn btn-primary" onclick="location.href='admin.do'" >관리자페이지</button>
</form>
</body>
</html>
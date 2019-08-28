<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

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
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/full-width-pics.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap&subset=korean"
	rel="stylesheet">
<style>
#homeletter {
	font-family: 'Nanum Brush Script', cursive;
	font-size: 10.0em;
	text-align: center;
	vertical-align: middle;
	line-height: 600px;
}
</style>
</head>
<body>
<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/home.do">레시피를 부탁해</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>	
		      <div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/home.do">Home
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/rank.do">검색&인기순위</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/use.do">사용방법</a>
		          </li>
		          <li class="nav-item active" >
		            <a class="nav-link" href="${pageContext.request.contextPath}/admin_insert.do">레시피 등록</a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/admin.do">레시피 편집
		            </a>
		          </li>
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/mem/logout.do">로그아웃</a>
		          </li>
		        </ul>
		      </div>
	      </div>
  </nav>
<form action="admin_insert.do" method="post" enctype="multipart/form-data" style="background-image: url('${pageContext.request.contextPath}/resources/img/cookbackground1.jpg')">
  <fieldset>
    <div class="form-group row">
      <div class="col-sm-12">
      	<label for="exampleTextarea">요리명</label>
        <textarea class="form-control" name="rname" placeholder="요리명 입력" rows="1"></textarea>
      </div>
    </div>
    
    <div class="col-md-12 uploadfrm">
    	<p><span class="btn btn-primary btn-file">
    	<label for="exampleTextarea">요리사진</label>
    	<input  type="file" name="rimage1" onchange="readURL(this);">
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
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white"></p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>
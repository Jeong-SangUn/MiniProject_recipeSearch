<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- 1. bootstrap, 2, 사용자 저장 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<link href="${pageContext.request.contextPath}/resources/css/login.css"
	rel="stylesheet" />
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- 1. jquery, 2. bootstrap, 3. 사용자 저장 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script>
	var msg = "${msg}";
	if (msg == 'failure') {
		alert("회원정보가 틀립니다. 아이디와 비밀번호를 확인해주세요.");
	}
</script>


<body>

	<form action="${pageContext.request.contextPath}/mem/login.do"
		id="frd-foo" method="post">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-5 col-md-3">
					<div class="form-login">
						<h4>Welcome back.</h4>
						<input type="text" id="userName" name="m_id"
							class="form-control input-sm chat-input" placeholder="username" />
						<br /> <input type="password" id="userPassword" name="m_pw"
							class="form-control input-sm chat-input" placeholder="password" />
						<br /> <span class="group-btn">
							<button type="submit" class="btn btn-primary btn-md">
								login <i class="fa fa-sign-in"></i> <i class="fab fa-500px"></i>

							</button>

						</span>
					</div>
				</div>
			</div>

		</div>
	</form>

</body>
</html>
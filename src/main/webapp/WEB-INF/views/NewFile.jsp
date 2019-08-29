<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
// checkvalue 기능
function checkvalue() {
// a 텍스트 필드와 b 텍스트 필드 중 둘다 값이 있을 때
if(test.a.value && test.b.value) {
  // 두 필드의 값이 서로 다를 때
  if(test.a.value!=test.b.value){
   // status 필드에 일치하지 않는다는 문장 출력
   test.status.value = "비밀번호가 일치하지 않습니다.";
   // 그에 맞게 길이 수정
   test.status.style.color = 'red';
  // 두 필드의 값이 동일 할 때
  } else {
   // status 필드에 일치한다는 문장 출력
   test.status.value = "비밀번호가 일치합니다";
   // 역시 그에 맞게 길이 수정
   test.status.style.color = 'green';
  }
// a 텍스트 필드와 b 텍스트 필드 두중하나라도 값이 없을 때
} else {
  // 아무것도 입력이 안 되어 있으므로 비밀번호를 입력해 달라는 메세지를 status 필드에 출력 함
  test.status.value = "[ 비밀번호를 입력해 주세요 ]";
  // 그에 맞게 길이 수정
  test.status.style.width = 160;
}
}
</script>
<body>
	<form name="test">
		<input type="password" name="a" onblur=checkvalue();> 
		<input type="password" name="b" onblur=checkvalue();> 
		<input type="text" name="status"  readonly onfocus="this.blur();" value="[ 비밀번호를 입력해 주세요 ]">
	</form>
</body>
</html>
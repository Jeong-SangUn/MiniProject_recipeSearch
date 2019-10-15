

# 레시피를 부탁해



- 로그인 후 모든 기능 이용 가능

레시피를 부탁해는 로그인 후에 이용가능 합니다.



- 레시피 인기 순위 확인

각각의 레시피의 평점과 조회를 보고 원하는 레시피 선택이 가능합니다.



- 요리 이름으로 검색

자신이 먹고 싶은 요리 이름으로 검색이 가능합니다.



- 재료 검색 기능 제공

들어가는 재료 검색을 통해 레시피를 선택할 수 있습니다. 재료를 2개 이상 입력 시 재료이름 쓰고 띄어쓰기 순으로 입력해야합니다. (예: 소금 간장 돼지고기) 검색시 두음절 이상의 이름으로 검색해야 결과값이 정확합니다. (예: 파(x)-> 대파 / 쪽파(O) )



------------------------------



<h3>회원가입 페이지</h3>
![1571136563344](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571136563344.png)

- 아이디 : DB 테이블값 확인으로 중복체크

- 암호 : 자바스크립트를 통해 실시간 암호 일치 여부 확인

- 휴대번호, 생년월일 : 회원가입 버튼 클릭 후 해당 값의 특정 범위 불만족 시 경고창 (자바스크립트 이용)



<h3>레시피검색 페이지</h3>
![1571137237873](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571137237873.png)

- 재료명 검색 : 해당 재료를 사용한 요리 레시피 검색

  

![1571137209129](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571137209129.png)

- 요리명 검색 : 해당 이름으로 된 요리 레시피 검색



<h3>레시피 페이지</h3>
![1571137687307](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571137687307.png)

- 점수 평가 : 하나의 아이디로 각 요리레시피마다 한번씩의 평가만 가능하다. 

  (DB 사용: 아이디 기본키, 레시피 아이디 평가 여부 확인)

- 조회수 증가 : 레시피 페이지에 들어오면 해당 레시피의 조회수가 1증가한다. 하나의 아이디로 각 요리레시피마다 한번만 증가한다.

  (점수 평가와 동일한 방법)



![1571138196488](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571138196488.png)

- 레시피 내용 : DB에서 레시피 내용을 가져온다. 가져 올 때 사용자가 보기 좋게 controller 부분에서 데이터 정제 후 view로 내용을 넘긴다.

  

![1571138053096](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571138053096.png)

- 댓글 등록 : 원하는 내용을 작성 후 댓글 등록 버튼을 누르면 댓글이 등록 된다.
- 댓글 삭제 : 자신이 입력한 댓글을 삭제할 수 있다. 다른 아이디는 삭제버튼 생성되지 않는다.



<h3>마이 페이지</h3>
![1571138404635](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571138404635.png)

- 정보 수정 : 자신이 회원가입 시 작성한 내용들을 수정할 수 있다.



<h3>회원탈퇴 페이지</h3>
![1571138464396](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571138464396.png)

- 회원 탈퇴 : 탈퇴 안내를 읽고 체크 박스 체크 후 확인 버튼을 누르면 아래의 비밀번호 입력란이 뜬다. 자신의 비밀번호를 맞게 입력하면 회원탈퇴가 완료된다.



<h3>관리자 계정 접속</h3>
![1571139061513](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571139061513.png)

- 관리자 계정으로 접속하면 상단의 배너 내용들이 바뀐다.
- 아래 그림은 일반 사용자 계정 접속 시 배너 내용이다.

![1571139099399](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571139099399.png)



<h3>레시피 등록 페이지</h3>
![1571139247397](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571139247397.png)

- 요리 사진 : 요리 사진은 자신의 컴퓨터에 저장된 이미지 파일을 가져온다. 가지고 오게 되면 해당 이미지가 위의 사진처럼 바로 보여지게 된다. (자바스크립트를 이용 readURL 함수를 만들어 이미지를 불러 오면 해당 이미지를 불러들여서 페이지에 보이게 함.)
- 등록 : 나머지 내용을 입력 후에 등록 버튼을 누르면 레시피가 등록된다. DB에 새로운 레시피 추가
- 관리자페이지 : 레시피 편집 페이지로 이동한다.



<h3>레시피 편집 페이지</h3>
![1571139446615](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571139446615.png)



- DB에 등록된 레시피를 불러온다. 
- 편집 : 해당 레시피 내용을 수정,삭제할 수 있는 페이지로 이동



![1571139536233](https://github.com/Jeong-SangUn/MiniProject_recipeSearch/blob/master/README_img/1571139536233.png)

- 수정 : 내용을 바꾼 후 버튼을 누르면 수정된 내용으로 DB가 수정된다.
- 삭제 : 현재 레시피가 삭제된다. 레시피 아이디 기본키를 이용하여 DB에서 삭제된다.
- 관리자페이지 : 레시피 편집 페이지로 이동한다.
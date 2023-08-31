<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 변경</title>
<style>
body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f2f2f2;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

.container {
  max-width: 500px;
  background-color: white;
  border: 1px solid #ccc;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0px 0px 5px 0px #aaa;
}

h2 {
  text-align: center;
  margin-bottom: 20px;
}

label {
  font-weight: bold;
}

input {
  width: 100%;
  padding: 10px;
  margin-bottom: 15px;
  border: 1px solid #ccc;
  border-radius: 3px;
  font-size: 16px;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 3px;
  font-size: 16px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}
</style>

<script type="text/javascript">
$(function() {   
	   $('#currentPassword').focus();
	   
	   $('#btnCheck').click(function() {
	      if ($('#currentPassword').val().length < 1) {
	         alert('비밀번호를 입력하세요.');
	         $('#currentPassword').focus();
	         return false;
	      } else {
	         var currentPassword = $('#currentPassword').val();
	         if (currentPassword !== "올바른비밀번호") {
	            alert('비밀번호가 올바르지 않습니다.');
	            $('#currentPassword').val(''); 
	            $('#currentPassword').focus(); 
	            return false;
	         }else{
	        	 window.location.href = '/mbti/main/mypage/memberEditPwd';
	         }
	      }
	   });
	});
	</script>

</head>
<body>
  <div class="container">
    <h2>비밀번호 확인</h2>
    <form action="/mbti/main/mypage/memberEditPwd" method="post">
      <label for="currentPassword">비밀번호</label>
      <input type="password" id="currentPassword" name="currentPassword" placeholder="비밀번호를 입력해주세요" required>
   
      <button class="submit" id="btnCheck" >확인</button>
    </form>
  </div>
</body>
</html>
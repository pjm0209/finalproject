<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    

<style>

.container {
  max-width: 500px;
  margin-top: 200px;
  margin-bottom: 100px;
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
	         $('#alertModalBody').html("비밀번호를 입력하세요.");
			 $('#alertModal').modal('show');
	         $('#currentPassword').focus();
	         return false;
	         
	      }
	   });
	});
</script>

<div class="container">
  <h2>비밀번호 확인</h2>
  <form name="form-memberEditPwd" method="post" action="<c:url value='/main/mypage/memberEditPwd'/>">
    <label for="currentPassword">비밀번호</label>
    <input type="password" id="currentPassword" name="currentPassword" class="password" placeholder="비밀번호를 입력해주세요" required>
 
    <button type="submit" id="btnCheck" >확인</button>
  </form>
</div>
  
<%@include file="../inc/bottom.jsp" %>

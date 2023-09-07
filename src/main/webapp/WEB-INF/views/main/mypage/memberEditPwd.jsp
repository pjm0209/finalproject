<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    

<style>
.memberEditPwd {
  text-align: center;
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 800px; 
  height: 500px;
  padding: 40px;
  border: 2px solid #3498db;
  background-color: #f9f9f9;
  box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
  margin-bottom: 300px;
}

h2 {
  text-align: center;	
  margin-bottom: 20px;
}

label {
  font-weight: bold;
  display: block;
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
  transition: background-color 0.3s;
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
<section class="memberEditPwd">
<div class="container">
  <h2>비밀번호 확인</h2>
  <form name="form-memberEditPwd" method="post" action="<c:url value='/main/mypage/memberEditPwd'/>">
    <label for="currentPassword">비밀번호</label>
    <input type="password" id="currentPassword" name="currentPassword" class="password" placeholder="비밀번호를 입력해주세요" required>
 
    <button type="submit" id="btnCheck" >확인</button>
  </form>
</div>
</section>

<%@include file="../inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    

<style>
.container {
   max-width: 1000px;
   max-height: 800px;
   margin-top: 100px;
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
   background-color: #eb5d1e;
   color: white;
   border: none;
   border-radius: 3px;
   font-size: 16px;
   cursor: pointer;
   margin-bottom: 20px;
}

button:hover {
 	background-color: #0056b3;
}


.bottom-title{
	color: red;
	font-size: 20px;
	font-weight: bold;
}


</style>

<script type="text/javascript">
	$(function(){
		$('#changePasswordForm').submit(function(event){
			var currentPassword = $('#currentPassword').val();
			if(currentPassword === ''){
				$('errorText').text('현재 비밀번호를 입력해주세요');
				event.preventDefault();
			}else{
				$('#errorText').text('');
			}	
		});
	});
</script>

<section>
  <div class="container">
    <h2>비밀번호 변경</h2>
    <form name="form-newPwd" method="post" action="<c:url value='/main/mypage/newPwd'/>">
    <div class="mypage-row">
      <label>현재 비밀번호</label>
      <input type="password" name="pwd" placeholder="현재 비밀번호를 입력해주세요" maxlength="30" required>
    </div> 
    
    <div class="mypage-row"> 
      <label>새 비밀번호</label>
      <input type="password" name="newPwd" placeholder="새로 사용하실 비밀번호를 입력해주세요" maxlength="30" required>
    </div> 
     
    <div class="mypage-row">  
      <label>새 비밀번호 확인</label>
      <input type="password" name="confirmPwd" placeholder="새로 사용하실 비밀번호를 재입력해주세요" maxlength="30" required>
    </div>
     
      <button type="submit">비밀번호 변경</button>
      
      <div class="bottom">
      	<p class="bottom-title">* 비밀번호 변경 안내</p>
      	<p>쉬운 비밀번호나 자주 쓰는 사이트의 비밀번호가 같은 경우, 도용되기 쉬우므로 고객님의 정보보호를 위해 비밀번호는 정기적으로 변경하여 주시기 바랍니다.</p>
      	<p>영문, 숫자, 특수문자 2개 이상 조합 10~20자로 설정해야 합니다. 3자 이상 중복되는 영문, 숫자, 특수문자는 사용할 수 없으며, 공백도 사용할 수 없습니다.</p>
		<p>아이디와 주민등록번호, 생일, 전화번호 등 개인정보와 관련된 숫자, 연속된 숫자, 반복된 문자 등 다른 사람이 쉽게 알아 낼 수 있는 비밀번호는 개인정보 유출의 위험이 높으므로 사용을 자제해 주시기 바랍니다.</p>
  	  </div>
    </form>
  </div>
</section>  
<%@include file="../inc/bottom.jsp" %>
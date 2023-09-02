<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    

<style>
.container {
    margin-top: 100px;
    margin-left: 400px;
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
  $(function () {
    $('#changePasswordForm').submit(function (event) {
      event.preventDefault(); // 폼을 일반적으로 제출하는 것을 방지합니다.

      // 폼 데이터를 가져옵니다.
      var currentPassword = $('#currentPassword').val();
      var newPwd = $('#newPwd').val();
      var confirmPwd = $('#confirmPwd').val();

      // 클라이언트 측 유효성 검사
      if (currentPassword === '' || newPwd === '' || confirmPwd === '') {
        alert('모든 필드를 입력하세요.');
        return; // 유효성 검사 실패 시 폼 제출을 중지합니다.
      }

      // 새 비밀번호와 새 비밀번호 확인이 일치하는지 확인합니다.
      if (newPwd !== confirmPwd) {
        alert('새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.');
        return; // 유효성 검사 실패 시 폼 제출을 중지합니다.
      }

      // 서버로 보낼 객체를 생성합니다.
      var dataToSend = {
        currentPassword: currentPassword,
        newPwd: newPwd,
        confirmPwd: confirmPwd,
      };

      // 서버로 AJAX 요청을 보냅니다.
      $.ajax({
        type: 'POST', // 적절한 HTTP 메서드를 사용합니다 (이 경우 POST).
        url: '/main/mypage/newPwd', // 실제 서버 엔드포인트로 대체합니다.
        data: dataToSend,
        success: function (response) {
          // 서버에서 성공적인 응답을 처리합니다.
          if (response.success) {
            alert('비밀번호가 성공적으로 변경되었습니다.');
            // 사용자를 다른 페이지로 리디렉션하거나 여기서 다른 작업을 수행할 수도 있습니다.
          } else {
            alert('비밀번호 변경에 실패했습니다. 입력 내용을 확인하세요.');
          }
        },
        error: function () {
          // AJAX 요청 중에 발생하는 오류를 처리합니다.
          alert('비밀번호 변경 중에 오류가 발생했습니다.');
        },
      });
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
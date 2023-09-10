<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 재설정 페이지</title>
<style>
body {
    margin-top: 50px;
    padding: 0;
    background-color: white;
}

.wrapper-findPwdResult {
    text-align: center;
    padding: 50px;
}

.wrapper-findPwdResult h1 {
    font-size: 24px;
    margin-bottom: 20px;
}

.wrapper-findPwdResult p {
    font-size: 16px;
    margin-bottom: 20px;
}

button {	
    padding: 15px 120px;
    background-color: #ff7f00;
    border: none;
    color: #fff;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {   
    $('#btnLogin').click(function(){
        var confirmed = confirm("로그인 화면으로 돌아가시겠습니까?");
        if (confirmed) {
        	window.location.href = '<c:url value="/main/member/memberLogin"/>'; 
        }
    });
});
</script>

</head>
<body>
<div class="wrapper-findPwdResult">
	<img src="../../images/이메일전송.png">
	<h1>비밀번호 재설정 메일 발송 완료</h1>
		<p>비밀번호 재설정 링크가 포함된 메일이 발송되었습니다.</p>
		<p>메일함을 확인해주세요.</p>
	
		<button type="button" id="btnLogin">로그인화면으로</button>
</div>	
</body>
</html>

    <button type="button" style="display: none" id="confirmModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmModal"></button>
    
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="confirmModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="confirmModalBody"></p>
	      </div>
	      <div class="modal-footer">
	      	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn bg-orange-primary" id="confirmOk" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
<%@ include file="../inc/bottom.jsp" %>    
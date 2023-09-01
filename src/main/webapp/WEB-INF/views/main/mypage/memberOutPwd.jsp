<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<style>
.mypage{	
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 800px; 
	height: 500px;
	padding: 40px;
	border: 2px solid #3498db;
	background-color: #f9f9f9;
	box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
}

.mypage-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 30px;
    margin-bottom: 20px;
}

.mypage-table th,
.mypage-table td {
    padding: 20px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    text-align: left;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
}

.mypage-table th {
    background-color: #f3f3f3;
    border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;
}

.span-content {
    text-align: left;
    font-size: 17px;
    line-height: 2.0;
    display: block;
    margin-top: 15px;
    font-weight: bold;
    color: #686868;
    margin-bottom: 50px;
}

.align_center {
    margin-top: 20px;
}

#btnCheck {
    background-color: orange; 
    color: white; 
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#btnCheck:hover {
    background-color: darkgreen; 
}

#btnCancel {
    background-color: red;
    color: white; 
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#btnCancel:hover {
    background-color: darkred; 
}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>     
<script type="text/javascript">
$(function(){   
	   $('#pwd').focus();
	   
	      $('#btnCheck').click(function(){
	         if($('#pwd').val().length<1){
	            $('#alertModalBody').html("비밀번호를 입력하세요.");
	            $('#alertModal').modal('show');
	            $('#pwd').focus();
	            return false;
	         }
	         
	         if(!confirm("회원탈퇴하시겠습니까?")){
	        	 
	            return false;   
	         }
	         
	      });	
		
    $('#show-hide-password').click(function() {
        var passwordInput = $(this).prev('.password');
        var passwordType = passwordInput.attr('type');
        
        if (passwordType === 'password') {
            passwordInput.attr('type', 'text');
            $(this).removeClass('bx-hide').addClass('bx-show');
        } else {
            passwordInput.attr('type', 'password');
            $(this).removeClass('bx-show').addClass('bx-hide');
        }
    });
    
    $('#btnCancel').click(function() {
    	window.location.href = '/mbti/main/mypage/memberOut';
    });
}); 	    	
</script> 

<article class="mypage">
    <h2>비밀번호 확인</h2>
    <form name="form-memberOutPwd" method="post" action="<c:url value='/main/mypage/memberOutPwd'/>">
        <table class="mypage-table">
            <tr>
                <th>회원ID</th>
                <td>${sessionScope.userid}</td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td><input type="password" name="pwd" id="pwd" class="password" placeholder=" 비밀번호를 입력하세요 ">
                	<i class='bx bx-hide eye-icon' id="show-hide-password"></i>
                </td>
            </tr>
        </table>
        
        <div class="span-content">
            <span>회원님의 소중한 개인정보를 보호와 본인 확인을 하기위해 비밀번호를 다시 한번 확인합니다.</span><br>
            <span>비밀번호 입력 시 타인에게 노출되지 않도록 주의해 주시기 바랍니다.</span><br>
            <span>본인 확인 후 최종 회원탈퇴가 가능합니다.</span>        
        </div>
    
        <div class="align_center">
            <input type="submit" id="btnCheck" value="확인">
            <input type="reset" id="btnCancel" value="취소">
        </div>						
    </form>
</article>
<%@include file="../inc/bottom.jsp" %>
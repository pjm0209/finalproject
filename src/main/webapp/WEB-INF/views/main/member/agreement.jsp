<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp" %>
<style>
.wrapper-agreement {
    margin-top: 50px;
    display: flex;
    flex-direction: column;
    align-items: center;
}

iframe{
	border: 1px solid #ccc;
}

h3{
	margin-top: 100px;
	margin-botton:50px;
	align-items: left;
}

label{
	margin-top: 10px;
}

span{
	color:red;
}

.separator1 {
    width: 40%;
    height: 3px;
    background-color: #ccc;
    margin: 10px 0;    
}

.separator2 {
    width: 40%;
    height: 1px;
    background-color: #ccc;
    margin: 10px 0;    
}

</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>    
<script type="text/javascript">
$(function() {
    $('#agree_allCheck').click(function() {
        var isChecked = $(this).prop('checked');
        $('#agree1_check, #agree2_check').prop('checked', isChecked);
    });
    
    $('#btnChk').click(function() {
        if (!$('#agree1_check').is(':checked')) {
            alert("이용약관 동의 약관에 동의를 해야합니다.");
            $('#agree1_check').focus();
            event.preventDefault();
        } else if (!$('#agree2_check').is(':checked')) {
            alert("개인정보 수집 및 이용 동의 약관에 동의를 해야합니다.");
            $('#agree2_check').focus();
            event.preventDefault();
        } else {
            window.location.href = '<c:url value="/main/member/memberRegister"/>';
        }
    });
        
    $('#btnCac').click(function(){
        var confirmed = confirm("로그인 화면으로 돌아가시겠습니까?");
        if (confirmed) {
            window.location.href = '<c:url value="/main/member/memberLogin"/>';
        }
    });  	   
 });			
</script>

<div class="wrapper-agreement">
	<h3>step1: 약관동의</h3>
	
	<div class="separator1"></div>

	<label>회원가입 약관에 모두 동의합니다
		<input type="checkbox" id="agree_allCheck">
	</label>
	
	<div class="separator2"></div>

	<label>이용약관 동의
		<span>(필수)</span>
			<input type="checkbox" id="agree1_check">
	</label>
	<iframe src="<c:url value='/inc2/provision.html'/>" width="700px" height="400px"></iframe>
	<br>

	<label>개인정보 수집 및 이용 동의
		<span>(필수)</span>
			<input type="checkbox" id="agree2_check">
	</label>
	<iframe src="<c:url value='/inc2/provision2.html'/>" width="700px" height="400px"></iframe>

<div class="check">
	<form name="frmAgree" method="post" action="<c:url value='/member/memberRegister'/>">
		<fieldset>
		    <legend style="visibility:hidden;">회원 약관</legend> 

		      <div style="text-align:center">
				<input type="button" id="btnChk" value="확인">			
				<input type="button" id="btnCac" value="취소">
		      </div>
		</fieldset>
	</form>
	</div>
</div>	
<%@ include file="../inc/bottom.jsp" %>
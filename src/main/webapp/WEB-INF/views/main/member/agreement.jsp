<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp" %>
<style>
iframe{
	border: 1px solid #ccc;
}

.h3{
	margin-top: 100px;
	margin-botton:50px;
	align-items: left;
}

.content {
    margin-top: 150px;
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>    
<script type="text/javascript">
	$(function() {
	    $('#btnChk').click(function() {
	       if(!$('#chkAgree').is(':checked')) {
	          alert("약관에 동의를 해야합니다.");
	          $('#chkAgree').focus();
	          event.preventDefault();
	       }else{
	    	   window.location.href = '<c:url value="/main/member/memberRegister"/>';
	       }         
	    });	
	    
	    $('#btnCac').click(function(){
	    	window.location.href = '<c:url value="/main/login"/>';
	    });	    	   
	 });		
</script>

<div class="content">
<h3>step1: 약관동의</h3>
<iframe src="<c:url value='/inc2/provision.html'/>" width="700px" height="400px"></iframe>
<br>
<div class="check">
	<form name="frmAgree" method="post" action="<c:url value='/member/memberRegister'/>">
		<fieldset>
		    <legend style="visibility:hidden;">회원 약관</legend> 
		      <div style="text-align:right">			
				<input type="checkbox" name="chkAgree" id="chkAgree">
				<label for="chkAgree">약관에 동의합니다.</label><br><br>
		      </div>
		      <div style="text-align:center">
				<input type="button" id="btnChk" value="확인">			
				<input type="button" id="btnCac" value="취소">
		      </div>
		</fieldset>
	</form>
	</div>
</div>	
<%@ include file="../inc/bottom.jsp" %>
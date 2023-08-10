<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>


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

<h3>step1: 약관동의</h3>
<iframe src="<c:url value='/inc2/provision.html'/>" width="700px" height="300px"></iframe>
<br>
<div style="width:700px">
	<form name="frmAgree" method="post" action="<c:url value='/member/memberRegister'/>">
		<fieldset>
		    <legend style="visibility:hidden;">회원 약관</legend> 
		      <div style="text-align:right">			
				<input type="checkbox" name="chkAgree" id="chkAgree">
				<label for="chkAgree">약관에 동의합니다.</label>
		      </div>
		      <div style="text-align:center">
				<input type="button" id="btnChk" value="확인">			
				<input type="button" id="btnCac" value="취소">
		      </div>
		</fieldset>
	</form>
</div>	
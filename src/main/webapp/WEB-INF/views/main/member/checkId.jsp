<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사 페이지</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btUse').click(function(){
			$(opener.document).find("#userid").val("${param.userid}");			
			self.close();
		});
		
		$('form[name=frmId]').submit(function(){
			if($('#userid').val().length<1){
				$('.errorMessage').show();
				event.preventDefault();
			}
		});		
	});
</script>

</head>
<body>
<h2>아이디 중복 검사</h2><br>
<form name="frmId" method="post" action="<c:url value='/main/member/checkId'/>">

	<input type="text" name="userid" id="userid" title="아이디입력" 
		value="${param.userid}" >	
	<input type="submit"  id="submit" value="아이디 확인">
	<span class="errorMessage" style="display: none">아이디를 입력하세요</span>
	
	<c:if test="${result==EXIST_ID }">
		<p>이미 등록된 아이디입니다. 다른 아이디를 입력하세요</p>
	</c:if>
	<c:if test="${result==NONE_EXIST_ID }">
		<input type="button" value="사용하기" id="btUse">
		<p>사용가능한 아이디입니다. [사용하기]버튼을 클릭하세요</p>
	</c:if>
	
</form>

</body>
</html>
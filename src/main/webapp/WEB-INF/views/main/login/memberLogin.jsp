<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<article class="simpleForm">
	<form name="frmLogin" method="post"	action="<c:url value='/login/login'/>">
		<fieldset>
			<legend>로그인</legend>
			<div>
				<label for="userid" class="label">아이디</label>
				<input type="text" name="userid" id="userid" 
					value="${cookie.ck_userid.value }">
			</div>
			<div>
				<label for="pwd" class="label">비밀번호</label>
				<input type="password" name="pwd" id="pwd">
			</div>
			<div class="align_center">
				<input type="submit" id="lg_submit" value="로그인">
				<input type="checkbox" name="chkSave" id="chkSave"
					<c:if test="${!empty cookie.ck_userid }">
						checked="checked"
					</c:if>
				>
				<label for="chkSave">아이디 저장하기</label>
			</div>
		</fieldset>
	</form>
</article>
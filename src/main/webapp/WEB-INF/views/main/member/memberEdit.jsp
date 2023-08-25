<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
h1{
	margin-top:100px;
}

</style>
</head>
<body>
<h1>나의정보</h1>
	<form class="form-register" name="memberRegister" method="post" action="<c:url value='/main/member/memberRegister'/>">		
		<label>이름</label>
		<div class="div-register">		
	    	<input type="text" class="name" id="memberName" name="name" placeholder="이름을 입력하세요.">
	    	<div class="error" id="nameError"></div>	    	
		</div>
		
		<label>아이디</label>
		<div class="div-register">		
			<input type="text" class="id" id="memberId" name="userid" placeholder="아이디 입력(6~20자)">&nbsp;
			<button id="btnChkId" value="중복 확인" type="button">중복 확인</button>			
			<span class="error" id="idError"></span>
		</div>
		
		<label>비밀번호</label>
		<div class="div-register">
			<input type="password" class="pwd" id="memberPwd" name="pwd" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8~20자)">
			<div class="error" id="pwdError"></div>
		</div>
		
		<label>비밀번호 확인</label>
		<div class="div-register">
			<input type="password" class="pwdCheck" id="memberpwdCheck" name="registerPwdCheck" placeholder="비밀번호 재입력">
			<div class="error" id="pwdCheckError"></div>
		</div><br>
		
		<label>이메일</label>
		<div class="div-register">
			<input type="text" class="email" id="memberEmail1" name="email" placeholder="이메일 주소">&nbsp;@&nbsp;
				<select name="email2" id="memberEmail2">
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="daum.com">daum.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="google.com">google.com</option>
					<option value="etc">직접입력</option>
				</select>&nbsp;
			<input type="text" id="memberEmail3" style="visibility:hidden;">
			<div class="error" id="emailError"></div>
		</div>
		
		<label>전화번호</label>
		<div class="div-register">
			<input type="text" class="tel" id="memberTel" name="hp" placeholder="휴대폰번호 입력 ('-')제외 11자리 입력">
			<div class="error" id="telError"></div>
		</div>		
					
		<label>우편번호</label>			
		<div class="div-register">
			<input type="text" class="postalCode" id="memberPostalCode" name="zipcode" placeholder="우편번호를 검색하세요">&nbsp;	
			<input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode()">	
		</div>
		
		<label>주소</label>
		<div class="div-register">
			<input type="text" class="address" id="memberAddress" name="address" placeholder="주소를 입력하세요">
		</div>
		
		<label>상세주소</label>
		<div class="div-register">
			<input type="text" class="addressDetail" id="memberAddressDetail" name="addressDetail" placeholder="상세주소를 입력하세요">
		</div>		
						
        <div class="signUp"><br>
            <button class="submit" id="signUpButton" >회원가입</button>
        </div>					
	</form>	
</body>
</html>	
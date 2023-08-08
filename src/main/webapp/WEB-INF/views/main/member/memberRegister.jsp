<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<style>
*{
	margin: 0px;
	box-sizing: border-box;
	font-size:15px;
}

h1 {
	font-size: 30px;
    text-align: center;
    font-weight: bold;
}

.wrapper {
    padding: 10px;
}

html {
    width: 100%;
    display: flex;
    justify-content: center;
    padding-top: 20px;
    padding-bottom: 20px;
}

body {
    width: 30%;
    border: 1px solid black;
}

input{
	font-size: 15px;
    border: 1px solid black;
    border-radius: 3px;
    line-height: 35px;
    
    padding-left: 10px;
    padding-right: 10px;
}

div {
    padding-top: 3px;
    padding-bottom: 8px;
}

.name input{
	width:30%;
}

.userid input{
	width:30%;
	
}

.password input{
	width:55%;
}

.passwordCheck input{
	width:55%;
}

.tel input{
	width:55%;
}

.email input{
	width:30%;
}

#email2 {
  width: 30%;
  height: 40px;
  font-size: 15px; 
}

.address input{
	width:55%;
}

.signUp button{
  width: 200px;
  height: 50px;
}

.error{
    font-size: 1px;
    height: 20px;
    color:red;
    font-weight: 700;
}
</style>

<script type="text/javascript">
	$(function(){
		$('#signUpButton').click(function(){
			if($('#name').val().length < 1){
				alert("이름을 입력하세요");
				$('#name').focus();				
				return false;				
			}
			
			if (!validate_userid($('#userid').val())) {
				alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
				$('#userid').focus();
				return false;
			}
			
			if($('#btnChkId').val()!='Y'){
		         alert('아이디 중복확인을 해주세요.');
		         $('#btnChkId').focus();
		         return false;
		    }
			
			if ($('#password').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#password').focus();
				return false;
			}
			
			if ($('#password').val() != $('#pwd2').val()) {
				alert("비밀번호가 일치하지 않습니다.확인하세요");
				$("#password").focus();
				return false;
			}
			
			if (!validate_hp($("#tel").val().length < 1)					
				alert("전화번호는 숫자만 가능합니다");
				$("#tel").focus();
				return false;
			}					
		});		
	});
}
</script>

</head>
<body>
	<h1>회원가입</h1>
<form name="frm1" method="post" action="<c:url value='/main/member/register'/>">
	<div class="member_register">
		<span>이름 *</span>
		<div class="name">
			<input type="text" id="name" placeholder="이름을 입력하세요">					
			<div class="error" id="nameError"></div>
		</div>	
		<span>아이디 *</span>
		<div class="userid">
			<input type="text" id="userid" placeholder="아이디 입력(6~20자)">
			<button id="btnChkId" value="중복 확인">중복 확인</button>			
			<div class="error" id="useridError"></div>
		</div>
		
		<span>비밀번호 *</span>
		<div class="password">
			<input type="password" id="password1" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8~20자)">
			<div class="error" id="pwdError"></div>
		</div>
		
		<span>비밀번호 확인 *</span>
		<div class="passwordCheck">
			<input type="password" id="password2" placeholder="비밀번호 재입력">
			<div class="error" id="passwordError"></div>
		</div>
		
		<span>이메일 *</span>
		<div class="email">
			<input type="text" id="email1" placeholder="이메일 주소">&nbsp;@
				<select name="email2" id="email2">
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="daum.com">daum.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="google.com">google.com</option>
					<option value="etc">직접입력</option>			
				</select>			
			<input type="text" id="email3" style="visibility:hidden;">
			<div class="error" id="emailError"></div>
		</div>
		
		<span>전화번호 *</span>
		<div class="tel">
			<input type="text" id="tel" placeholder="휴대폰번호 입력('-'제외 11자리 입력)">
			<div class="error" id="emailError"></div>
		</div>		
					
		<span>주소 *</span>				
		<div class="address" id="address">
			<input type="text" id="address" placeholder="주소를 입력해주세요">
			<button id="btnAddress" value="우편번호 검색">우편번호 검색</button>		
			<input type="text" id="address" placeholder="상세주소">
		</div>		
		
        <div class="signUp">
            <button id="signUpButton"">가입하기</button>
        </div>				
	</div>
</form>
</body>
</html>
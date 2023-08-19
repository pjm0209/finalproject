<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<title>관리자 추가</title>
<style>
</style>


<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">

function validate_userid(uid) {
	console.log(uid);
	var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	return pattern.test(uid);
}

function validate_hp(ph) {
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(ph); 
}

	$(function(){
		$('#adminSignUpButton').click(function(){
			if (!validate_userid($('#userid').val())) {
				alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
				$('#userid').focus();
				return false;
			}
			
			$.ajax({
				url:"<c:url value='/main/member/checkId'/>",
				type: "get",
				data: "userid=" + $('#userid').val(),
				dataType: 'json',
				success:function(res){
					console.log(res);
					if(res==1){
						$('#useridError').html("이미 존재하는 아이디입니다.");						
					} else if(res == 2) {
						$('#useridError').html("사용가능한 아이디입니다.");
						$('#useridError').css('color', 'blue');
						$('#btnChkId').val('Y'); 
					}
				},
				error:function(xhr, status, error){
					alert(status+" : " + error);
				}						
			});
		});
		
		$('#password2').keyup(function() {
		    var password1 = $('#password1').val();
		    var password2 = $(this).val();
		    var passwordError = $('#passwordError');

		    if (password1 !== password2) {
		        passwordError.html("비밀번호가 일치하지 않습니다.");
		    } else {
		        passwordError.html("비밀번호가 일치합니다");
		    }
		});		
					
		$('#signUpButton').click(function(){		
	        if ($('#userid').val().length < 1) {
	            alert("아이디를 입력하세요");
	            $('#userid').focus();
	            return false;
	        }
			
			if($('#btnChkId').val()!='Y'){
		         alert('아이디 중복확인을 해주세요.');
		         $('#btnChkId').focus();
		         return false;
		    }
			
			if ($('#password1').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#password1').focus();
				return false;
			}
			
	        var password1 = $("#password1").val();
	        if (password1.length < 8 || password1.length > 20 ||
	            !/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]+$/.test(password1)) {
	            $('#passwordError').html("비밀번호는 문자, 숫자, 특수문자를 포함한 8~20자여야 합니다");
	            $("#password1").focus();
	            return false;
	        } else {
	            $('#passwordError').html("");
	        }
	        
	        if ($('#email1').val().length < 1) {
	            alert("이메일을 입력하세요");
	            $('#email1').focus();
	            return false;
	        }
	        	        			     
	        var telNumber = $("#tel").val();
	        if (!validate_hp(telNumber)) {
	            alert("전화번호는 숫자만 가능합니다");
	            $("#tel").focus();
	            return false;
	        }
	        
	        if (telNumber.length !== 11) {
	            alert("전화번호는 11자리로 입력해주세요");
	            $("#tel").focus();
	            return false;
	        }
		});	
		
		$(function(){
		    $('#email2').change(function() {
		        if ($(this).val() === 'etc') {
		            $('#email3').css('visibility', 'visible');
		        } else {
		            $('#email3').css('visibility', 'hidden');
		        }
		    });
		});	
	});
</script>

<link href="signup.css" rel="stylesheet" />
<script src="signup.js"></script>
</head>
<body>
<form name="frmManagerAdditional" method="post" action="<c:url value='/admin/manager/managerAdditional'/>">
	<h1>관리자 추가</h1>
	<span>아이디 *</span>
	<div class="userid">		
		<input type="text" id="userid" placeholder="아이디 입력(6~20자)">
		<button id="btnChkId" value="중복 확인" type="button">중복 확인</button>			
		<span class="error" id="useridError" style=font-size:15px;>*중복확인을 해주세요</span>
	</div>
	
	<span>비밀번호 *</span>
	<div class="password">
		<input type="password" id="password1" placeholder="비밀번호 입력(문자,숫자,특수문자 포함 8~20자)">
		<div class="error" id="pwdError"></div>
	</div>
	
	<span>비밀번호 확인 *</span>
	<div class="passwordCheck">
		<input type="password" id="password2" placeholder="비밀번호 재입력">
		<div class="error" id="passwordError" style=font-size:15px;></div>
	</div><br>
	
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
		<input type="text" id="tel" placeholder="휴대폰번호 입력 ('-') 제외 11자리 입력)">
		<div class="error" id="emailError"></div>
	</div>		
					
    <div class="signUp"><br>
        <input type="submit" name="signUp" id="adminSignUpButton" value="Sign Up">
    </div>	
</form>				
</body>
</html>
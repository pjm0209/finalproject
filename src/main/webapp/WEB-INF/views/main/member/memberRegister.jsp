<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
}

.form-memberRegister {
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-memberRegister h1 {
  text-align: center;
  font-size: 30px;
  margin-bottom: 20px;
}

.form-register label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.div-register {
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.div-register input[type="text"] {
  width: 80%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.div-register #memberId{
  width: 60%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.div-register #btnChkId {
    background-color: #eb5d1e;
    color: white;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    padding: 10px 15px;
}

.div-register input[type="password"] {
  width: 80%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

#memberEmail1{
	width:30%;
}

#memberEmail2{
	width:100px;
	height:35px;
}

#memberEmail3{
	width:150px;
}

.error {
  color: red;
  font-size: 12px;
  margin-top: 5px;
}

.select-container {
  display: flex;
  align-items: center;
}

.select-container select {
  flex: 1;
  margin-right: 10px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.div-register #btnZipcode{
   background-color: #eb5d1e;
   color: white;
   border: none;
   border-radius: 3px;
   cursor: pointer;
   padding: 10px 15px;
}

.div-register input[type="Button"] {
  padding: 10px 20px;
  background-color: #eb5d1e;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

#signUpButton {
  display: block;
  width: 50%;
  height: 50px;
  padding: 10px;
  margin: 0 auto;
  background-color: #eb5d1e;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}
</style>

<script type="text/javascript" src="<c:url value ='/js/member.js"'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		$('#btnChkId').click(function(){
			//아이디 입력
	        if ($('#memberId').val().length < 1) {
	            alert("먼저 아이디를 입력하세요");
	            $('#memberId').focus();
	            return false;
	        }
						
			//아이디 조건
			if (!validate_userid($('#userid').val())) {
				alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
				$('#memberId').focus();
				return false;
			}
			
			$.ajax({
				url:"<c:url value='/main/member/checkId'/>",
				type: "get",
				data: "userid=" + $('#memberId').val(),
				dataType: 'json',
				success:function(res){
					console.log(res);
					if(res==1){
						$('#idError').html("이미 존재하는 아이디입니다.");
						$('#idError').css('color', 'red'); 
					} else if(res == 2) {
						$('#idError').html("사용가능한 아이디입니다.");
						$('#idError').css('color', 'blue');
						$('#btnChkId').val('Y'); 
					}
				},
				error:function(xhr, status, error){
					alert(status+" : " + error);
				}						
			});
		});

		//비밀번호 일치/불일치
		$('#memberpwdCheck').keyup(function() {
		    var memberPwd = $('#memberPwd').val();
		    var memberpwdCheck = $(this).val();
		    var pwdCheckError = $('#pwdCheckError');

		    if (memberPwd !== memberpwdCheck) {
		    	pwdCheckError.html("비밀번호가 일치하지 않습니다.");
		    	pwdCheckError.css('color', 'red');
		    } else {
		    	pwdCheckError.html("비밀번호가 일치합니다");
		    	pwdCheckError.css('color', 'blue');
		    }
		});	
			
		$('#memberTel').on('input', function() {
		    var inputTel = $(this).val();
		    
		    var cleanedTel = inputTel.replace(/-/g, '');
	
		    if (cleanedTel.length >= 4) {
		        cleanedTel = cleanedTel.substring(0, 3) + '-' + cleanedTel.substring(3);
		    }
		    if (cleanedTel.length >= 9) {
		        cleanedTel = cleanedTel.substring(0, 8) + '-' + cleanedTel.substring(8);
		    }
		    
		    $(this).val(cleanedTel);
		});
		
				
		$('#signUpButton').click(function(){
			
			//이름 입력
			if($('#memberName').val().length < 1){
				alert("이름을 입력하세요");
				$('#memberName').focus();				
				return false;				
			}
			
			//아이디 입력
	        if ($('#memberId').val().length < 1) {
	            alert("아이디를 입력하세요");
	            $('#memberId').focus();
	            return false;
	        }
			
	        //아이디 중복확인
			if($('#btnChkId').val()!='Y'){
		         alert('아이디 중복확인을 해주세요.');
		         $('#btnChkId').focus();
		         return false;
		    }
	      
			//비밀번호 입력
			if ($('#memberPwd').val().length < 1) {
				alert("비밀번호를 입력하세요");
				$('#memberPwd').focus();
				return false;
			}
			
			//비밀번호 조건
	        var memberPwd = $("#memberPwd").val();
	        if (memberPwd.length < 8 || memberPwd.length > 20 ||
	            !/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]+$/.test(memberPwd)) {
	            $('#pwdError').html("비밀번호는 문자, 숫자, 특수문자를 포함한 8~20자여야 합니다");
	            $("#memberPwd").focus();
	            return false;
	        } else {
	            $('#passwordError').html("");
	        }
	        
	        //이메일 입력
	        if ($('#memberEmail1').val().length < 1) {
	            alert("이메일을 입력하세요");
	            $('#memberEmail1').focus();
	            return false;
	        }
	        	 	        
	        //전화번호 조건
	        if (telNumber.length !== 13) {
	            alert("전화번호는 (-)포함 13자리로 입력해주세요");
	            $("#memberTel").focus();
	            return false;
	        }
	        
	        //전화번호 중복 확인
	        var phoneNumber = $('#memberTel').val();

	        $.ajax({
	            url: "<c:url value='/main/member/checkPhoneNumber'/>", 
	            type: "get",
	            data: "phoneNumber=" + $('#memberTel').val(),
	            dataType: 'json',
	            success: function(res) {
	                console.log(res);
	                if (res === 1) {
	                    alert("이미 사용 중인 전화번호입니다.");
	                    return false;
	                } else {
						alert("사용가능한 번호입니다.");
	                }
	            },
	            error: function(xhr, status, error) {
	                alert(status + " : " + error);
	            }
	        });	        
	        
	        //주소 입력
		    if ($('#memberPostalCode').val().length < 1) {
		        alert("우편번호를 입력하세요");
		        $('#memberPostalCode').focus();
		        return false;
		    }
	        
		    if ($('#memberAddressDetail').val().length < 1) {
		        alert("상세주소를 입력하세요");
		        $('#memberAddressDetail').focus();
		        return false;
		    }
		});		
		
		//이메일 직접입력
		$(function(){
		    $('#memberEmail2').change(function() {
		        if ($(this).val() === 'etc') {
		            $('#memberEmail3').css('visibility', 'visible');
		        } else {
		            $('#memberEmail3').css('visibility', 'hidden');
		        }
		    });
		});		
	});	
</script>

<div class="form-memberRegister">
	<h1>MBTI&nbsp;&nbsp;회원가입</h1>
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
			<input type="text" class="email" id="memberEmail1" name="email1" placeholder="이메일 주소">&nbsp;@&nbsp;
				<select name="email2" id="memberEmail2">
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="daum.com">daum.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="google.com">google.com</option>
					<option value="etc">직접입력</option>
				</select>&nbsp;
			<input type="text" id="memberEmail3" name="email3" style="visibility:hidden;">
			<div class="error" id="emailError"></div>
		</div>
		
		<label>전화번호</label>
		<div class="div-register">
			<input type="text" class="tel" id="memberTel" name="hp" placeholder="휴대폰번호 입력 ('-')제외 11자리 입력" oninput="formatPhoneNumber(this)">
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
</div>	
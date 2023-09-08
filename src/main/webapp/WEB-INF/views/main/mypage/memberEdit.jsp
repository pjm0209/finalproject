<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<script type="text/javascript" src="<c:url value ='/js/member.js"'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function() {		
		$('#memberpwdCheck').keyup(function() {
		    var memberPwd = $('#memberPwd').val();
		    var memberpwdCheck = $(this).val();
		    var pwdCheckError = $('#pwdCheckError');

		    if (memberPwd !== memberpwdCheck) {	
		    	pwdCheckError.html("비밀번호가 일치하지 않습니다.").css("color", "red");
		    } else {
		    	pwdCheckError.html("비밀번호가 일치합니다").css("color", "blue");
		    }
		});			
		
		$('#editButton').click(function(){
	        var memberPwd = $("#memberPwd").val();
	        if (memberPwd.length < 8 || memberPwd.length > 20 ||
	            !/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]+$/.test(memberPwd)) {
	            $('#pwdError').html("비밀번호는 문자, 숫자, 특수문자를 포함한 8~20자여야 합니다");
	            $("#memberPwd").focus();
	            return false;
	        } else {
	            $('#passwordError').html("");
	        }			
		});	
	});	
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

article {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  margin-top: 100px;
  margin-bottom: 50px;
}

.form-memberEdit {
  max-width: 500px;
  margin-top: 100px;
  margin-left: 800px;
  padding: 20px;
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.form-memberEdit h1 {
  text-align: center;
  font-size: 30px;
  margin-bottom: 20px;
}

.form-memberEdit label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.div-memberEdit {
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.div-memberEdit input[type="text"] {
  width: 80%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.div-memberEdit #memberId{
  width: 60%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
}


#memberEmail{
	width:80%;
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

.div-memberEdit #btnZipcode{
   background-color: #eb5d1e;
   color: white;
   border: none;
   border-radius: 3px;
   cursor: pointer;
   padding: 10px 15px;
}

.div-memberEdit input[type="Button"] {
  padding: 10px 20px;
  background-color: #eb5d1e;
  color: white;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

#editButton {
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
    
<article>
<div class="form-mypage">
	<form class="form-memberEdit" name="memberEdit" method="post" action="<c:url value='/main/mypage/memberEdit'/>">			 
		<h1>회원 정보 수정</h1>         
		    <label>이름</label>
		    <div class="div-memberEdit">
		        <span>${membervo.name}</span>
		    </div>    
			
			<label>아이디</label>
			<div class="div-memberEdit">		
				<span>${sessionScope.userid}</span>
			</div>
						
			<label>이메일</label>
			<div class="div-memberEdit">
				<input type="text" class="email" id="memberEmail" name="email" value="${membervo.email}">
			</div>
			
			<label>전화번호</label>
			<div class="div-memberEdit">
				<input type="text" class="tel" id="memberTel" name="hp" value="${membervo.hp}">
			</div>		
						
			<label>우편번호</label>			
			<div class="div-memberEdit">
				<input type="text" class="postalCode" id="memberPostalCode" name="zipcode" value="${membervo.zipcode}">&nbsp;	
				<input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode2()">	
			</div>
			
			<label>주소</label>
			<div class="div-memberEdit">
				<input type="text" class="address" id="memberAddress" name="address" value="${membervo.address}">
			</div>
				
			<label>상세주소</label>
			<div class="div-memberEdit">
				<input type="text" class="addressDetail" id="memberAddressDetail" name="addressDetail" value="${membervo.addressDetail}">
			</div>		
							
	        <div class="edit"><br>
	            <button class="submit" id="editButton" >수정</button>
	        </div>	      				
	</form>		
</div>	
</article>

<%@include file="../inc/bottom.jsp" %>
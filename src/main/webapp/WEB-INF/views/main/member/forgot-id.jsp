<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 페이지</title>

<style>
*{
	margin: 0px;
	box-sizing: border-box;
	font-size:15px;
}

p{
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;

}

html {
    width: 100%;
    display: flex;
    justify-content: center;
    padding-top: 300px;
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
    line-height: 30px;
    padding-left: 10px;
    padding-right: 10px;
    width: 280px;
}

div {
    padding-top: 3px;
    padding-bottom: 8px;
}

label{
	font-weight: bold;
}

.findId{
	margin-left: 20px;
}

.PhoneNumber button {
	width: 50px;
	height: 35px;
	background-color: #ff7f00;
	color: white;
}

.btnSearch {
    text-align: center;	
    justify-content: space-between; 
}

.btnSearch button{
  	width: 180px;
 	height: 50px;
	background-color: #ff7f00;
	font-weight: bold;	
	color: white;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	function


</script>

</head>
<body>
	<p>휴대폰번호 확인</p><br>
	<form name = "frm-forgot-id" method="post" action="<c:url value='main/member/forgot-id'/>">	
		<div class = "findId">				
				<div class="name">
				<label>이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type="text" id="name" placeholder="이름 입력">					
				</div><br>	
				
				<div class="PhoneNumber">
				<label>전화번호 : &nbsp;</label>
					<input type="text" id="PhoneNumber" placeholder="휴대폰번호 입력 ('-') 제외 11자리 입력)">	
					<button id="PhoneNumberButton" onclick="PhoneNumber_submit">인증</button>			
				</div><br>
				
				<div class="AuthenticationNumber">
				<label>인증번호 : &nbsp;</label>
					<input type="text" id="AuthenticationNumber"  placeholder="인증번호 6자리 숫자 입력">					
				</div><br>					
				
				<div class="btnSearch"><br>
					<button id="check">확인</button>
					<button id="check">취소</button>					
				</div>
		</div>				
	</form>    
</body>
</html>


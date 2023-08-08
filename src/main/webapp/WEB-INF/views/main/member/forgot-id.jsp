<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기 페이지</title>

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
    background: #ffcf00; 
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
    line-height: 35px;
    padding-left: 10px;
    padding-right: 10px;
}

div {
    padding-top: 3px;
    padding-bottom: 8px;
}
.name{
	margin-left:30px;
}
.resident{
	margin-right:80px;
}

.find_id{
	margin-left:20px;
}

.findId{
	text-align: center;	
}

.findId button{
  	width: 200px;
 	height: 50px;
	background-color:#ffcf00;
	font-weight:bold;	
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}


</style>
</head>
<body>
<h1>아이디 찾기</h1><br>
	<form name = "frm2" method="post" action="<c:url value='main/member/forgot-id'/>">	
		<div class = "find_id">				
				<div class="name">
				<label>이름 : </label>
					<input type="text" id="name">					
				</div>	
				
				<div class="resident">
				<label>주민번호 : </label>
					<input type="text" id="resident">					
				</div>	
				
				<div class="findId"><br>
				<button id="findIdButton">아이디 찾기</button>
				</div>
		</div>				
	</form>
</body>
</html>
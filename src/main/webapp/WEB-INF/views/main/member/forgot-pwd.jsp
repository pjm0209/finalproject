<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기 페이지</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
	<form name = "frm3" method="post" action="<c:url value='main/member/forgot-pwd'/>">	
		<div class = "find_pwd">				
				<div class="userid">
				<label>아이디 : </label>
					<input type="text" id="userid">					
				</div>	
								
				<div class="name">
				<label>이름 : </label>
					<input type="text" id="name">					
				</div>	
				
				<div class="email">
				<label>이메일 : </label>
					<input type="text" id="email">					
				</div>	
				
				<button id="findPassword">비밀번호 찾기</button>
		</div>				
	</form>

</body>
</html>
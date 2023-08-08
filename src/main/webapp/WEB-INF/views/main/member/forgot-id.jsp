<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기 페이지</title>
</head>
<body>
<h1>아이디 찾기</h1>
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
				
				<button id="Check">확인</button>
		</div>				
	</form>
</body>
</html>
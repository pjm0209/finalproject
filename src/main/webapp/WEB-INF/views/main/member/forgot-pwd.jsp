<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã�� ������</title>
</head>
<body>
<h1>��й�ȣ ã��</h1>
	<form name = "frm3" method="post" action="<c:url value='main/member/forgot-pwd'/>">	
		<div class = "find_pwd">				
				<div class="userid">
				<label>���̵� : </label>
					<input type="text" id="userid">					
				</div>	
								
				<div class="name">
				<label>�̸� : </label>
					<input type="text" id="name">					
				</div>	
				
				<div class="email">
				<label>�̸��� : </label>
					<input type="text" id="email">					
				</div>	
				
				<button id="findPassword">��й�ȣ ã��</button>
		</div>				
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã�� ������</title>
</head>
<body>
<h1>���̵� ã��</h1>
	<form name = "frm2" method="post" action="<c:url value='main/member/forgot-id'/>">	
		<div class = "find_id">				
				<div class="name">
				<label>�̸� : </label>
					<input type="text" id="name">					
				</div>	
				
				<div class="resident">
				<label>�ֹι�ȣ : </label>
					<input type="text" id="resident">					
				</div>	
				
				<button id="Check">Ȯ��</button>
		</div>				
	</form>
</body>
</html>
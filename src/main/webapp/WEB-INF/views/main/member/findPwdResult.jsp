<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 재설정 페이지</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.wrapper-findPwdResult {
    text-align: center;
    padding: 50px;
}

.wrapper-findPwdResult h1 {
    font-size: 24px;
    margin-bottom: 20px;
}

.wrapper-findPwdResult p {
    font-size: 16px;
    margin-bottom: 20px;
}

.newPwd, .newPwdCheck {
    margin-bottom: 20px;
}

.newPwd label, .newPwdCheck label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
}

.newPwd input, .newPwdCheck input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
}

button {
    padding: 10px 20px;
    background-color: #007bff;
    border: none;
    color: #fff;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}
</style>

</head>
<body>
<div class="wrapper-findPwdResult">
	<h1>비밀번호 재설정하기</h1>
		<p>새로운 비밀번호를 입력해주세요.</p>

		<div class="newPwd">
		<label>새 비밀번호</label>
			<input type="text" id="newPwd" placeholder="새로운 비밀번호를 입력하세요">	
		</div>

		<div class="newPwdCheck">
		<label>비밀번호 확인</label>
			<input type="text" id="newPwdCheck" placeholder="새로운 비밀번호를 입력하세요">	
		</div>	
		
		<div class="">
			<button id="">비밀번호 변경</button>
		</div>	
</div>		
</body>
</html>
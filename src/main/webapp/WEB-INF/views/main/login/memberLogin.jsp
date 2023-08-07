<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<!DOCTYPE html>
<html lang="ko">
<head>	
</head>
<style>
*{
	margin:0;
	padding:0;
	border:none;
}

body{
	display:flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.wrapper h1{
	text-align: left;
	font-size: 40px;
}

.wrapper{
	background: purple;
	width: 500px;
	color: #fff;
}

.wrapper .input-box{
	width: 100%;
	height: 100px;
	margin: 30px 0;
}

.wrapper input{
	width: 100%;
	height: 100%;
}

.input-box input::placeholder{
	color:black;
}



</style>
	<div class = "wrapper">
		<h2>로그인</h2>
		<form method="post" action="url">
			<div class="input-box">
			<label>아이디</label>
				<input type="text" 	placeholder="userid" required>
			</div>
			<div class="input-box">
			<label>비밀번호</label>
				<input type="text" 	placeholder="password" required>
			</div>
			
			<div class="remember-forgot">
				<label><input type="checkbox"> 아이디 저장하기</label> 
			</div>
			
			<button type="submit" value="btn">Login</button>
			
			<div class="">
				<a href="#">아이디 찾기</a><br>
				<a href="#">비밀번호 찾기</a>
			</div>
			
			
			<div class="register-link">
				<a href="#">회원가입</a>
			</div>
		</form>
	</div>
</body>
</html>

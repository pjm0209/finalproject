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

h1{
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

p{
	margin-bottom: 30px;
	text-align: center;
	font-size: 15px;
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

.btnSearch {
    text-align: center;	
    justify-content: space-between; 
}

input[type="button"]{
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
$(function() {
    $('#btnLoginScreen').click(function() {
    	var confirmed = confirm("로그인 화면으로 돌아가시겠습니까?");
    	if (confirmed) {
        window.location.href = '<c:url value="/main/member/memberLogin"/>'; 
    	}
    });
});
</script>

</head>
<body>
<h1>아이디 찾기</h1>	   
	<form name = "form-findIdResult" method="post" action="<c:url value='main/member/findIdResult'/>">	
		<div class="tab-content active">
			<p>회원님의 아이디는: <%= request.getParameter("userId") %></p>									
				<div class="btnSearch"><br>
					<input type="button" id="btnLoginScreen" value="로그인 화면으로">					
				</div>
		</div>				
	</form>    
</body>
</html>


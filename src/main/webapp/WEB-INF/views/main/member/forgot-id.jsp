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
        $('#check').click(function() {
            var name = $('#name').val();
            var email = $('#email').val();

            if (name === '' && email === '') {
                alert('이름과 이메일을 입력해주세요.');
                return false;
            } else if (name === '') {
                alert('이름을 입력해주세요.');
                return false;
            } else if (email === '') {
                alert('이메일을 입력해주세요.');z
                return false;
            }
    	});
           
        $('#btnCancel').click(function(){
            var confirmed = confirm("메인 화면으로 돌아가시겠습니까?");
            if (confirmed) {
                window.location.href = '<c:url value="/main/index"/>';
            }
        }); 
    });
</script>

</head>
<body>
	<p>휴대폰번호 확인</p><br>
	<form name = "frm-forgot-id" method="post" action="<c:url value='main/member/forgot-id'/>">	
		<div class = "findId">				
				<div class="name">
				<label>이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type="text" id="name" placeholder="이름 입력">					
				</div><br>	
				
				<div class="email">
				<label>E-Mail : &nbsp;</label>
					<input type="text" id="email" placeholder="이메일을 입력하세요">		
				</div><br>
											
				<div class="btnSearch"><br>
					<input type="button" id="btnCheck" value="확인">	
					<input type="button" id="btnCancel" value="취소">					
				</div>
		</div>				
	</form>    
</body>
</html>


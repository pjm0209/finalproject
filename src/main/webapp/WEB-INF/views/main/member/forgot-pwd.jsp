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
	margin-left: 80px;
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

.tab {
    display: flex;
    justify-content: center;
    margin-top: 30px;
    margin-bottom: 20px;
}

.tab-button {
    cursor: pointer;
    padding: 15px 50px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 5px 5px 0 0;
    font-size: 18px;
}

.tab-button.active {
    background-color: darkorange;
    border-bottom: none;
}

.tab-content {
    display: none;
    width: 100%;
    padding: 20px;
}

.tab-content.active {
    display: block;
}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(function() {          
        $('#btnCancel').click(function(){
            var confirmed = confirm("메인 화면으로 돌아가시겠습니까?");
            if (confirmed) {
                window.location.href = '<c:url value="/main/index"/>';
            }
        }); 
        
        $('.tab-button').click(function() {
            $('.tab-button').removeClass('active');
            $(this).addClass('active');

            var tabIndex = $(this).index();
            $('.tab-content').removeClass('active');
            $('.tab-content').eq(tabIndex).addClass('active');
        });
        
        $("#btnSubmit").click(function(){
        	$.ajax({
        		url : "/main/member/forgot-pwd",
        		type : "POST",
        		data : {
        				id : $("#name").val(),
        				email : $("#email").val()
        		},
        		success : function(result){
        				alert(result);
        		},
        	});
        });
    });
</script>

</head>
<body>
<h1>비밀번호 찾기</h1>	
	<div class="tab">
        <div class="tab-button active">휴대폰번호로 찾기</div>
        <div class="tab-button">이메일로 찾기</div>
    </div>
    
	<form name = "form-forgot-id" method="post" action="<c:url value='main/member/forgot-id'/>">	
		<div class="tab-content active">
			<p>회원가입 시 입력한 휴대폰 번호로 임시 비밀번호를 전송해드립니다. </p>			
				<div class="findTel-name">
					<label>*&nbsp;이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" id="name" placeholder="이름을 입력하세요">	
				</div><br>													
				
				<div class="findTel-tel">
					<label>*&nbsp;휴대폰 : &nbsp;</label>
						<input type="text" id="tel" placeholder="휴대폰번호를 입력하세요">		
				</div><br>
				
				<div class="btnSearch"><br>
					<input type="button" id="btnSubmit" value="전송">	
					<input type="button" id="btnCancel" value="취소">					
				</div>
		</div>	
				
		<div class="tab-content">
			<p>회원가입 시 입력한 이메일 주소로 임시 비밀번호를 전송해드립니다.</p>	
				<div class="findEmail-name">
					<label>*&nbsp;이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" id="name" placeholder="이름을 입력하세요">	
				</div><br>		
			
				<div class="findEmail-email">
					<label>*&nbsp;E-mail : &nbsp;</label>
						<input type="text" id="email" placeholder="이메일을 입력하세요">		
				</div><br>
													
				<div class="btnSearch"><br>
					<input type="button" id="btnSubmit" value="전송">	
					<input type="button" id="btnCancel" value="취소">					
				</div>
		</div>				
	</form>    
</body>
</html>


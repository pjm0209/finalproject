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

.content{
	margin-top: 100px;
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
	margin-left: 750px;
}

.btnSearch {
    text-align: center;	
    justify-content: space-between; 
}

button[type="submit"]{
  	width: 180px;
 	height: 50px;
	font-weight: bold;	
	color: white;
}

button[type="button"]{
	width: 180px;
 	height: 50px;
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
        });// 
        
        $('.tab-button').click(function() {
            $('.tab-button').removeClass('active');
            $(this).addClass('active');

            var tabIndex = $(this).index();
            $('.tab-content').removeClass('active');
            $('.tab-content').eq(tabIndex).addClass('active');
        });//
        
        $("#sendEmailBtn").click(function(){
        	var userid=$('#id').val();
			var email=$('#email').val();
			
        	if(userid.length < 1){
				alert("아이디를 입력해주세요.");
				$("#id").focus;
				return false;
	      	}  
        	
        	if(email.length < 1){
				alert("이메일을 입력해주세요.");
				$("#email").focus;
				return false;
	      	} 
        		     
	    	
        	
        	$.ajax({
        		url : "<c:url value='/main/member/ajaxsendEmail'/>",
        		type : 'post',
        		data : {
        				userid : userid,
        				email : email
        		},
        		dateType:'json',
        		success : function(result){
       				alert("임시 비밀번호 발송 완료!! 이메일을 확인해주세요");
       				location.href="<c:url value='/main/member/memberLogin'/>";       				
        		},
	            error:function(xhr,status,error){
  	                alert(status+" : "+error);
	            }    
        	});//ajax
        });//
    });
</script>

<div class="content">
<h1>비밀번호 찾기</h1>	
	<div class="tab">
        <div class="tab-button">이메일로 찾기</div>
    </div>
    			
	<div class="tab-content">
		<p>회원가입 시 입력한 이메일 주소로 임시 비밀번호를 전송해드립니다.</p>	
			<div class="findEmail-id">
				<label>*&nbsp;아이디 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type="text" name="userid" id="id" placeholder="아이디를 입력하세요">	
			</div><br>		
		
			<div class="findEmail-email">
				<label>*&nbsp;E-mail : &nbsp;</label>
					<input type="text" name="email" id="email" placeholder="이메일을 입력하세요">		
			</div><br>
												
			<div class="btnSearch"><br>
				<button class="btn btn-primary" type="submit" name="submit" id="sendEmailBtn">전송</button>	
				<button class="btn btn-info" type="button" onclick="history.back();">취소</button>					
			</div>
	</div>				
<%@ include file="../inc/bottom.jsp" %>   

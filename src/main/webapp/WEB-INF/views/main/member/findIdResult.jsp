<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    

<style>
*{
	margin: 0px;
	box-sizing: border-box;
	font-size:15px;
}

.idResult{
	margin-top: 7%;
	margin-left: 32%;
	width: 40%;
}

h1{
	margin-top: 10%;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

p{
	margin-bottom: 30px;
	text-align: center;
	font-size: 25px;
}

strong{
	font-size: 25px;
	color: orange;
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
    margin-top: 30px;
}

.btnSearch input[type="button"] {
    width: 180px;
    height: 50px;
    margin-right: 10px; 
    background-color: #ff7f00;
    font-weight: bold;	
    color: white;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 80px;
    margin-bottom: 50px;
}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
$(function() {
    $('#btnLogin').click(function() {
    	var confirmed = confirm("로그인 화면으로 돌아가시겠습니까?");
    	if (confirmed) {
        window.location.href = '<c:url value="/main/member/memberLogin"/>'; 
    	}	
    });
    
    $('#btnFindPwd').click(function() {
    	var confirmed = confirm("비밀번호찾기 화면으로 가시겠습니까?");
    	if (confirmed) {
        window.location.href = '<c:url value="/main/member/forgot-pwd"/>'; 
    	}	
    });
});
</script>

<div class="idResult">
<h1>아이디 찾기 결과</h1>	   
	<form name = "form-findIdResult" method="post" action="<c:url value='main/member/findIdResult'/>">	
		<div class="tab-content active">
            <c:choose>
                <c:when test="${empty id}">
                    <p>조회된 아이디가 없습니다.</p>
                </c:when>
                <c:otherwise>
                    <p>회원님의 아이디는<strong>&nbsp;${id}&nbsp;</strong> 입니다.</p>
                </c:otherwise>
            </c:choose>
								
				<div class="btnSearch"><br>
					<input type="button" id="btnLogin" value="로그인화면으로">	
					<input type="button" id="btnFindPwd" value="비밀번호 찾기">						
				</div>
		</div>				
	</form>    
</div>	
<%@ include file="../inc/bottom.jsp" %> 
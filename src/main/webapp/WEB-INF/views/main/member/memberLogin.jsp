<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 
<!DOCTYPE html>
    <html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Responsive Login and Signup Form </title>

        <!-- CSS -->
        <link rel="stylesheet" href="css/style.css">
                
        <!-- Boxicons CSS -->
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}
.container{
    height: 100vh;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #FFA500;
    column-gap: 30px;
}
.form{
    position: absolute;
    max-width: 430px;
    width: 100%;
    padding: 30px;
    border-radius: 6px;
    background: #FFF;
}
.form.signup{
    opacity: 0;
    pointer-events: none;
}
.forms.show-signup .form.signup{
    opacity: 1;
    pointer-events: auto;
}
.forms.show-signup .form.login{
    opacity: 0;
    pointer-events: none;
}
.form-content h1 img {
    width: 300px; 
    height: auto;
    display: block;
    margin: 0 auto; 
}

form{
    margin-top: 30px;
}

.form .field{
    position: relative;
    height: 50px;
    width: 100%;
    margin-top: 20px;
    border-radius: 6px;
}

.field input,
.field button{
    height: 100%;
    width: 100%;
    border: none;
    font-size: 16px;
    font-weight: 400;
    border-radius: 6px;
}

.field input{
    outline: none;
    padding: 0 15px;
    border: 1px solid#CACACA;
}

.field input:focus{
    border-bottom-width: 2px;
}

.eye-icon{
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    font-size: 18px;
    color: #8b8b8b;
    cursor: pointer;
    padding: 5px;
}

.field button{
    color: #fff;
    background-color: #0171d3;
    transition: all 0.3s ease;
    cursor: pointer;
}

.field button:hover{
    background-color: #016dcb;
}

.form-link{
    text-align: center;
    margin-top: 10px;
}
.form-link span,
.form-link a{
    font-size: 14px;
    font-weight: 400;
    color: #232836;
}

.form a{
    color: #0171d3;
    text-decoration: none;
}
.form-content a:hover{
    text-decoration: underline;
}

#memberLogin-button{
	background: #eb5d1e;
}

#memberRegister-button{
	background: #eb5d1e;
}

.images-row {
    display: flex;
    align-items: center;
    justify-content: center;
    column-gap: 20px;
    margin-top: 20px;
}

.centered-span {
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>     
<script type="text/javascript">
$(function(){
    $('#memberRegister-button').click(function() {
        window.location.href = '<c:url value="/main/member/agreement"/>';
    }); 
    
    $('#show-hide-password').click(function() {
        var passwordInput = $(this).prev('.password');
        var passwordType = passwordInput.attr('type');
        
        if (passwordType === 'password') {
            passwordInput.attr('type', 'text');
            $(this).removeClass('bx-hide').addClass('bx-show');
        } else {
            passwordInput.attr('type', 'password');
            $(this).removeClass('bx-show').addClass('bx-hide');
        }
    });
});  	    	
</script> 

<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('ba663235e16b790c0b20037c2ed8ed93'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
    	alert(response.access_token)
    	Kakao.Auth.setAccessToken(response.access_token);
    	
        Kakao.API.request({
          url: '/v2/user/me',
          
          success: function(result) {
        	  console.log(result)
        	  /*$.ajax({
        		  url:"<c:url value='로그인 처리 할 url'/>"
        		  data:{
        			name:result.properties.nickname  
        		  },
        	  })*/
          },
          fail: function (error) {
		    alert(error);
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
    
</head>
<body>
    <section class="container forms">    
        <div class="form login">
            <div class="form-content">
                <h1><img src="../../images/로고이미지.png"/></h1>
                
                <form class="form-memberLogin" method="post" id="memberLogin-form" action="<c:url value='/main/member/memberLogin'/>">
                    <div class="field input-field">
                        <input type="text" name="userid" placeholder="아이디를 입력하세요."value="${cookie.ck_userid.value }">                       
                    </div>

                    <div class="field input-field">
                        <input type="password" name="pwd" placeholder="비밀번호를 입력하세요." class="password">                    
                        <i class='bx bx-hide eye-icon' id="show-hide-password"></i>
                    </div><br>
                    
                    <div class="remember-check">
                		<input type="checkbox" name="chkSave" id="remember-check">&nbsp; 아이디 저장하기
                			<c:if test="${!empty cookie.ck_userid }">         
                			</c:if>   
                		<a class="forgot-id" href="<c:url value='/main/member/forgot-id'/>">아이디 찾기</a>
                		<span style="color:blue;">|</span>
                		<a class="forgot-password" href="<c:url value='/main/member/forgot-pwd'/>">비밀번호 찾기</a>
            		</div>
                  
                    <div class="field button-field">
                        <input type="submit" value="로그인" id="memberLogin-button">     
                    </div>
                    <span class="centered-span">또는</span><br>
                    <hr><br>
					<div onclick="kakaoLogin();">
				      <a href="javascript:void(0)">
				          <img src='../../images/kakao_login_large_narrow.png' width=370; height=50;>
				      </a>
					</div>
					
					<div onclick="naverLogin();">
				      <a href="javascript:void(0)">
				          <img src='../../images/btnG_완성형.png' width=370; height=50;>
				      </a>
					</div>
                
                    <div class="field button-field">
                    	<span >계정이 없으신가요?</span>
                    	<input type="button" value="회원가입" id="memberRegister-button">  
                    </div>  
                    
                    <div id="naver_id_login"></div>                 
                </form>                 
            </div>
        </div>
    </section>  
</body>
</html>
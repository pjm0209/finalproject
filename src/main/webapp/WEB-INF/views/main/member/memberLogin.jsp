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
    background-color: #4070f4;
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

</style>
  
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('134b854676688bdb6bb627d7da5de730'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
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
<script type="text/javascript">
</script>                   
</head>
<body>
    <section class="container forms">    
        <div class="form login">
            <div class="form-content">
                <h1><img src="../../images/MBTI_Login.png"/></h1>
                <form method="post" id="memberLogin-form" action="<c:url value='/main/member/memberLogin'/>">
                    <div class="field input-field">
                        <input type="text" name="userid" placeholder="아이디를 입력하세요." class="input">                       
                    </div>

                    <div class="field input-field">
                        <input type="password" name="pwd" placeholder="비밀번호를 입력하세요." class="password">                    
                        <i class='bx bx-hide eye-icon'></i>
                    </div><br>
                    
                    <label for="remember-check">
                		<input type="checkbox" name="chkSave" id="remember-check">&nbsp; 아이디 저장하기
            		</label>
                  
                    <div class="field button-field">
                        <input type="submit" value="Login" id="memberLogin-button">     
                    </div>
                </form>
                
                    <div class="form-link">
                        <a href="<c:url value='/main/member/forgot-id'/>" class="forgot-id">아이디 찾기</a>
                    </div>   
                    
                    <div class="form-link">
                        <a href="<c:url value='/main/member/forgot-pwd'/>" class="forgot-password">비밀번호 찾기</a>
                    </div>                

                <div class="form-link">
                    <span>계정이 없으신가요? <a href="<c:url value='/main/member/agreement'/>">회원가입</a></span>          
                </div>
                
                <hr><br>
                
				<div onclick="kakaoLogin();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그인</span>
			      </a>
				</div>
				<div onclick="kakaoLogout();">
			      <a href="javascript:void(0)">
			          <span>카카오 로그아웃</span>
			      </a>
				</div>                   
            </div>
        </div>
    </section>  
</body>
</html>

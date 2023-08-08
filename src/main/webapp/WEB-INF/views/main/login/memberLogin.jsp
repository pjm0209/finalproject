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
header{
    font-size: 28px;
    font-weight: 600;
    color: #232836;
    text-align: center;
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
.line{
    position: relative;
    height: 1px;
    width: 100%;
    margin: 36px 0;
    background-color: #d4d4d4;
}
.line::before{
    content: 'Or';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #FFF;
    color: #8b8b8b;
    padding: 0 15px;
}
.media-options a{
    display: flex;
    align-items: center;
    justify-content: center;
}
a.facebook{
    color: #fff;
    background-color: #4267b2;
}
a.facebook .facebook-icon{
    height: 28px;
    width: 28px;
    color: #0171d3;
    font-size: 20px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #fff;
}
.facebook-icon,
img.google-img{
    position: absolute;
    top: 50%;
    left: 15px;
    transform: translateY(-50%);
}
img.google-img{
    height: 20px;
    width: 20px;
    object-fit: cover;
}
a.google{
    border: 1px solid #CACACA;
}
a.google span{
    font-weight: 500;
    opacity: 0.6;
    color: #232836;
}
</style>
                       
</head>
<body>
    <section class="container forms">
        <div class="form login">
            <div class="form-content">
                <header>회원 로그인</header>
                <form action="#">
                    <div class="field input-field">
                        <input type="id" placeholder="아이디" class="input">
                    </div>

                    <div class="field input-field">
                        <input type="password" placeholder="비밀번호" class="password">
                        <i class='bx bx-hide eye-icon'></i>
                    </div>
                    
                    <div class="form-link">
                        <a href="#" class="forgot-id">아이디 찾기</a>
                    </div>   
                    
                    <div class="form-link">
                        <a href="#" class="forgot-password">비밀번호 찾기</a>
                    </div>

                    <div class="field button-field">
                        <button>로그인</button>
                    </div>
                </form>

                <div class="form-link">
                    <span>계정이 없으신가요? <a href="<c:url value='/main/member/memberRegister'/>">회원가입</a></span>          
                </div>
            </div>

            <div class="line"></div>

            <div class="media-options">
                <a href="#" class="field facebook">
                    <i class='bx bxl-facebook facebook-icon'></i>
                    <span>페이스북 로그인</span>
                </a>
            </div>
        </div>
    </section>
    </body>
</html>
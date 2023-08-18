<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
</head>

<style>
body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    font-size: 16px;
    font-family: 'Roboto', sans-serif;
    background-color: #F2F2F2;
}

.wrapper {
    width: 600px;
    height: 500px;
    padding: 40px;
    box-sizing: border-box;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

.wrapper > h2 {
    font-size: 30px;
    color: #eb5d1e;
    margin-bottom: 30px;
    text-align: center;
}

#login-form > input {
    width: 100%;
    height: 50px;
    padding: 0 20px;
    box-sizing: border-box;
    margin-bottom: 16px;
    border: 2px solid #D2D2D2;
    border-radius: 6px;
    background-color: #F8F8F8;
}

#login-form > input::placeholder {
    color: #999999;
}

#login-form > input[type="submit"] {
    color: #ece6cc;
    font-size: 20px;
    background-color: #eb5d1e;
    margin-top: 20px;
    cursor: pointer;
}

#login-form > input[type="checkbox"] {
    display: none;
}

#login-form > label {
    color: #999999;
    display: flex;
    align-items: center;
    cursor: pointer;
}

#login-form input[type="checkbox"] + label:before {
    content: '';
    display: inline-block;
    width: 20px;
    height: 20px;
    margin-right: 10px;
    border: 2px solid #D2D2D2;
    border-radius: 4px;
    background-color: #F8F8F8;
}

#login-form input[type="checkbox"]:checked + label:before {
    background-color: #6A24FE;
    border-color: #6A24FE;
}

</style>

<body>
    <div class="wrapper">
        <h2>관리자 로그인</h2>
        <form method="post" id="login-form" action="<c:url value='/admin/login'/>">        	
            <input type="text" name="adminId" placeholder="아이디를 입력하세요." value="${cookie.ck_adminId.value }">            
            <input type="password" name="adminPwd" placeholder="비밀번호를 입력하세요.">            
            <label for="remember-check">
                <input type="checkbox" name="chkSave" id="chkSave">&nbsp; 아이디 저장하기
                <c:if test="${!empty cookie.ck_adminId }">
                	
                </c:if>               
            </label>            
            <input type="submit" value="Login" id="login-button">                    
        </form>
    </div>
</body>
</html>
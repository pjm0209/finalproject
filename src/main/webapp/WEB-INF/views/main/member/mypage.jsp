<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?fmaily=Poppins:wght@300;400;500;600;700&display=swap');

*{
	font-family: 'Poppins', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

:root{
	--body-color: #E4E9F7;
	--sidebar-color: #FFF;
	--primary-color: #695CFE;
	--primary-color-light: #F6F5FF;
	--toggle-color: #DDD;
	--text-color: #707070;
	 
	--tran-02: all 0.2s ease ;
	--tran-03: all 0.3s ease;
	--tran-04: all 0.4s ease;
	--tran-05: all 0.5s ease;
}

body{
	height: 100vh;
	background: var(--body-color);
}

body.dark{
	--body-color: #18191A;
	--sidebar-color: #242526;
	--primary-color: #3A3B3C;
	--primary-color-light: #3A3B3C;
	--toggle-color: #FFF;
	--text-color: #CCC;
}

/* == 메뉴바* == */
.sidebar{
	position: fixed;
	top: 0;
	left: 0;
	height: 100%;
	width: 250px;	
	padding: 10px 14px;
	background: var(--sidebar-color);
}

/* == Resuable CSS == */
.sidebar .text{
	font-size: 20px;
	font-weight: bold;
	color: var(--text-color);
}

.sidebar .image{
	min-width: 120px;
	display: flex;
	align-items: center;
}

.sidebar li{
	height: 50px;
	margin-top : 10px;
	list-style: none;
	display: flex;
	align-items: center; 
}

.sidebar li .icon{
	display: flex;
	align-items: center;
	justify-content: center;  
	min-width: 60px;
	font-size: 20px;	
}

sidebar li .icon.
sidebar li .text{
	color: var(--text-color);	
	transition: var(--tran-02);
}

.sidebar header{
	position: relative;
}

.sidebar .image-text img{
	width: 220px;
	border-radius: 10px;
}

.sidebar header .image-text{
	display: flex;
	align-items: center;	
} 

header .image-text .header-text{
	display: flex;
	flex-direction: column;
}

.header-text .name{
	font-weight: 600;
}

.header-text .profession{
	margin-top: -2px;
}

.sidebar header .toggle{
	position: absolute;
	top: 50%;
	right: -25px;
	transform: translateY(-50%);
	height: 25px;
	width: 25px;
	background: var(--primary-color);
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%; 
	color: var(--sidebar-color);
	font-size: 22px;
}

.sidebar .search-box{
	background: var(--primary-color-light);
}

.search-box input{
	height: 100%;
	width: 100%;
	outline: none;
	border: none;
	border-radius: 6px;
	background: var(--primary-color-light);
}

.sidebar li a{
	height: 100%;
	width: 100%;
	display: flex;
	align-items: center;
	text-decoration: none;
	border-radius: 6px;
	transition: var(--tran-04);
} 

.sidebar li a:hover{
	background: var(--primary-color);
}

.sidebar li a:hover .icon,
.sidebar li a:hover .text{
	color: var(--sidebar-color);
}

.sidebar .menu-bar{	
	height: calc(100% - 50px);
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.menu-bar .mode{
	background: var(--primary-color-light);
}

.menu-bar .mode .moon-sun{
	height: 50px;
	width: 60px;
	display: flex;
	align-items: center;
}

.menu-bar .mode i{
	position: absolute;
} 

.menu-bar .mode i .sun{
	opacity: 0;
}

.menu-bar .mode .toggle-switch{
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
	min-width: 60px;
	cursor: pointer;
}

.toggle-switch .switch{
	position: relative;
	height: 22px;
	width: 44px;
	border-radius: 25px;
	background: var(--toggle-color); 
}

.switch::before{
	content: '';
	position: absolute;
	height: 15px;
	width: 15px;
	border-radius: 50%;
	top: 50%;
	left: 5px;
	transform: translateY(-50%);
	background: var(-sidebar-color);
	transition: var(--tran-03);
}

body.dark .switch::before{
	left: 24px; 
}
</style>

	<meta charset="UTF-8">
	<meta http-equi="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style.css">
	<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
	<script src="script.js"></script>	
</head>
<body>
	<nav class="sidebar">
		<header>
			<div class="image-text">
				<span class="image">
					<img src="../../images/KakaoTalk_20230817_223902506_02.jpg" alt="logo">
				</span>
				
				<div class="text header-text">
					<span class="name"></span>
					<span class="profession"></span>
				</div>	
			</div>
			
			<i class='bx bx-chevron-right toggle'></i>
		</header>
		
		<div class="menu-bar">
			<div class="menu">	
				<li class="search-box">	 		
					<i class='bx bx-search icons'></i>
						<input type="search" placeholder="Search...">																
				</li>
				<ul class="menu-links">
					<li class="nav-link">
						<a href="<c:url value='/main/member/memberEdit'/>">
							<i class='bx bx-home-alt icon'></i>
							<span class="text nav-text">나의 정보</span>						
						</a>
					</li>
					<li class="nav-link">
						<a href="#">
							<i class='bx bx-bar-chart-alt-2 icon'></i>
							<span class="text nav-text">장바구니</span>						
						</a>
					</li>					
					<li class="nav-link">
						<a href="#">
							<i class='bx bx-bell icon'></i>
							<span class="text nav-text">주문 내역</span>						
						</a>
					</li>					
					<li class="nav-link">
						<a href="#">
							<i class='bx bx-pie-chart-alt icon'></i>
							<span class="text nav-text">MBTI 결과</span>						
						</a>
					</li>	
					<li class="nav-link">
						<a href="#">
							<i class='bx bx-heart icon'></i>
							<span class="text nav-text">나의 교육</span>						
						</a>
					</li>										
					<li class="nav-link">
						<a href="#">
							<i class='bx bx-wallet icon'></i>
							<span class="text nav-text">회원탈퇴 </span>						
						</a>
					</li>					
				</ul>
			</div>		
		</div>
	</nav>
</body>
</html>	
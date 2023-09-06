<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ include file="../inc/top.jsp" %>
<style>
img{
	width: 100%;
	height: 300px;
}

ul{
	list-style: none;
}

a{
	color: #8b8b8b;
	text-decoration: none;
}

.tabMenu{
	width:70%;
	height: 50px;
	border-bottom: 1px solid #262626;
	margin:0 auto;
}

.tabMenu li a{
	display: block;
	border-top: 3px solid #afafaf;
	border-right: 1px solid #262626;
	line-height: 50px;
	height: 50px;
}

.tabMenu li{
	float:left;
	width:25%;
	text-align: center;
	font-size: 15px;
}

.tabMenu li.on{
	height: 50px;
}
.sub_title{
	padding-top: 30px;
	text-align: center;
}

.sub_tit{
	color: #2ebfec;
	font-size: 50px;
	font-weight: bold;
}


</style>


<script type="text/javascript">

</script>

<div class="PageContent">
	<div class="title">
		 <img src="../../images/KakaoTalk_20230817_223902506_02.jpg" alt="Sub Visual Image"> 
	</div>
	
	</div>
	
	<div class="tabMenu">
		<ul>
			<li class="on">
				<a href="<c:url value='/main/Introduction/info'/>">에세스타</a>
				
			</li>
			<li>
			<a href="<c:url value='/main/Introduction/Vision'/>">비전</a>
			</li>
			<li>
				<a href="">연혁/프로젝트</a>
			</li>
			<li>
				<a href="">회사 위치</a>
			</li>									
		</ul>
	</div>
	
	<div class="sub_title">
		<strong class="sub_tit">Why we research</strong>
	</div>
	
	
<%@ include file="../inc/bottom.jsp" %>
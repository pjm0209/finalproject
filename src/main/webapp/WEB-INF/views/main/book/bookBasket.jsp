<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<style>

#basket{
	margin-top: 73px;
}
#basket ul { 

	border-top: 2px #ee7843 solid;
	border-bottom: 2px #ee7843 solid;
	padding: 30px 0;
	max-width: 1420px;
	margin: 0 auto;
}

#basket li {
	border-top: 1px #aaa solid;
	border-bottom: 1px #aaa solid;
	padding: 10px 60px;
}

#basket li.flex{
	align-items: center;
}


#basket .box1 div.flex{
	align-items: center;
}

#basket .box1 div.flex p{ 
	font-weight: bold;
	font-size: 22px;
	padding-left: 30px;
}

#basket .box1 input{
	margin-right: 30px;
	width: 30px;
	height: 30px;
	border: 2px #ee7843 solid;
	border-radius: 5px 0px 0px 5px;
}

#basket .box1.flex{
	align-items: center;
	border-right: 1px #aaa solid;
	padding-right: 800px;
}

#basket .box1 div.flex p span{
	font-size: 18px;
	color: #666;
	display: block;
	margin-top: 20px;
} 

#basket .box2 button{
	width: 50px;
	height: 50px;
	border: 0px;
	background: #ee7843;
	border-radius: 5px 0px 0px 5px;
	color: white;
}

#basket .box2 button.plus{
		border-radius: 0px 5px 5px 0px;
}

#basket .box2 .tt{
	font-size: 22px;
	line-height: 46px;
	padding: 0 15px;
	border-top: 2px #ee7843 solid;
	border-bottom: 2px #ee7843 solid;
}

#basket .box2 p{
	font-size: 30px;
	text-align: center;
}

</style>
<section id="basket">
	<ul>
		<li class="flex">
			<div class="flex box1">
				<input type="checkbox">
				<div class="flex">
					<img src="<c:url value='/images/bookProduct/1.jpg'/>" alt="상품이미지" width="140px;"
					style="vertical-align: middle;">
					<P>제 목<span>10,000원</span></P>
				</div>
			</div>
			<div class="box2">
				<p>10,000원</p>
				<div class="flex">
					<button class="remove">
						<span class="material-symbols-outlined"> remove </span>
					</button>
					<p class="tt">10</p>
					<button class="plus">
						<span class="material-symbols-outlined"> add </span>
					</button>
				</div>
			</div>
		</li>

	</ul>
</section>



<%@ include file="../inc/bottom.jsp"%>
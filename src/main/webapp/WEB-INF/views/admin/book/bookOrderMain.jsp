<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<style>


#basket{

	    position: relative;
    left: 50%;
    transform: translateX(-50%);
    width: 1420px;
    padding:0;
}
#basket>ul { 

	border-top: 3px #ee7843 solid;
	border-bottom: 3px #ee7843 solid;
	padding: 30px 0;
	width:69%;
	margin:0;
}

#basket>ul li:first-child{border-top:1px #aaa solid;}

#basket>ul li {
	
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
	

}

#basket .box1 div.flex p span{
	font-size: 18px;
	color: #666;
	display: block;
	margin-top: 20px;
} 

#basket .box2{
border-left: 1px #aaa solid;
padding-left:60px;
position:relative;
}

#basket .box2>a{top: -30px;
    position: absolute;
    right: -40px;}
#basket .box2>a span{font-size:22px; color:#666;}
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
	line-height: 48px;
	height:50px;
	padding: 0 15px;
	border-top: 2px #ee7843 solid;
	border-bottom: 2px #ee7843 solid;
}

#basket .box2 p{
	font-size: 30px;
	text-align: center;
}

#basket .booklist_area {
	width: 25%;
    border: 3px #ee7843 solid;
    border-radius: 10px;
    padding: 25px;
    max-height:285px;
    }
#basket .booklist_area>ul{padding:0; font-size:22px;}

#basket .booklist_area>ul li p span{font-size:30px; font-weight: bold;}

#basket .booklist_area>button{
    width: 100%;
    padding: 20px;
    border: 0;
    background: #ee7843;
    color: white;
    border-radius: 10px;
    font-size: 22px;
    font-weight: bold;
    margin-top:10px;
}
.check_box{	margin-top: 93px; width:1420px; position:relative; left: 50%; transform: translateX(-50%);}
.check_box .inner{
	width:69%; margin-top: 0px; margin-bottom:10px;
    background: #efefef;
    padding: 20px;
    border-radius: 10px; align-items:center;}
    
.check_box .inner .check_all input[type="checkbox"]{width:20px; margin-right:7px;}    
.check_box .inner .check_all label{margin-bottom:0; font-size:18px; font-weight:bold;}
.check_box .inner .check_remove{    font-size: 18px;
    background: white;
    border: #222 solid 1px;
    padding: 5px 10px;
    border-radius: 10px;
    font-weight: bold;}
</style>

<div class="check_box flex">
	<div class="inner flex">
		<div class="check_all flex">
			<input type="checkbox" id="check">
			<label for="check"> 전체선택 </label>
		</div>
		<div class="check_remove">
			<a href="javascript:void(0);">전체삭제</a>
		</div>
	</div>
</div>

<section id="basket" class="flex">
	<ul class="list">
	
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
				<a href="javascript:void(0);"><span class="material-symbols-outlined"> close </span></a>
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
	
	<div class="booklist_area">
		
			<ul>
				<li class="flex">
					<p>상품금액</p>
					<p><span>0</span>원</p>
				</li>
				<li class="flex">
					<p>배송비</p>
					<p><span>0</span>원</p>
				</li>
			</ul>
			<button type="submit">주문하기</button>
	</div>
</section>



<%@ include file="../inc/bottom.jsp"%>
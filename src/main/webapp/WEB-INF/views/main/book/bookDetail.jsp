<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<style>
#bookMain {
	width: 100%;
}

ul, li {
	list-style: none;
}

#topImg {
	width: 100%;
	margin: 0;
	padding: 0;
}

#topImg img {
	width: 100%;
	height: 500px;
}

#bookMain .container {
	margin: 0 auto;
	width: 100%;
}

#content {
	width: 1420px;
	margin-left: 215px;
	/* color: darkgrey; */
}

#sidebar {
	float: left;
	color: #ffbdbd;
	will-change: min-height;
}

#sidebar .sidebar__inner {
	position: relative;
	transform: translate(0, 0);
	transform: translate3d(0, 0, 0);
	will-change: position, transform;
}

.clearfix:after {
	display: block;
	content: "";
	clear: both;
}

#bookSellMainImg {
	width: 100%;
	height: 500px;
	margin: 0;
	padding: 0;
	margin-bottom: 200px;
}

#bookSellMainImg img {
	width: 1920px;
	height: 600px;
	margin: 0;
	padding: 0;
}

.container .clearfix {
	margin-left: 0;
	margin-right: 0;
}

#sidebar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 150px;
	background-color: #efefef;
}

#sidebar li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	font-weight: bold;
	text-decoration: none;
}

/* Change the link color on hover */
#sidebar li a:hover {
	background-color: #555;
	color: white;
}

/* 디테일 css */
.flex {
	display: flex;
	justify-content: space-between;
}

.pdList {
	margin: 0 auto;
	padding: 20px 0;
	border-top: 1px solid #aaa;
	border-bottom: 1px solid #aaa;
}

.pdList .pdimg {
	width: 40%;
	display: flex;
	align-items: center;
	background: #efefef;
	justify-content: center;
	padding: 20px 0;
}

.pdList .pdimg img {
	width: 50%;
	border: 1px #aaa solid;
}

.pdList .textbox {
	width: 55%;
}

.pdList h1 {
	text-align: center;
}

.pdList ul {
	width: 1300px;
	text-align: center;
	display: flex;
	justify-content: space-around;
}

.pdList ul li img {
	width: 150px;
	height: 250px;
}

.pdList .textbox tr {
	height: 35px;
	font-size: 18px;
}

.pdList .textbox tr>td {
	text-align: left;
	color: #333;
}

.pdList .textbox tr>td:nth-child(1) {
	
}

.pdList .textbox h1 {
	font-size: 30px;
	font-weight: bold;
	color: #333;
	padding: 20px 0 50px 0;
}

.pdList .textbox td.flex {
	justify-content: flex-start;
}

.pdList .textbox td.flex button {
	border: 0;
	background: #ee7843;
	color: white;
}

.pdList .textbox td.flex button span {
	padding-top: 5px;
}

.pdList .textbox td.flex>p {
	padding: 5px 15px;
	font-size: 18px;
	border: 1px #333 solid;
	margin: 0 5px;
}

.fixbox {
	position: fixed;
	bottom: 0px;
	width: 100%;
	box-shadow: 0px -5px 17px rgba(0, 0, 0, 0.1); padding : 20px 300px;
	background: white;
	z-index: 100;
	align-items: center;
	padding: 20px 300px;
}

.fixbox ul {
	margin-bottom: 0;
	align-items: center;
}

.fixbox ul li {
	margin: 0 5px;
	font-size: 20px;
}

.fixbox .left li:last-child {
	margin: 0;
	font-size: 26px;
}

.fixbox .left li:nth-child(2) {
	font-size: 26px;
	margin-right: 0;
	font-weight: bold;
}

.fixbox .right .flex button {
	border: 0;
	background: #ee7843;
	color: white;
	border-radius: 5px 0px 0px 5px;
	padding: 5px 10px;
}

.fixbox .right .flex button:last-child {
	border-radius: 0px 5px 5px 0px;
}

.fixbox .right .flex button span {
	padding-top: 5px;
}

.fixbox .right .flex>p {
	padding: 10px 20px;
	font-size: 18px;
	border: 2px #ee7843 solid;
	margin: 0px;
}

.fixbox .right li:nth-child(2) {
	padding: 10px 15px;
	border: #ee7843 2px solid;
	border-radius: 5px;
}

.fixbox .right li:nth-child(3) {
	padding: 10px 15px;
	background: #ee7843;
	border-radius: 5px;
	color: white;
}

/* 상세정보 */
.detail_tbox {
	padding: 0;
}

.detail_tbox .tab_menu {
	border-bottom: #ee7843 2px solid;
	margin-bottom: 30px;
}

.detail_tbox .tab_menu h4{
	color: #333;
	font-weight: bold;
}

.detail_tbox .tab_menu ul.flex {
	margin-bottom: 0 !important;
}

.detail_tbox .tab_menu ul.flex li.on {
	background: #ee7843;
	margin-right: 5px;
	border-radius: 5px 5px 0px 0px;
}

.detail_tbox .tab_menu ul.flex li.on a {
	background: #ee7843;
	color: white;
	padding: 10px 20px;
	border-radius: 5px 5px 0px 0px;
	width: 150px;
	text-align: center;
	display: block;
}

.detail_tbox .tab_menu ul.flex li.off {
	border: 2px #ee7843 solid;
	margin-right: 5px;
	border-bottom: 0;
	border-radius: 5px 5px 0 0;
}

.detail_tbox .tab_menu ul.flex li.off a {
	color: #ee7843;
	padding: 10px 20px;
	width: 150px;
	display: block;
	text-align: center;
}

.detail_tbox .tab_menu ~ul li {
	list-style: inside;
	padding-left: 20px;
	line-height: 28px;
}

.detail_tbox .tab_menu ~table td {
	border: 1px solid #666;
	border: collapse:collapse;
}

.sideBarBestBook{
	position: fixed;
    right: 0;
    top: 90px;
    margin-right: 10px;
    text-align: center;
}

.sideBarBestBook #sidebar li img{
	width: 80px;
	vertical-align: middle;
}

.sideBarBestBook #sidebar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 150px;
	background-color: #efefef;
}

.sideBarBestBook #sidebar li  {
	display: block;
	color: #ee7843;
	padding: 8px 16px;
	font-weight: bold;
	text-decoration: none;
}

/* Change the link color on hover */
.sideBarBestBook li a:hover {
	background-color: #555;
	color: white;
}
.highlight{color:blue;}

#q{ width:100%; border-bottom:2px #ee7843 solid; background:white; position:fixed; top:75px; left:0px; display:none; z-index:999;}
#q .tab_menu ul.flex li.on {
	background: #ee7843;
	margin-right: 5px;
	border-radius: 5px 5px 0px 0px;
	color:white;
}

#q .tab_menu ul.flex li.on a {
	background: #ee7843;
	color: white;
	padding: 10px 20px;
	border-radius: 5px 5px 0px 0px;
	width: 150px;
	text-align: center;
	display: block;
}

#q .tab_menu ul.flex li.off {
	border: 2px #ee7843 solid;
	margin-right: 5px;
	border-bottom: 0;
	border-radius: 5px 5px 0 0;
}

#q .tab_menu ul.flex li.off a {
	color: #ee7843;
	padding: 10px 20px;
	width: 150px;
	display: block;
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){


	$(window).scroll(function(){
		var sc = $(this).scrollTop();
		
		
		if( sc >= $('#detail').offset().top ){
			$("#q").show();
		}
		if( sc >= $('#notice').offset().top -5 ){
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(0), #q .tab_menu ul li:eq(2)").addClass('off');
			$("#q .tab_menu ul li:eq(1)").addClass('on');
		} else{
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(1), #q .tab_menu ul li:eq(2)").addClass('off');
			$("#q .tab_menu ul li:eq(0)").addClass('on');
		}
		if( sc >= $('#rule').offset().top - 5 ){
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(0), #q .tab_menu ul li:eq(1)").addClass('off');
			$("#q .tab_menu ul li:eq(2)").addClass('on');
		}
		if( sc < $('#detail').offset().top ){
			$("#q").hide();
		}
	});
})
</script>

<section id="q" class="detail_tbox" style="">
	<div class="flex tab_menu" style="width:1420px; margin:0 auto; justify-content:flex-end; border:0; ">
					<ul class="flex">
						<li class="on"><a href="#detail">상세정보</a></li>
						<li class="off"><a href="#notice">배송안내</a></li>
						<li class="off"><a href="#rule">교환/환불 정책</a></li>
					</ul>
				</div>
</section>
<div class="fixbox flex">
	<ul class="flex left">
		<li>총 상품 금액</li>
		<li>0</li>
		<li>원</li>
	</ul>

	<ul class="flex right">
		<li class="flex">
			<button class="plus">
				<span class="material-symbols-outlined"> remove </span>
			</button>
			<p class="tt">0</p>
			<button class="remove">
				<span class="material-symbols-outlined"> add </span>
			</button>
		</li>
		<li><button type="submit" style="background: none;border: 0;">장바구니</button></li>
		<li><button type="submit" style="background: none;border: 0;color:white;">바로구매</button></li>

	</ul>

</div>
<section id="bookMain" class="book">
	<div id="containerWrap" class="container clearfix"
		style="margin-left: 0; margin-right: 0; position: relative">
		<div id="sidebar" class="" style="">
			<div class="sidebar__inner shadow-sm bg-body rounded" style="position: relative;">
				<div>
					<ul>
						<li><a href="<c:url value='/main/book/bookList1'/>">검 사 자 료</a></li>
						<li><a href="<c:url value='/main/book/bookList1'/>">도 서</a></li>
						<li><a href="<c:url value='/main/book/bookList1'/>">기 타 교 구</a></li>
					</ul>
				</div>
				<div class="resize-sensor"
					style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
					<div class="resize-sensor-expand"
						style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
						<div
							style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
						</div>
					</div>
					<div class="resize-sensor-shrink"
						style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
						<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="content" style="margin-top: 30px;">
			<div class="pdList flex ">
				<div class="pdimg">
					<img src="https:/i.ibb.co/yhbwLJR/1.png" alt="1">
				</div>
				<div class="textbox">
					<h1>MBTI Form M 자가채점용</h1>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td width="100" height="22">가격</td>
								<td width="30" align="center">:</td>
								<td width="410" class="b Goods_Price" style="font-weight: bold">6,000 원</td>
							</tr>


							<tr>
								<td height="22">반품/교환</td>
								<td align="center">:</td>
								<td>반품/교환 가능 상품</td>
							</tr>
							<tr>
								<td height="22">배송비</td>
								<td align="center">:</td>
								<td>유료</td>
							</tr>
							<tr>
								<td height="22"></td>
								<td align="center"></td>
								<td class="f_blue" style="color: #eb5d1e">주문번호 당 합산금액 2만원 이상 무료배송, 2만원 미만 시 3천원</td>
							</tr>
							<!-- <tr>
							<td height="22">주문수량</td>
							<td align="center"> :</td>
							<td class="flex">
								<button class="plus"><span class="material-symbols-outlined"> add </span></button>
								<p class="tt">0</p>
								<button class="remove"><span class="material-symbols-outlined"> remove </span></button>
							</td>
						</tr> -->
							<!-- <tr>
							<td height="22">합계</td>
							<td align="center"> :</td>
							<td class="f_red b Goods_Total_Price">108,000 원</td>
						</tr> -->
							<tr>
								<td height="22">상품코드</td>
								<td align="center">:</td>
								<td>1</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>

			<div id="detail" style="height: 75px"></div>
			<section class="detail_tbox">
				<div class="flex tab_menu">
					<h4>상세소개</h4>
					<ul class="flex">
						<li class='on'><a href="#detail">상세정보</a></li>
						<li class='off'><a href="#notice">배송안내</a></li>
						<li class='off'><a href="#rule">교환/환불 정책</a></li>
					</ul>
				</div>
				<ul>
					<span>* 상세정보</span>
					<p></p>
				</ul>

			</section>
			<div id="notice" style="height: 75px"></div>
			<section class="detail_tbox">
				<div class="flex tab_menu">
					<h4>배송안내</h4>
					<ul class="flex">
						<li class='off'><a href="#detail">상세정보</a></li>
						<li class='on'><a href="#notice">배송안내</a></li>
						<li class='off'><a href="#rule">교환/환불 정책</a></li>
					</ul>
				</div>
				<ul>
					<span>* 배송비</span>
					<li>총 결제금액이 2만원 이상일 경우 무료배송이며, 2만원 미만 시 3천원의 배송비가 부담됩니다.</li>
				</ul>
				<ul>
					<span>* 출고 안내</span>
					<li><span class="highlight">오후 5시까지 주문하신 상품은 평일 다음날 출고</span> 됩니다. (토, 공휴일 제외)</li>
					<li><span class="highlight">오후 5시 이후 주문은 평일 다 다음날 출고</span> 됩니다. (토, 공휴일 제외)<br> <u>예시)
							<strong>금요일 5시 이후 주문은 다음주 평일 화요일에 출고</strong> 됩니다.
					</u></li>
					<li>단, 개인이 무통장입금으로 주문하신 경우<br> 주문하신 다음날 오전 12시 까지 입금이 되어야 합니다.<br></li>
					<li>구매하시는 품목의 수량이 300부 이상일 경우 출고 지연이 될 수 있습니다.</li>

				</ul>
				<ul>
					<li>모든 상품은 발송일로부터 2~3일 후 받아보실 수 있습니다.(토, 공휴일 제외)<br> 발송 후 주문 시 입력하신 핸드폰 번호로 [택배 송장
						번호] 안내 문자를 보내드립니다.
					</li>
					<li>겨울철 기상악화로 인해 지역별로 배송이 지연될 수 있습니다.</li>
					<li>명절, 공휴일은 택배 도착 예정일이 평소 보다 지연될 수 있습니다.</li>
				</ul>

			</section>
			<div id="rule" style="height: 75px"></div>
			<section class="detail_tbox">
				<div class="flex tab_menu">
					<h4>교환/환불 정책</h4>
					<ul class="flex">
						<li class='off'><a href="#detail">상세정보</a></li>
						<li class='off'><a href="#notice">배송안내</a></li>
						<li class='on'><a href="#rule">교환/환불 정책</a></li>
					</ul>
				</div>
				<table width="100%" border="0" cellspacing="0" cellpadding="5" class="bor_tb">
					<tbody>
						<tr>
							<td width="300" class="bor_td bor_right b" align="center" colspan="2">항목</td>
							<td class="b bor_td" align="center">정책</td>
						</tr>
						<tr>
							<td width="130" class="bor_td bor_right b" align="center" rowspan="3">오프라인 상품</td>
							<td width="170" class="bor_td bor_right b" align="center">검사지/답안지</td>
							<td class="bor_td pl_10 lh_con">상품 수령일로부터 30일 이내</td>
						</tr>
						<tr>
							<td class="bor_td bor_right b" align="center">도서</td>
							<td class="bor_td pl_10 lh_con">* 교환 불가능 (단, 상품 불량/오배송/파손의 경우 상품 수령일로부터 7일 이내 교환 가능)<br>*
								환불 : 상품 수령일로부터 7일 이내
						</td>
						</tr>
						<tr>
							<td class="bor_td bor_right b" align="center">교환/환불 조건</td>
							<td class="bor_td pl_10 lh_con">* 상품을 개봉 또는 사용한 경우 교환/반품 불가능<br>(할인 및 서비스 품목이 함께
								제공된 경우 혜택도 함께 반품)<br>* 단기간에 열람이 가능한 상품은 교환 및 환불 불가능<br>(CD, 카드, 엽서, 화첩집, 일부 도서 등)<br>*
								대여검사지 교환/환불 불가능 (사용여부 관계없음)<br>* 기관 내 전문가 부재로 검사사용이 불가능한 경우 상품 금액의 20% (수수료 및 관리비용)<br>차감
								후 환불가능 (단, 검사/답안지는 최근 개정판 구매 건만 가능)<br>* 단순변심, 착오주문으로 인한 반품 및 교환 시 배송비용은 고객부담
						</td>
						</tr>
						<tr>
							<td class="bor_td bor_right b" align="center" rowspan="2">온라인 상품</td>
							<td class="bor_td bor_right b" align="center">예치금</td>
							<td class="bor_td pl_10 lh_con">* 교환 : 구매일로부터 30일 이내<br>* 환불 : 예치금 적립일로부터 14일 이내<br>*
								부분환불 : 사용하고 남은 예치금에 대한 부분환불 가능 (14일 이내)
						</td>
						</tr>
						<tr>
							<td class="bor_td bor_right b" align="center">교환/환불 조건</td>
							<td class="bor_td pl_10 lh_con">기관 내 전문가 부재로 검사사용이 불가능한 경우 상품금액의 20% (수수료 및 관리비용)<br>차감
								후 환불
						</td>
						</tr>
						<tr>
							<td class="bor_td bor_right b" align="center" colspan="2">온·오프라인 교환</td>
							<td class="bor_td pl_10 lh_con">검사 구매 후 30일 이내 교환가능 (배송비용 발생 시 고객부담)</td>
						</tr>
						<tr>
							<td class="bor_right b" align="center" colspan="2">교환/환불 방법</td>
							<td class="pl_10 lh_con">자료구매 주문/배송 조회페이지에서 [교환접수] / [환불접수] 신청, 고객지원센터 02)787-1400 접수</td>
						</tr>
					</tbody>
				</table>

			</section>

			<div class="resize-sensor"
				style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
				<div class="resize-sensor-expand"
					style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
					<div
						style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
					</div>
				</div>
				<div class="resize-sensor-shrink"
					style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
					<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/js/rAF.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ResizeSensor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sticky-sidebar.js'/>"></script>
	<script type="text/javascript">
			var a = new StickySidebar('#sidebar', {
				topSpacing : 500
			});
		</script>
</section>
<!--  -->
			<nav class="sideBarBestBook">
			<div id="sidebar" class="" style="">
			<div class="sidebar__inner shadow-sm bg-body rounded" style="position: relative;">
				<div>
					<ul>
						<li>이 분야 베스트3</li><br>
						<li>
							<i class="bi bi-1-square-fill"></i><br>
							<img src="<c:url value='/images/bookProduct/1.jpg'/>">
							<div>책 이름 넣기</div>
						</li>
						<li>
							<i class="bi bi-2-square-fill"></i></i><br>
							<img src="<c:url value='/images/bookProduct/1.jpg'/>" >
							<div>책 이름 넣기</div>
						</li>
						<li>
							<i class="bi bi-3-square-fill"></i></i><br>
							<img src="<c:url value='/images/bookProduct/1.jpg'/>">
							<div>책 이름 넣기</div>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
		</nav>	
			<!--  -->
<%@ include file="../inc/bottom.jsp"%>
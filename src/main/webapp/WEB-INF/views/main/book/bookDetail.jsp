<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<script type="text/javascript">

	$(function(){
		var i = $("#bookCnt input[name=ordersQty]").val();
		
		$("#add").click(function(){
			i++;
			$("#bookCnt input[name=ordersQty]").val(i);
			var totalPrice = (i*${vo.bookPrice});
			$("#totalPrice").text(totalPrice);
		});
		
		$("#remove").click(function(){
			i=(i-1);
			if(i < 1) i=0;
			$("#bookCnt input[name=ordersQty]").val(i);
			var totalPrice = (i*${vo.bookPrice});
			$("#totalPrice").text(totalPrice);
		});
		
		$(".gogo").click(function(){
			var qty = $("#bookCnt input[name=ordersQty]").val();
			if(qty < 1){
				$('#alertModalBody').html("수량을 1이상으로 입력해주세요.");
				$('#alertModalBtn').trigger('click');
				return false;
			}
			$("#frmOrder input[name=basketQty]").val(qty);
			var type="";
			if($(this).attr('id') == 'toBasket'){ //장바구니 담기
				type="cart";
			} else if($(this).attr('id') == 'toPurchase'){ // 바로 구매
				type="order";
			}
			$('#frmOrder').prop('action',
					"<c:url value='/main/book/basket/basketInsert?mode=" + type + "'/>");
			$('#frmOrder').submit();
		});
		
	});
	
	/* function gotoBasket(){
		var cnt = $("#bookCnt input[name=pop_out]").val();
		$("input[name=ordersQty]").val(cnt);
		$("#frmOrder").submit();
	} */

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
<form id="frmOrder" method="post" action="<c:url value='/main/book/basketInsert'/>">
	<input type="hidden" name="basketQty">
	<input type="hidden" name="bookNo" value="${vo.bookNo}">
</form>
<div class="fixbox flex">
	<ul class="flex left">
		<li>총 상품 금액</li>
		<li id="totalPrice">0</li>
		<li>원</li>
	</ul>
	<ul class="flex right">
		<li class="flex">
			<button id="remove">
				<span class="material-symbols-outlined"> remove </span>
			</button>
			<p id="bookCnt" class="tt">
				<input type="text" readonly="readonly"  name="ordersQty" value="0" style="text-align: center; border: 0;width: 50px;text-align: center;">
			</p>
			<button id="add">
				<span class="material-symbols-outlined"> add </span>
			</button>
			
		</li>
		<li><button class="gogo" id="toBasket" type="button" style="background: none;border: 0;">장바구니</button></li>
		<li><button class="gogo" id="toPurchase" type="submit" style="background: none;border: 0;color:white;">바로구매</button></li>
	</ul>
</div>

<section id="bookMain" class="book">
	<input id="frmPageCategory" type="hidden" name="bookCategory" value="${param.bookCategory}">
	<div id="containerWrap" class="container clearfix" style="margin-left: 0; margin-right: 0; position: relative">
		<%@ include file="./BookSideBarLeft.jsp"%>
		<div style="padding-left: 222px;margin-top: 50px;margin-bottom: 10px">
		<a href="/mbti/main/index"><i class="bi bi-house-door-fill"></i></a>
		/
		<a href="/mbti/main/book/bookMain">도서 및 자료 구매</a>
		/
		<a href="/mbti/main/book/bookList1?bookCategory=${param.bookCategory}">${param.bookCategory}</a>
	</div>
		<div id="content" style="margin-left: 216px;">
			<div id="detailMain" class="pdList flex shadow-sm rounded" style="border: 0;">
				<div class="pdimg shadow-sm rounded">
					<img class="shadow-sm rounded" src="<c:url value='/images/bookProduct/upload_img/${vo.bookImgName}'/>" alt="${vo.bookImgOriginalname}">
				</div>
				<div class="textbox ">
				<c:set var="title" value="${vo.bookTitle}"/>
				<c:set var="length" value="${fn:length(title)}"/>
				<c:if test="${length > 21}">
					<c:set var="title1" value="${fn:substring(title, 0, 22)}"/>
					<c:set var="title2" value="${fn:substring(title, 22, length)}"/>
					<h1>${title1}<br>${title2}<span class="smallCategory">${vo.bookCategory}</span></h1>
				</c:if>
				<c:if test="${length <= 21}">
					<h1>${vo.bookTitle}<span class="smallCategory">${vo.bookCategory}</span></h1>
				</c:if>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td width="100" height="22">가격</td>
								<td width="30" align="center">:</td>
								<td width="410" class="b Goods_Price" style="font-weight: bold;" id="tdTP">
									<fmt:formatNumber value="${vo.bookPrice}" pattern="#,###"/>원
								</td>
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
								<td>${vo.bookNo}</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>

			<div id="detail" style="height: 75px"></div>
			<section class="detail_tbox">
				<div id="detail_ul" class="flex tab_menu">
					<h4>상세소개</h4>
					<ul class="flex">
						<li class='on'><a href="#detail">상세정보</a></li>
						<li class='off'><a href="#notice">배송안내</a></li>
						<li class='off'><a href="#rule">교환/환불 정책</a></li>
					</ul>
				</div>
				<ul>
					<span>* 상세정보</span>
					<p>${vo.bookDetails}</p>
					<p>${vo.bookExplains}</p>
				</ul>

			</section>
			<div id="notice" style="height: 75px"></div>
			<section class="detail_tbox">
				<div id="notice_ul" class="flex tab_menu">
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
				<div id="rule_ul" class="flex tab_menu">
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
							<td class="pl_10 lh_con">자료구매 주문/배송 조회페이지에서 [교환접수] / [환불접수] 신청, 고객지원센터 02)000-0000 접수</td>
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
				topSpacing : 150
			});
		</script>
</section>
<!--  -->
	
<!--  -->
<c:import url="/main/book/BookSideBar"/>
<%@ include file="../inc/bottom.jsp"%>
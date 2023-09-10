<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">
<style>

#mypadge_orderlist .inner{ margin-left:13.5%; width:85%; margin-top:50px;}
#mypadge_orderlist p{margin:0; padding:0;}
	#mypadge_orderlist .delivery{padding:10px; border:2px #ee7843 solid; border-radius: 10px; margin:0 auto; margin-bottom:50px; width:1300px; }
      #mypadge_orderlist   .delivery .flex{display: flex; align-items: center; justify-content: space-between;}
       #mypadge_orderlist  .delivery .flex li{text-align: right; border-right: 1px #ddd solid; padding:5px 30px; width:24%;}
       #mypadge_orderlist  .delivery .flex li:last-child{border:0;}
       #mypadge_orderlist  .delivery .flex li p:first-child{font-size: 28px; font-weight: bold; color:#333;}
       #mypadge_orderlist  .delivery .flex li p:last-child{font-size: 18px; color:#666;}
       #mypadge_orderlist #section {margin:0 auto; width:1300px;}
       #mypadge_orderlist #section .booklist li{width:1300px;}
       #mypadge_orderlist #section .cancel_box {width:45%;}
       #mypadge_orderlist #section .cancel_box p:nth-child(2) {font-weight:bold;}
       #mypadge_orderlist #section .cancel_box button{background:#ee7843; color:white; padding:10px 50px; border:0;}
</style>
<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<script type="text/javascript">
	function ordersInput(element){
		var i = $(element).parent().parent().find('a strong').text();
		$('.modal-footer input[name=hiddenOrdersNo]').val(i);
	}
	function cancleOrder(){
		var ordersNo = $('.modal-footer input[name=hiddenOrdersNo]').val();
		location.href="<c:url value='/main/mypage/mypageOrderCancle?ordersNo=" +ordersNo+ "'/>";
	}
</script>
<section id="mypadge_orderlist">
	<div class="inner shadow-sm p-5 bg-body rounded">
	<div class="delivery ">
        <ul class="flex">
            <li> 
                <p>${cnt2}</p>
                <p>주문완료</p>
            </li>
            <li>
                <p>${cnt3}</p>
                <p>배송중</p>
            </li>
            <li>
                <p>${cnt4}</p>
                <p>배송 완료</p>
            </li>
            <li>
                <p>${cnt1}</p>
                <p>취소</p>
            </li>
        </ul>

    </div>

	<div id="section">
		<p style="padding-bottom: 20px">${fn:length(orderList)} 개의 주문내역이 있습니다.</p>
		<div id="content">
			<ul class="booklist" style="padding-left:0;">
				<%-- <c:if test="${empty list }">
					<li class="flex">
						<div style="height: 500px; text-align: center;">
							<div style="margin-left: 500px;margin-top: 110px;">
								<p>검색 결과 해당 제품은 없습니다.</p>
								<img src="<c:url value='/images/empty.jpg'/>" alt="해당 제품이 현재 없습니다."
								 class="">
							</div>
						</div>
					</li>
				</c:if>
				<c:if test="${!empty list }"> 
				<c:forEach var="vo" items="${list}">--%>
				<c:forEach var="list" items="${orderList }">
					
					<li class="flex">
						<div class="title" style="padding-left: 0;">
						<a class="shadow-sm rounded" style="background: #00FF40;" href="<c:url value='/main/mypage/myOrdersDetail?ordersNo=${list.mainOrderVo.ordersNo}'/>">주문번호 : <strong>${list.mainOrderVo.ordersNo}</strong>상세보기</a>
							<c:forEach var="map" items="${list.orderDetailList }">
								<div class="orderItems flex" style="display: flex;justify-content: flex-start;">
									<a href="<c:url value='/main/book/bookDetail?bookNo=${map.BOOK_NO}&bookCategory=${map.BOOK_CATEGORY}'/>">
										<img class="shadow-sm bg-body rounded" alt="${map.BOOK_IMG_ORIGINALNAME}" src="<c:url value='/images/bookProduct/upload_img/${map.BOOK_IMG_NAME}'/>" style="width: 120px;">
									</a>
									<div>
										<p class="box">${map.BOOK_CATEGORY}</p>
										<c:set var="title" value="${map.BOOK_TITLE}"/>
										<c:set var="len" value="${fn:length(title)}"/>
										<c:if test="${len > 23}">
											<c:set var="part" value="${fn:substring(title, 23, len)}"/>
											<c:set var="part2" value="${fn:substring(title, 0, 23)}"/>
											<a href="<c:url value='/main/book/bookDetail?bookNo=${map.BOOK_NO}&bookCategory=${map.BOOK_CATEGORY}'/>">${part2}<br>${part}</a>
										</c:if>
										<c:if test="${len <= 23}">
											<a href="<c:url value='/main/book/bookDetail?bookNo=${map.BOOK_NO}&bookCategory=${map.BOOK_CATEGORY}'/>">${title}</a>
										</c:if>
										<p><span>작가 : ${map.BOOK_WRITER}</span> | <span style="padding-left:5px">출판사 : ${map.BOOK_PUBLISHER}</span></p>
										<br>
										<p><span>가격 : <fmt:formatNumber value="${map.BOOK_PRICE}" pattern="#,###"/>원</span> | <span> 수량 : ${map.ORDERS_QTY}개</span></p>
									</div>								
								</div><br>
							</c:forEach>							
						</div>
						<div class="flex cancel_box">
							<p><span>가격 : </span><fmt:formatNumber value="${list.mainOrderVo.sumPrice}" pattern="#,###"/>원</p>
							<p>${list.orderDetailList[0].ORDERS_STATE}</p>
							<c:if test="${list.orderDetailList[0].ORDERS_STATE != '구매 확정' and list.orderDetailList[0].ORDERS_STATE  != '취소 완료' and list.orderDetailList[0].ORDERS_STATE  != '취소 신청'}">
								<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap"
									onclick="ordersInput(this)"
								>취소 신청</button>
							</c:if>
						</div>
					</li>
				</c:forEach>
				<%--</c:forEach>
				 </c:if> --%>
			</ul>
		</div>
	</div>
	</div>
</section>

<!-- 취소 신청 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">주문 취소하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">다시 한번 생각해보세요</label>
            <p> </p>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">주의사항<br>취소 후에는 주문내역에서 전부 사라집니다.</label>
            <p><br>주문을 정말로 취소하시겠습니까?</p>
          </div>
        </form>
      </div>
      <div class="modal-footer">
      	<input type="hidden" name="hiddenOrdersNo">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="cancleOrder()">취소 진행하기</button>
      </div>
    </div>
  </div>
</div>
<!--  -->

<%@include file="../inc/bottom.jsp" %>
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

<section id="mypadge_orderlist">
	<div class="inner shadow-sm p-5 bg-body rounded">
	<div class="delivery ">
        <ul class="flex">
            <li> 
                <p>0</p>
                <p>주문완료</p>
            </li>
            <li>
                <p>0</p>
                <p>배송중</p>
            </li>
            <li>
                <p>0</p>
                <p>배송완료</p>
            </li>
            <li>
                <p>0</p>
                <p>취소</p>
            </li>
        </ul>

    </div>

	<div id="section">
		<p>${pagingInfo.totalRecord} 개의 검색 결과가 있습니다.</p>
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
					<li class="flex">
						<div class="flex title">
							<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${param.bookCategory}'/>">
								<img class="shadow-sm bg-body rounded" alt="1" src="<c:url value='/images/bookProduct/1.jpg'/>" style="width: 120px;">
							</a>
							<div>
								<p class="box">${vo.bookCategory}</p>
								<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${param.bookCategory}'/>">${vo.bookTitle}</a>
								<p><span>작가 : ${vo.bookWriter}</span> | <span style="padding-left:5px">출판사 : ${vo.bookPublisher}</span></p>
								
							</div>
							
						</div>
						<div class="flex cancel_box">
							<p><span>가격 : </span><fmt:formatNumber value="${vo.bookPrice}" pattern="#,###"/>원</p>
							<p>주문완료</p>
							<button>취소 신청</button>
						</div>
					</li>
				<%--</c:forEach>
				 </c:if> --%>
			</ul>
		</div>
	</div>
	</div>
</section>

<%@include file="../inc/bottom.jsp" %>
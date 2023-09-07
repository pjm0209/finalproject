<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>

<section>
	
	<div id="containerWrap" class="container clearfix" style="margin-left: 0;margin-right: 0;position: relative">
		
		<div id="section">
			<p>${pagingInfo.totalRecord} 개의 검색 결과가 있습니다.</p>
			<div id="content">
				<ul class="booklist" style="padding-left:0;">
					<c:if test="${empty list }">
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
					<c:forEach var="vo" items="${list}">
						<li class="flex">
							<div class="flex title">
								<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${param.bookCategory}'/>">
									<img class="shadow-sm bg-body rounded" alt="${vo.bookImgOriginalname}" src="<c:url value='/images/bookProduct/upload_img/${vo.bookImgName}'/>" style="width: 120px;">
								</a>
								<div>
									<p class="box">${vo.bookCategory}</p>
									<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${param.bookCategory}'/>">${vo.bookTitle}</a>
									<p><span>가격 : </span><fmt:formatNumber value="${vo.bookPrice}" pattern="#,###"/>원</p>
									<p><span>작가 : ${vo.bookWriter}</span> | <span style="padding-left:5px">출판사 : ${vo.bookPublisher}</span></p>
									
								</div>
								
							</div>
							<form name="frmBuy" method="post">
								<div class="btn">
									<button class="cartBtn" type="button">장바구니</button>
									
									<button class="orderBtn" type="button">바로구매</button>
									<input type="hidden" name="bookNo" value="${vo.bookNo}">
									<input type="hidden" name="basketQty" value="1">
								</div>
							</form>
						</li>
					</c:forEach>
					</c:if>
				</ul>
			</div>
			
			<div class="resize-sensor" style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: 	hidden;">
				<div class="resize-sensor-expand" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; 		overflow: hidden; z-index: -1; visibility: hidden;">
					<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; 				height: 100000px;">
					</div>
				</div>
				<div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; 			overflow: hidden; z-index: -1; visibility: hidden;">
					<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
				</div>
			</div>
			
		</div>
	</div>
	<!-- 페이지 번호 추가 -->	
	<nav id="bookPaging" class="bookPaging" aria-label="Page navigation example" style="margin-top: 50px;">
	  <ul class="pagination pagination-lg justify-content-center">
	  	<c:if test="${pagingInfo.firstPage > 1 }">
		    <li class="page-item">
		      <a class="page-link" href="#" onclick="bookListPage(${pagingInfo.fistPage - 1})" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
	    </c:if>
	    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
	    	<c:if test="${i == pagingInfo.currentPage }">
			    <li class="page-item active"><a class="page-link" href="javascript:void(0);">${i }</a></li>		    
	    	</c:if>
	    	<c:if test="${i != pagingInfo.currentPage }">
			    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="bookListPage(${i})">${i }</a></li>		    
	    	</c:if>
	    </c:forEach>
	    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
		    <li class="page-item">
		      <a class="page-link" href="javascript:void(0);" aria-label="Next" onclick="bookListPage(${pagingInfo.lastPage + 1})">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
	    </c:if>
	  </ul>
	</nav>
	<!--  페이지 번호 끝 -->
</section>

<%@include file="../inc/bottom.jsp" %>
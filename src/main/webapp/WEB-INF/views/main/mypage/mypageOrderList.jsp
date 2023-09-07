<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>

<section>
	
	<div id="containerWrap" class="container clearfix" style="margin-left: 230px;margin-right: 0;position: relative">
		
		<div id="section" style="margin:30px 0 0 0;">
			<h2>주문/배송목록</h2>
			<div id="content">
				<ul class="booklist" style="padding-left:0;">
					<c:if test="${empty orderList }">
						<li class="flex">
							<div style="height: 500px; text-align: center;">
								<div style="margin-left: 500px;margin-top: 110px;">
									<p>주문내역이 없습니다..</p>
									<img src="<c:url value='/images/empty.jpg'/>" alt="해당 제품이 현재 없습니다."
									 class="">
								</div>
							</div>
						</li>
					</c:if>
					<c:if test="${!empty orderList }">
					<c:forEach var="map" items="${orderList}">
						<li class="flex">
							<div class="flex title"></div>
						</li>
					</c:forEach>
					</c:if>
				</ul>
			</div>			
		</div>
	</div>
</section>

<%@include file="../inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.sideBarBestBook3{
	position: absolute;
    right: 0;
     /*top: 760px;*/
    margin-right: 10px;
    text-align: center;
}

.sideBarBestBook3 #sidebar li img{
	width: 80px;
	vertical-align: middle;
}

.sideBarBestBook3 #sidebar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 150px;
	background-color: #efefef;
}

.sideBarBestBook3 #sidebar li  {
	display: block;
	color: #ee7843;
	padding: 8px 16px;
	font-weight: bold;
	text-decoration: none;
}
	
</style>
<nav class="sideBarBestBook3" style="top:835px;">
	<div id="sidebar" class="" style="">
		<div class="sidebar__inner shadow-sm bg-body rounded" style="position: relative;">
			<div>
				<ul>
					<c:if test="${param.bookCategory==null or param.bookCategory==''}">
						<li>전체 베스트3</li><br>
					</c:if>
					<c:if test="${param.bookCategory != '' and param.bookCategory != null }">
						<li>${param.bookCategory} BEST3</li><br>
					</c:if>
					<c:forEach var="map" items="${best3}">
						<li>
							<a href="<c:url value='/main/book/bookDetail?bookNo=${map.BOOK_NO}&bookCategory=${param.bookCategory}'/>">
								<i class="bi bi-1-square-fill"></i><br>
								<img src="<c:url value='/images/bookProduct/upload_img/${map.BOOK_IMG_NAME}'/>" alt="${map.BOOK_IMG_ORIGINALNAME}">
								<div>${map.BOOK_TITLE}</div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</nav>
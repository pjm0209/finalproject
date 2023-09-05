<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
	
<script type="text/javascript">


function bookListPage(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[id=frmPageId]').submit();
}
function sendSearchKeyword(){
	var searchKeyword = $("input[name=inputKeyword]").val();
	if(searchKeyword == null || searchKeyword == ''){
		$("#searchKeyword").val("");
		alert("검색어를 입력하세요");
		return false;
	}
	$("#searchKeyword").val(searchKeyword);
	$("#frmPageId").submit();
}
</script>
<section>
	<!-- Begin Page Content -->
	<form id="frmPageId" name="frmPage" method="post" action="<c:url value='/main/book/bookList1'/>">
		<input id="frmPageCategory" type="hidden" name="bookCategory" value="${param.bookCategory}">
		<input id="searchKeyword" type="hidden" name="searchKeyword">
		<input type="hidden" name="currentPage" value="1">
	</form>
	<!-- Page Heading -->
	<div id='bookSellMainImg' class=" bookslide shadow-sm p-3 mb-5 bg-body rounded">
			<ul class="gallery ">
				<li><img src="<c:url value='/images/bookProduct/slide_01.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_02.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_03.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_04.jpg'/>"></li>
			</ul>
	</div>
	<div style="padding-left: 240px;margin-top: 50px;">
		<a href="/mbti/main/index"><i class="bi bi-house-door-fill"></i></a>
		/
		<a href="/mbti/main/book/bookMain">도서 / 자료 구매</a>
		/
		<a href="/mbti/main/book/bookList1?bookCategory=${param.bookCategory}">${param.bookCategory}</a>
	</div>
	<div class="flex title_search">
		<h2 style="margin-top: 20px">검사자료 구매</h2>
		<div class="booksearch flex">
			<input type="text" name="inputKeyword" value="${searchKeyword}">
				<button id="searchCategory" type="button" onclick="sendSearchKeyword()">
					<span class="material-symbols-outlined">search</span>
				</button>
		</div>
	</div>
	<div id="containerWrap" class="container clearfix" style="margin-left: 0;margin-right: 0;position: relative">
		<%@ include file="./BookSideBarLeft.jsp"%>
		
		<div id="section">
			<div id="content">
				<ul class="booklist" style="padding-left:0;">
					<c:forEach var="vo" items="${list}">
						<li class="flex">
							<div class="flex title">
								<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${param.bookCategory}'/>">
									<img class="shadow-sm bg-body rounded" alt="${vo.bookImgOriginalname}" src="<c:url value='/images/bookProduct/upload_img/${vo.bookImgName}'/>" style="width: 120px;">
								</a>
								<div>
									<p class="box">${vo.bookCategory}</p>
									<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${param.bookCategory}'/>">${vo.bookTitle}</a>
									<p><span>가격 | </span><fmt:formatNumber value="${vo.bookPrice}" pattern="#,###"/>원</p>
									<p><span>작가 | </span>${vo.bookWriter}<span style="padding-left:5px">출판사 | </span>${vo.bookPublisher}</p>
									
								</div>
								
							</div>
							<div class="btn">
								<a href="<c:url value='/main/book/bookOrderMain'/>">장바구니</a>
								<a href="#">바로구매</a>
							</div>
						</li>
					</c:forEach>
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
			<script type="text/javascript" src="<c:url value='/js/rAF.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/js/ResizeSensor.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
			<script type="text/javascript" src="<c:url value='/js/sticky-sidebar.js'/>"></script>
			<script type="text/javascript">
				var a = new StickySidebar('#sidebar', {
					topSpacing : 500
				});
				
			</script>
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
<!-- 직접 만든 sidebar -->
<%@ include file="./BookSideBar.jsp"%>
<%@ include file="../inc/bottom.jsp"%>
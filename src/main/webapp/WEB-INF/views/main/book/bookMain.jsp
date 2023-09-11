<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<script type="text/javascript">

function goCart(element){
	   $(element).parent().parent().prop("action", "<c:url value='/main/book/basket/basketInsert?mode=cart'/>");
	   $(element).parent().parent().submit();
}

function goOrder(element){
	$(element).parent().parent().prop("action", "<c:url value='/main/book/basket/basketInsert?mode=order'/>");
	$(element).parent().parent().submit();
}

function bookListPage(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[id=frmPageId]').submit();
}
function sendSearchKeyword(){
	var searchKeyword = $("input[name=inputKeyword]").val();
	if(searchKeyword == null || searchKeyword == ''){
		$("#searchKeyword").val("");
		$('#alertModalBody').html("검색어를 입력하세요.");
		$('#alertModalBtn').trigger('click');
		return false;
	}
	$("#searchKeyword").val(searchKeyword);
	$("#frmPageId").submit();
}

var contextPath = "/mbti";

function ajaxInsertCart(element){
	var bookNo = $(element).parent().find('input[type=hidden]').val();
	$.ajax({
		url: contextPath + "/main/book/basket/mainAjaxInsertBasket",
		type:"post",
		data: {
			bookNo: bookNo,
			basketQty: 1
		},
		success:function(result){
			if(result > 0){
				$('#confirmModalBody').html("장바구니에 넣었습니다.장바구니로 이동할까요?");
				$('#confirmOk').attr("onclick","location.href='"+contextPath+"/main/mypage/mypageBasket'");
				$('#confirmModalBtn').trigger('click');
			} else {
				$('#alertModalBody').html("오류로 인해 장바구니에 넣기 실패했습니다.나중에 다시 시도해주세요.");
				$('#alertModalBtn').trigger('click');
			}
		},
		error:function(xhr, status, error){
			alert(xhr + status + error);
		}
	});	
}

</script>

<section id="bookMain" class="book">
	<div id='bookSellMainImg' class=" bookslide shadow-sm p-3 mb-5 bg-body rounded">
		<ul class="gallery" style="padding-left: 0;">
			<%-- <li><img src="<c:url value='/images/bookProduct/slide_01.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_02.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_03.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/slide_04.jpg'/>"></li> --%>
			<!--추가 이미지  -->
			<li><img src="<c:url value='/images/bookProduct/bookMain1.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/bookMain2.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/bookMain3.jpg'/>"></li>
			<li><img src="<c:url value='/images/bookProduct/bookMain2.jpg'/>"></li>
			<!--  -->
		</ul>
	</div>
	<div style="padding-left: 240px; margin-bottom:20px;">
		<a href="<c:url value='/main/index'/>"><i class="bi bi-house-door-fill"></i></a>
		/
		<a href="<c:url value='/main/book/bookMain'/>">도서 및 자료 구매</a>
	</div>
	<div id="containerWrap" class="container clearfix" style="margin-left: 0; margin-right: 0;position: relative">
		<%@ include file="./BookSideBarLeft.jsp"%>
		<div id="content">
			<%-- <div id="topImg" style="text-align: center;">
				<img src="<c:url value='/images/72939_11192_2044.jpg'/>">
			</div> --%>
			<div class="flex shadow-sm bg-body rounded">
				<div class="bestbook flex">
					 <img class="shadow-sm bg-body rounded" src="<c:url value='/images/bookProduct/1.jpg'/>" alt="">
					 <div class="textbox">
					 	<p>MBTI Form M<br> 자가채점용</p>
					 	<p>MBTI Form M 자가채점용은<br> 검사지, 답안지, 프로파...</p>
					 	<p>6,800원</p>
					 	<button onclick="location.href='bookDetail?bookNo=1&bookCategory=검사자료'">자세히 보기</button>
					 </div>
				</div>
				<div class="booksearch shadow-sm bg-body rounded">
					<img src="<c:url value='/images/searchBook2.jpg'/>" alt="책검색이미지">
					<input name="inputKeyword" type="text" style="margin-top: 26px;" placeholder="저자 또는 상품명" value="${searchKeyword}">
					<button id="searchCategory" type="button" onclick="sendSearchKeyword()" style="margin-top: 26px;">
						<span class="material-symbols-outlined">search</span>
					</button>
				</div>
			</div>  
			<c:if test="${empty searchKeyword}">
				<div class="pdList">
					<a href="#" class="display-3">
						도서부분 인기상품
						<span class="material-symbols-outlined">chevron_right</span>
					</a>
					<ul class="aa-product-catg">
						<!-- start single product item -->
						<c:forEach var="bookVo1" items="${bookList1}">
							<li>
								<figure>
									<c:set var="title" value="${bookVo1.BOOK_TITLE}"/>
									<c:set var="len" value="${fn:length(title)}"/>
									<c:if test="${len > 21}">
									<c:set var="part" value="${fn:substring(title, 21, len)}"/>
									<c:set var="part2" value="${fn:substring(title, 0, 21)}"/>
										<c:set var="title"
										 value="${fn:replace(title, part, '...')}"/>
									</c:if>
									<a class="aa-product-img"
									 href="<c:url value='/main/book/bookDetail?bookNo=${bookVo1.BOOK_NO}'/>">
										<img style="margin: 10px 0;" class="shadow-sm bg-body rounded"
										 src="<c:url value='/images/bookProduct/upload_img/${bookVo1.BOOK_IMG_NAME}'/>"
										 alt="${bookVo1.BOOK_TITLE}이미지">
									<figcaption>
										<h5 class="aa-product-title">
											<b>${title}</b>
										</h5>
										<span class="aa-product-price">
											<fmt:formatNumber value="${bookVo1.BOOK_PRICE}" pattern="#,###"/>
										</span>원
									</figcaption>
									</a>
									<br>
									<input type="hidden" value="${bookVo1.BOOK_NO}">
									<a class="aa-add-card-btn" href="javacript:void(0);" onclick="ajaxInsertCart(this)">
										<span style="display: block;" class="fas fa-shopping-cart"></span>
									</a>
								</figure>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="pdList">
					<a href="#" class="display-3">
						검사자료부분 인기상품
						<span class="material-symbols-outlined">
						chevron_right
						</span>
					</a>
					<ul class="aa-product-catg">
						<c:forEach var="bookVo2" items="${bookList2}">
							<li>
								<figure>
									<c:set var="title" value="${bookVo2.BOOK_TITLE}"/>
									<c:set var="len" value="${fn:length(title)}"/>
									<c:if test="${len > 21}">
									<c:set var="part" value="${fn:substring(title, 21, len)}"/>
									<c:set var="part2" value="${fn:substring(title, 0, 21)}"/>
										<c:set var="title"
										 value="${fn:replace(title, part, '...')}"/>
									</c:if>
									<a class="aa-product-img"
									 href="<c:url value='/main/book/bookDetail?bookNo=${bookVo2.BOOK_NO}'/>">
										<img style="margin: 10px 0;" class="shadow-sm bg-body rounded"
										 src="<c:url value='/images/bookProduct/upload_img/${bookVo2.BOOK_IMG_NAME}'/>"
										 alt="${bookVo2.BOOK_TITLE}이미지">
									<figcaption>
										<h5 class="aa-product-title">
											<b>${title}</b>
										</h5>
										<span class="aa-product-price">
											<fmt:formatNumber value="${bookVo2.BOOK_PRICE}" pattern="#,###"/>
										</span>원
									</figcaption>
									</a>
									<br>
									<input type="hidden" value="${bookVo2.BOOK_NO}">
									<a class="aa-add-card-btn" href="javacript:void(0);" onclick="ajaxInsertCart(this)">
										<span style="display: block;" class="fas fa-shopping-cart"></span>
									</a>
								</figure>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="pdList">
					<a href="#" class="display-3">
						기타교구부분 인기상품
						<span class="material-symbols-outlined">
							chevron_right
						</span>
					</a>
					<ul class="aa-product-catg">
						<c:forEach var="bookVo3" items="${bookList3}">
							<li>
								<figure>
									<c:set var="title" value="${bookVo3.BOOK_TITLE}"/>
									<c:set var="len" value="${fn:length(title)}"/>
									<c:if test="${len > 21}">
									<c:set var="part" value="${fn:substring(title, 21, len)}"/>
									<c:set var="part2" value="${fn:substring(title, 0, 21)}"/>
										<c:set var="title"
										 value="${fn:replace(title, part, '...')}"/>
									</c:if>
									<a class="aa-product-img"
									 href="<c:url value='/main/book/bookDetail?bookNo=${bookVo3.BOOK_NO}'/>">
										<img style="margin: 10px 0;" class="shadow-sm bg-body rounded"
										 src="<c:url value='/images/bookProduct/upload_img/${bookVo3.BOOK_IMG_NAME}'/>"
										 alt="${bookVo3.BOOK_TITLE}이미지">
									<figcaption>
										<h5 class="aa-product-title">
											<b>${title}</b>
										</h5>
										<span class="aa-product-price">
											<fmt:formatNumber value="${bookVo3.BOOK_PRICE}" pattern="#,###"/>
										</span>원
									</figcaption>
									</a>
									<br>
									<input type="hidden" value="${bookVo3.BOOK_NO}">
									<a class="aa-add-card-btn" href="javacript:void(0);" onclick="ajaxInsertCart(this)">
										<span style="display: block;" class="fas fa-shopping-cart"></span>
									</a>
								</figure>
							</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>
			<form id="frmPageId" name="frmPage" method="post" action="<c:url value='/main/book/bookMain'/>">
				<input id="frmPageCategory" type="hidden" name="bookCategory" value="${param.bookCategory}">
				<input id="searchKeyword" type="hidden" name="searchKeyword" value="${searchKeyword}">
				<input type="hidden" name="currentPage" value="1">
			</form>
			<c:if test="${!empty searchKeyword}">
				<section style="border-top: 2px #ee7843 solid;border-bottom: 2px #ee7843 solid;padding: 10px 0;
				margin: 30px 0;">
					<ul class="booklist" style="padding-left:0;">
						${pagingInfo.totalRecord}개의 결과가 있습니다.
						<c:if test="${empty list}">
							<li class="flex">
								<div style="height: 300px; text-align: center;">
									<div style="margin-left: 500px;margin-top: 50px;">
										<p>검색 결과 해당 제품은 없습니다.</p>
										<img src="<c:url value='/images/empty.jpg'/>" alt="해당 제품이 현재 없습니다."
										 class="">
									</div>
								</div>
							</li>
						</c:if>
						<c:if test="${!empty list}">
							<c:forEach var="vo" items="${list}">
								<li class="flex">
									<div class="flex title">
										<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${vo.bookCategory}'/>">
											<img class="shadow-sm bg-body rounded" alt="${vo.bookImgOriginalname}" src="<c:url value='/images/bookProduct/upload_img/${vo.bookImgName}'/>" style="width: 120px;">
										</a>
										<div>
											<p class="box">${vo.bookCategory}</p>
											<a href="<c:url value='/main/book/bookDetail?bookNo=${vo.bookNo}&bookCategory=${vo.bookCategory}'/>">${vo.bookTitle}</a>
											<p><span>가격 | </span><fmt:formatNumber value="${vo.bookPrice}" pattern="#,###"/>원</p>
											<p><span>작가 | </span>${vo.bookWriter}<span style="padding-left:5px">출판사 | </span>${vo.bookPublisher}</p>
											
										</div>
										
									</div>
									<form name="frmBuy" method="post">
										<div class="btn">
											<button class="cartBtn" type="button" onclick="ajaxInsertCart(this)">장바구니</button>
											<button class="orderBtn" type="button" onclick="ajaxInsertCart(this)">바로구매</button>
											<input type="hidden" name="bookNo" value="${vo.bookNo}">
											<input type="hidden" name="basketQty" value="1">
										</div>
									</form>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</section>
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
			</c:if>
		</div>
		<div class="resize-sensor" style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
			<div class="resize-sensor-expand"
				style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
				</div>
			</div>
			<div class="resize-sensor-shrink" style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
			</div>
		</div>
	</div>
	<!-- open sidebarAPI 호출부분 -->
	<script type="text/javascript" src="<c:url value='/js/rAF.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ResizeSensor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sticky-sidebar.js'/>"></script>
	<script type="text/javascript">
		var a = new StickySidebar('#sidebar', {
			topSpacing : 200
		});
		
	</script>
	<!--  -->
</section>
<!-- 직접 만든 sidebar -->
<c:import url="/main/book/BookSideBar"/>
<%-- <%@ include file="./BookSideBar.jsp"%> --%>
<%@ include file="../inc/bottom.jsp"%>

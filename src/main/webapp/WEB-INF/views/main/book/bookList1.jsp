<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function ajaxInsertCart(element, mode){
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
				if(mode == 'cart'){
					$('#confirmModalBody').html("장바구니에 넣었습니다.장바구니로 이동할까요?");
					$('#confirmOk').attr("onclick","location.href='"+contextPath+"/main/mypage/mypageBasket?mode="+mode+"'");
					$('#confirmModalBtn').trigger('click');
				}else if(mode == 'order'){
					location.href = "/mbti/main/book/basket/bookOrdering";
				}
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
<section>
	<form id="frmPageId" name="frmPage" method="post"
	 action="<c:url value='/main/book/bookList1'/>">
		<input id="frmPageCategory" type="hidden" name="bookCategory" value="${param.bookCategory}">
		<input id="searchKeyword" type="hidden" name="searchKeyword" value="${searchKeyword}">
		<input type="hidden" name="currentPage" value="1">
	</form>
	<div id='bookSellMainImg' class=" bookslide shadow-sm p-3 mb-5 bg-body rounded">
			<ul class="gallery ">
				<%-- <li><img src="<c:url value='/images/bookProduct/slide_01.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_02.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_03.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/slide_04.jpg'/>"></li> --%>
				<li><img src="<c:url value='/images/bookProduct/bookMain1.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/bookMain2.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/bookMain3.jpg'/>"></li>
				<li><img src="<c:url value='/images/bookProduct/bookMain2.jpg'/>"></li>
			</ul>
	</div>
	<div style="padding-left: 240px;margin-top: 50px;">
		<a href="/mbti/main/index"><i class="bi bi-house-door-fill"></i></a>
		/
		<a href="/mbti/main/book/bookMain">도서 및 자료 구매</a>
		/
		<a href="/mbti/main/book/bookList1?bookCategory=${param.bookCategory}">${param.bookCategory}</a>
	</div>
	<div class="flex title_search">
		<h2 style="margin-top: 20px">검사자료 구매</h2>
		<div class="booksearch flex">
			<input type="text" name="inputKeyword" value="${searchKeyword}" placeholder="저자 또는 상품명">
			<button id="searchCategory" type="button" onclick="sendSearchKeyword()">
				<span class="material-symbols-outlined">search</span>
			</button>
		</div>
	</div>
	<div id="containerWrap" class="container clearfix" style="margin-left: 0;margin-right: 0;position: relative">
		<%@ include file="./BookSideBarLeft.jsp"%>
		
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
									<button class="cartBtn" type="button" onclick="ajaxInsertCart(this, 'cart')">장바구니</button>
									<button class="orderBtn" type="button" onclick="ajaxInsertCart(this, 'order')">바로구매</button>
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
<c:import url="/main/book/BookSideBar"/>
<%@ include file="../inc/bottom.jsp"%>
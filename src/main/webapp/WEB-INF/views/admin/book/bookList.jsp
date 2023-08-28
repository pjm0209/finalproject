<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/admin-css-js/js/book.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#searchByKeywordBtn').click(function(){
			$('form[name=serach]').submit();
		});
	});
	
	function bookListPage(curPage){
		$('input[name=currentPage]').val(curpage);
		/*
		$('input[name=perRecord]').val();
		$('input[name=keywordNo]').val();
		$('input[name=keywordTitle]').val();
		$('input[name=keywordPublisher]').val();
		$('input[name=keywordUseflag]').val();
		$('input[name=keywordRegdate]').val();
		$('input[name=keywordRegdate2]').val();
		$('input[name=keywordCategory]').val();
		*/
		$('form[name=frmPage]').submit();
	}
</script>

<!-- Begin Page Content -->
<form name="frmPage" method="post" action="<c:url value='/admin/book/bookList?bookFlag=${param.bookFlag}'/>">
	<input type="hidden" name="bookFlag" value="${param.bookFlag}">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="perRecord">
	<input type="hidden" name="keywordNo">
	<input type="hidden" name="keywordTitle">
	<input type="hidden" name="keywordPublisher">
	<input type="hidden" name="keywordUseflag">
	<input type="hidden" name="keywordRegdate">
	<input type="hidden" name="keywordRegdate2">
	<input type="hidden" name="keywordCategory">
</form>
<!-- Page Heading -->

<div class="head-div">
	<h2 class="text-gray-800">판매 상품 관리</h2>
</div>

<!--  -->
<%-- <%@ include file="../book/bookSideBody.jsp"%> --%>
<!--  -->

<div class="board-body">
	<div id="board-title">
		<c:if test="${param.bookFlag != 'Inventory'}">
			<h5>상품 리스트</h5>
			<button class="bg-gradient-secondary book-button"
				 id="bookRegisterBtn" onclick="location.href='bookRegister'">새 상품 등록</button>
			<button class="bg-gradient-secondary book-button"  
				 id="bookDeleteBtn" onclick="location.href='<c:url value='/admin/book/bookDelete'/>'">상품 삭제</button>
		</c:if>
		<c:if test="${param.bookFlag == 'Inventory'}">
			<h5>상품 재고 관리</h5>
		</c:if>
	</div>
	<!--  -->
	<div>
	
		<%@ include file="../book/bookSearch.jsp"%>
		
		<!--  -->
		<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;margin-right: 15px">
			
			<table class="table">
				<colgroup>
					<col style="width:5%;" />
					<col style="width:10%;" />
					<col style="width:15%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />	
					<col style="width:10%;" />	
					<col style="width:5%;" />
					<col style="width:10%;" />	
					<col style="width:15%;" />				
				</colgroup>
				<thead>
					<tr class="book-table-colum">
						<th scope="col"><input type="checkbox" id="check-All" class="book-checkbox"></th>
						<th scope="col" class="bookNo">상품코드</th>
						<th scope="col" class="bookTitle">상품명</th>
						<th scope="col" class="bookImage">상품이미지</th>
						<th scope="col" class="bookCategory">카테고리</th>
						<th scope="col" class="bookPrice">판매가</th>
						<c:if test="${param.bookFlag != 'Inventory'}">
							<th scope="col" class="bookSellCount">판매수</th>
						</c:if>
						<c:if test="${param.bookFlag == 'Inventory'}">
							<th scope="col" class="bookSellCount">재고수</th>
						</c:if>
						<th scope="col" class="bookUseflag">사용여부</th>
						<th scope="col" class="bookRegdate">등록일</th>
						<th scope="col" class="bookManage">관리</th>
					</tr>
				</thead>
				<tbody id="bookTbody">
					<c:if test="${empty list}">
					<tr>
						<th colspan="10" style="color:gray;">해당 상품은 존재하지 않습니다.</th>
					</tr>
					</c:if>
					<c:if test="${!empty list}">
						<c:forEach var="map" items="${list}">
							<tr>
								<th scope="row">
									<input type="checkbox" class="book-checkbox">
								</th>
								<td>${map["BOOK_NO"]}</td>
								<td>${map["BOOK_TITLE"]}</td>
								<td>
									<img width="140px" height="210px" src="<c:url value='/images/bookProduct/${map["BOOK_NO"]}.jpg'/>" alt="${map['BOOK_TITLE']}">
								</td>
								<td>${map["BOOK_CATEGORY"]}</td>
								<td>
									<fmt:formatNumber value="${map['BOOK_PRICE']}" pattern="#,###"/>원
								</td>
								<c:if test="${param.bookFlag != 'Inventory'}">
									<td>
										<fmt:formatNumber value="" pattern="#,###"/>부
									</td>						
								</c:if>
								<c:if test="${param.bookFlag == 'Inventory'}">
									<td>
										<input class="form-control" name="" type="number" value="${map['STOCK_QTY']}">
									</td>
								</c:if>
								<td>${map["BOOK_USEFLAG"]}</td>
								<td>
									${map["BOOK_REGDATE"]}
								</td>
								<c:if test="${param.bookFlag == 'Inventory' }">
									<td>
										<button class="btn btn-info btn-xs blue" onclick="location.href='bookRegister?bookNo=${map['BOOK_NO']}" type="button" title="재고저장"><i class="fas fa-save"></i></button>
									</td>
								</c:if>
								<c:if test="${param.bookFlag != 'Inventory' }">
									<td id="tdLast">
										<a class="btn btn-info btn-xs" href="" target="_blank" title="상품보기"><i class="fas fa-eye"></i></a>
										<button class="btn btn-info btn-xs" onclick="location.href='bookRegister?bookNo=${map['BOOK_NO']}'" type="button" title="복사"><i class="fas fa-copy"></i></button>
										<button class="btn btn-primary btn-xs" onclick="location.href='bookEdot?bookNo=${map['BOOK_NO']}'" type="button" title="수정"><i class="fas fa-edit"></i></button>
										<button class="btn btn-danger btn-xs" id="delBtn" type="button" title="삭제"><i class="fas fa-trash"></i></button>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<!-- 페이지 번호 추가 -->	
			<c:if test="${!empty list}">
				<nav class="bookPaging" aria-label="Page navigation example">
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
						    <li class="page-item active"><a class="page-link" href="#">${i }</a></li>		    
				    	</c:if>
				    	<c:if test="${i != pagingInfo.currentPage }">
						    <li class="page-item"><a class="page-link" href="#" onclick="bookListPage(${i})">${i }</a></li>		    
				    	</c:if>
				    </c:forEach>
				    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next" onclick="bookListPage(${pagingInfo.lastPage + 1})">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
			</c:if>
			<!--  페이지 번호 끝 -->
		</div>
	</div>
	
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
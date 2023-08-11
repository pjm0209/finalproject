<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="side-body">
	<div class="side-div-title">
		<h6>상품 관리</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="board-group-list" class="nav">
			<div class="board-side-boardItem addIcon">
				<div class="board-name one" name="bookList" value="bookList">
					<span><a href="<c:url value='/admin/book/bookList'/>">상품 리스트</a></span>
				</div>
			</div>
			<div class="board-side-boardItem addIcon">
				<div class="board-name two" name="Inventory" value="Inventory">
					<span><a href="<c:url value='/admin/book/bookList?bookFlag=Inventory'/>">상품 재고관리</a></span>
				</div>
			</div>	
			<div class="board-side-boardItem addIcon">
				<div class="board-name three" name="statistic" value="statistic">
					<span><a href="<c:url value='/admin/book/bookSummingUp?bookFlag=statistic'/>">매출 현황</a></span>
				</div>
			</div>
		</div>
		<input type="hidden" id="requestValue" value="${param.bookFlag}">
	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/admin-css-js/js/book.js'/>"></script>
<script type="text/javascript">
$(function(){
		
	$('#delBtn').click(function(){
		var cnt = $("table input[type='checkbox']:checked").length;
		
		//유효성 검사
		if(cnt < 1) {
			alert("삭제할 상품을 선택해주세요.");
			return false;
		} else {
			/* $('form[name=frmList]').prop('action', "<c:url value='/admin/product/deleteMulti'/>"); */
			if(confirm("삭제할까요?, " + cnt)) {
				$('form[name=frmList]').submit();
			} 
		}
	});
	
	$('#bookDeleteBtn').click(function(){
		var cnt = $("table input[type='checkbox']:checked").length;
		
		//유효성 검사
		if(cnt < 1) {
			alert("삭제할 상품을 선택해주세요.");
			return false;
		} else {
			/* $('form[name=frmList]').prop('action', "<c:url value='/admin/product/deleteMulti'/>"); */
			if($('#check-All').is(':checked')){
				cnt = cnt-1;
			}
			if(confirm("삭제할까요?, " + cnt)){
				$('form[name=frmList]').submit();
			} 
		}
	});
	
	
	var chkAll = $('#check-All');
	var checkBox = $('tbody input[type=checkbox]');
	
	chkAll.click(function(){
		checkBox.prop('checked', this.checked);
	});
	
	checkBox.click(function(){
		var perSrch = $('#perSrch option:selected').val();
		
		if($("tbody input[type='checkbox']:checked").length == perSrch){
			chkAll.prop('checked', true);
		} else {
			chkAll.prop('checked', false);
		}
	});
	
	$("#btEventMulti").click(function(){
		var cnt = $("table input[type='checkbox']:checked").length;
		if(cnt < 1) {
			alert("상품을 선택해주세요.");
			return false;
		} else if($("select[name='eventSel']").val() == "") {
			alert("이벤트 이름을 선택해주세요.");
			$("select[name='eventSel']").focus();
			return false;
	    } else {	
			$('form[name=frmList]').prop('action', "<c:url value='/admin/product/eventMulti'/>");
			if(confirm($("select[name='eventSel'] option:selected").text() + " 상품을 등록할까요?, " + cnt)) {
				$('form[name=frmList]').submit();
			} 
		}
	});
});	
</script>
<!-- Begin Page Content -->
<!-- Page Heading -->

<div class="head-div">
	<h2 class="text-gray-800">판매 상품 관리</h2>
</div>

<!--  -->
<%@ include file="../book/bookSideBody.jsp"%>
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
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;">
		
		<table class="table">
			<colgroup>
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />	
				<col style="width:10%;" />	
				<col style="width:10%;" />			
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
				<tr>
					<th scope="row"><input type="checkbox" class="book-checkbox"></th>
					<td>코드</td>
					<td>상품명</td>
					<td>상품이미지</td>
					<td>책 > 검사</td>
					<td>10,000원</td>
					<c:if test="${param.bookFlag != 'Inventory'}">
						<td>1</td>						
					</c:if>
					<c:if test="${param.bookFlag == 'Inventory'}">
						<td class="form-inline">
							<input class="form-control" name="" type="number" value="1">
						</td>
					</c:if>
					<td>Y or N</td>
					<td>regdate</td>
					<c:if test="${param.bookFlag == 'Inventory' }">
						<td>
							<button class="btn btn-info btn-xs blue" onclick="location.href='bookRegister?bookNo=${'#bookNo'}.val()'" type="button" title="재고저장"><i class="fas fa-save"></i></button>
						</td>
					</c:if>
					<c:if test="${param.bookFlag != 'Inventory' }">
						<td id="tdLast">
							<a class="btn btn-info btn-xs" href="/productsub/fo/0/36/productview.sd" target="_blank" title="상품보기"><i class="fas fa-eye"></i></a>
							<button class="btn btn-info btn-xs" onclick="location.href='bookRegister?bookNo=${vo.bookNo}'" type="button" title="복사"><i class="fas fa-copy"></i></button>
							<button class="btn btn-primary btn-xs" onclick="location.href='bookRegister'" type="button" title="수정"><i class="fas fa-edit"></i></button>
							<button class="btn btn-danger btn-xs" id="delBtn" type="button" title="삭제"><i class="fas fa-trash"></i></button>
						</td>
					</c:if>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="book-checkbox"></th>
					<td>코드</td>
					<td>상품명</td>
					<td>상품이미지</td>
					<td>책 > 검사</td>
					<td>10,000원</td>
					<c:if test="${param.bookFlag != 'Inventory'}">
						<td>1</td>						
					</c:if>
					<c:if test="${param.bookFlag == 'Inventory'}">
						<td class="form-inline">
							<input class="form-control" name="" type="number" value="1">
						</td>
					</c:if>
					<td>Y or N</td>
					<td>regdate</td>
					<c:if test="${param.bookFlag == 'Inventory' }">
						<td>
							<button class="btn btn-info btn-xs blue" onclick="location.href='bookRegister?bookNo=${'#bookNo'}.val()'" type="button" title="재고저장"><i class="fas fa-save"></i></button>
						</td>
					</c:if>
					<c:if test="${param.bookFlag != 'Inventory' }">
						<td id="tdLast">
							<a class="btn btn-info btn-xs" href="/productsub/fo/0/36/productview.sd" target="_blank" title="상품보기"><i class="fas fa-eye"></i></a>
							<button class="btn btn-info btn-xs" onclick="location.href='bookRegister?bookNo=${vo.bookNo}'" type="button" title="복사"><i class="fas fa-copy"></i></button>
							<button class="btn btn-primary btn-xs" onclick="location.href='bookRegister'" type="button" title="수정"><i class="fas fa-edit"></i></button>
							<button class="btn btn-danger btn-xs" id="delBtn" type="button" title="삭제"><i class="fas fa-trash"></i></button>
						</td>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
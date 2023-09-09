<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
$(function(){
	
	$('#perRecord').change(function(){
		$('input[name=perRecord]').val($('#perRecord').val());
	});
	
	$('#searchByKeywordBtn').click(function(){
		var bf = $('#searchBookFlag').val();
		if(bf === 'bookListByKeyword'){
			$("#frmPageIdBookFlag").val(bf);
		} else if(bf === 'InventoryByKeyword'){
			$("#frmPageIdBookFlag").val(bf);
		}
		
		$('input[name=currentPage]').val("1");
		ajaxFunc(); // ajax 함수
	});
	
	$('#toggleBtn').click(function(){
		var a = $('#toggleBtn').text()
	 	var b = '검색창 열기';
		var c = '검색창 닫기';
		if(a === b){
			$('#toggleBtn').text(c);
		} else if(a === c){
			$('#toggleBtn').text(b);
		} 
	});
	
	$("#searchByKeywordBtn").trigger('click');
});

function checkAll(evt){
	
	var checked=$(evt).prop("checked");
	$('input[type=checkbox]').prop("checked",checked);
	
}

function ajaxFunc (){
	var result='';
	var result2='';
	var result3='';
	var result4='';
	
	var flag = 'order';
	
	$.ajax({
		url:"<c:url value='/admin/book/bookAjaxOrderList?flag=" + x + "'/>",
		type:"post",
		dataType:"json",
		data: $('form[name=serach]').serializeArray(), // 입력 양식의 내용을 객체로 만든다
		success:function(res){
 //{"searchCondition":"","searchKeyword":"","searchUseYn":"","currentPage":1,"blockSize":0,"firstRecordIndex":1,"lastRecordIndex":1,"recordCountPerPage":0,"bookNo":30023,"bookTitle":"16가지 성격유형 도표","bookPrice":8500,"bookPublisher":"어세스타","bookRegdate":"2023-08-22 01:09:25","bookImgName":null,"bookImgSize":0,"bookImgOriginalname":null,"bookCategory":"기타","bookWriter":"어세스타","bookUseflag":"Y","bookExplains":"A1사이즈로 코팅된 종이로 그룹의 결과 유형 분포표를 한 눈에 보기 쉽게 확인할 수 있는 자료입니다","bookDetails":"A1사이즈로 코팅된 종이로 그룹의 결과 유형 분포표를 한 눈에 보기 쉽게 확인할 수 있는 자료입니다","stockQty":100,"orderBy":null,"bookFlag":null,"perRecord":0,"keywordCategory":null,"keywordNo":null,"keywordTitle":null,"keywordPublisher":null,"keywordUseflag":null,"keywordRegdate":null,"keywordRegdate2":null} */
			 if(res.list.length > 0){
					var result=makeListJson(res.list);
					$('#orderTbody').html(result);
					
					result=makePage(res.pagingInfo);
					
					$("#bookPaging").html(result);
					
					$("#captionBook").text("TOTAL " + res.pagingInfo.totalRecord + " ROWS");
					
			} else {
				var str = "<tr>";
				str += "<th colspan='10' style='color:gray;'>해당 상품은 존재하지 않습니다.</th>";
				str += "</tr>";
				$("#bookTbody").html(str);
				$("#bookPaging").html("");
			} 
		},
		error:function(xhr, status, error){
			alert(status + " : " + error);
		}
	});//ajax
}

function makeListJson(list){
	var makeHtml = "";
	
	$.each(list,function(idx,items){
		
		var num = this.bookPrice;
		var bookPrice = num.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
		var num = this.ordersRegdate;
		var ordersRegdate = num.substring(0, 10);
		
		makeHtml += "<tr>";
		makeHtml += "<th scope='row'><input type='checkbox' class='book-checkbox'></th>";
		makeHtml += "<td>"+this.ordersNo+"</td>";
		makeHtml += "<td>"+this.bookTitle+"</td>";
		makeHtml += "<td>"+this.userid+"</td>";
		makeHtml += "<td>"+this.bookPrice+"원</td>";
		makeHtml += "<td>"+this.recipient+"</td>";
		makeHtml += "<td>"+this.paymentMethod+"</td>";
		makeHtml += "<td>"+this.ordersState+"</td>";
		makeHtml += "<td>"+ordersRegdate+"</td>";
		makeHtml += "<td>";
			if(${param.orderFlag === 'moneyNotYet'}){
				makeHtml += "<a class='green' href='#'>결제 완료</a><br>";
				makeHtml += "<a class='red' href='#'>주문 취소</a>";				
			}
			else if(${param.orderFlag === 'moneyDone'}){
				makeHtml += "<a class='green' href='#'>배송 준비</a><br>";
				makeHtml += "<a class='red' href='#'>주문 취소</a>";		
			}
			else if(${param.orderFlag === 'shippingNotYet'}){
				makeHtml += "<a class='green' href='#'>배송 중</a><br>";
				makeHtml += "<a class='red' href='#'>주문 취소</a>";		
			}
			else if(${param.orderFlag === 'shipping'}){
				makeHtml += "<a class='green' href='#'>배송 완료</a><br>";
				makeHtml += "<a class='red' href='#'>주문 취소</a>";		
			}
			else if(${param.orderFlag === 'shippingDone'}){
				makeHtml += "<a class='green' href='#'>구매 확정</a><br>";
				makeHtml += "<a class='red' href='#'>주문 취소</a>";		
			} else{
				makeHtml += "&nbsp;";
			}
		makeHtml += "</td>";
		makeHtml += "<td>";
		makeHtml += "<button class='btn btn-warning btn-xs' onclick='location.href=\"orderDetail?orderNo=${vo.orderNo}?orderFlag=${param.orderFlag}\" type='button' '><i class='fas fa-edit'></i></button>";
		makeHtml += "</td>";
		makeHtml += "</tr>""
	}
}

function makePage(pageInfo){
	var pageHtmlStr = "";
	pageHtmlStr += "<ul class='pagination pagination-lg justify-content-center'>";
	if(pageInfo.firstPage > 1){
		pageHtmlStr += "<li class='page-item'>";
		pageHtmlStr += "<a class='page-link' href='javascript:void(0);' onclick='orderListPage((" + f(-1) + "))' aria-label='Previous'>";
		pageHtmlStr += "<span aria-hidden='true'>&laquo;</span>";
		pageHtmlStr += "</a>";
		pageHtmlStr += "</li>";
	}
	var f = pageInfo.firstPage;
	var l = pageInfo.lastPage;
	for(var i=f; i <= l; i++){
		if(i==pageInfo.currentPage){
			pageHtmlStr += "<li class='page-item active'>";
			pageHtmlStr += "<a class='page-link' href='javascript:void(0);'>" + i + "</a></li>"; 
		}
		if(i !== pageInfo.currentPage){
			pageHtmlStr += "<li class='page-item'>";
			pageHtmlStr += "<a class='page-link' href='javascript:void(0);' onclick='orderListPage(" + i + ")'>" + i + "</a></li>";
	    }
	}
	
	if((pageInfo.lastPage < pageInfo.totalPage)){
		pageHtmlStr += "<li class='page-item'>";
		pageHtmlStr += "<a class='page-link' href='javascript:void(0);' aria-label='Next' onclick='orderListPage(" + (l + 1) + "'>";
		pageHtmlStr += "<span aria-hidden='true'>&raquo;</span>";
		pageHtmlStr += "</a>";
		pageHtmlStr += "</li>";
	}
	pageHtmlStr += "</ul>";
	
	return pageHtmlStr;
}

function orderListPage(curPage){
	$("#check-All").prop("checked", false);
	$('input[name=currentPage]').val(curPage);
	$('input[name=perRecord]').val($('#perRecord').val());
	ajaxFunc();
}

</script>
<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">상품 주문 관리</h2>
</div>
<!--  -->
<!-- <%@ include file="../order/orderSideBody.jsp"%>  -->
<!--  -->
<div class="board-body">
	<div id="board-title">
		<c:choose> 
			<c:when test="${param.orderFlag eq 'moneyNotYet'}">
				<h5>입금 대기 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'moneyDone'}">
				<h5>결재 완료 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'shippingNotYet'}">
				<h5>배송 준비 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'shipping'}">
				<h5>배송 중 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'shippingDone'}">
				<h5>배송 완료 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'confirmed'}">
				<h5>구매 확정 관리</h5>
			</c:when> 
			<c:when test="${param.orderFlag eq 'BASKET'}">
				<h5>장바구니 관리</h5>
			</c:when>
			<c:otherwise>
				<h5>전체 주문 내역</h5>
			</c:otherwise> 
		</c:choose>
		<button id="toggleBtn" class="btn btn-warning bg-gradient-secondary book-button"
			 type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
			  aria-expanded="false" aria-controls="collapseExample">검색창 열기</button>
	</div>
	
	
	<!--  -->
	<div>
		<div class="collapse" id="collapseExample">
			<%@ include file="../order/orderSearch.jsp"%>
		</div>
	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;margin-right: 15px">
		
		<table class="table">
		<colgroup>
			<col style="width:1%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />	
			<col style="width:9%;" />	
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:14%;" />			
		</colgroup>
		<thead>
			<tr class="book-table-colum">
				<th scope="col"><input type="checkbox" id="check-All" class="book-checkbox"></th>
				<th scope="col" class="orderNo">주문번호</th>
				<th scope="col" class="orderProduct">주문상품</th>
				<th scope="col" class="orderUserid">회원아이디</th>
				<th scope="col" class="orderPrice">결제금액</th>
				<th scope="col" class="orderRecipient">수령자</th>
				<th scope="col" class="orderMethod">결제수단</th>
				<th scope="col" class="orderState">주문 상태</th>
				<th scope="col" class="orderDate">주문일</th>
				<th scope="col" class="orderHandle">주문처리</th>
				<th scope="col" class="orderManage">관 리</th>
			</tr>
		</thead>
		<tbody id="orderTbody">
			
			
		</tbody>
	</table>
		
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
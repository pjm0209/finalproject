<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">

var flagInput = $("input[name=flagInput]").val();

$(function(){
	
	$('#perRecord').change(function(){
		$('input[name=perRecord]').val($('#perRecord').val());
	});
	
	ajaxFunc(); // ajax 함수 
	
	$('#searchByKeywordBtn').click(function(){
		var bf = $('#searchflag').val();
		if(bf === 'orderByKeyword'){
			$("#frmPageIdflag").val(bf);
		} else if(bf === 'order'){
			$("#frmPageIdflag").val(bf);
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
	
	var flag = $("#frmPageIdflag").val();
	$.ajax({
		url:"<c:url value='/admin/order/orderAjaxOrderList?flag=" +flag + "'/>",
		type:"post",
		dataType:"json",
		data: $('form[name=serach]').serializeArray(), // 입력 양식의 내용을 객체로 만든다
		success:function(res){
			 if(res.list.length > 0){
					var result=makeListJson(res.list);
					$('#orderTbody').html(result);
					
					result=makePage(res.pagingInfo);
					
					$("#orderPaging").html(result);
					
					$("#captionBook").text("TOTAL " + res.pagingInfo.totalRecord + " ROWS");
					
			} else {
				var str = "<tr>";
				str += "<th colspan='11' style='color:gray;'>해당 상품은 존재하지 않습니다.</th>";
				str += "</tr>";
				$("#orderTbody").html(str);
				$("#orderPaging").html("");
			} 
		},
		error:function(xhr, status, error){
			alert(status + " : " + error);
		}
	});//ajax
}

function makeListJson(list){
	var makeHtml = "";
	
	$.each(list, function(idx,items){
		
		var a = this.sumPrice;
		var sumPrice = a.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		
		var b = this.ordersRegdate;
		var ordersRegdate = b.substring(0, 10);
		
		makeHtml += "<tr>";
		makeHtml += "<th scope='row'><input type='checkbox' class='book-checkbox'></th>";
		makeHtml += "<td>"+this.ordersNo+"</td>";
		makeHtml += "<td>"+this.bookTitle+"</td>";
		makeHtml += "<td>"+this.userid+"</td>";
		makeHtml += "<td>"+sumPrice+"원</td>";
		makeHtml += "<td>"+this.recipient+"</td>";
		makeHtml += "<td>"+this.paymentMethod+"</td>";
		makeHtml += "<td>"+this.ordersState+"</td>";
		makeHtml += "<td>"+ordersRegdate+"</td>";
		makeHtml += "<td>";
		if(${param.orderFlag == 'moneyNotYet'}){
			makeHtml += "<a class='green' href='#'>결제 완료</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";				
		}
		else if(${param.orderFlag == 'moneyDone'}){
			makeHtml += "<a class='green' href='#'>배송 준비</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";		
		}
		else if(${param.orderFlag == 'shippingNotYet'}){
			makeHtml += "<a class='green' href='#'>배송 중</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";		
		}
		else if(${param.orderFlag == 'shipping'}){
			makeHtml += "<a class='green' href='#'>배송 완료</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";		
		}
		else if(${param.orderFlag == 'shippingDone'}){
			makeHtml += "<a class='green' href='#'>구매 확정</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";		
		}
		else if(${param.orderFlag eq 'orderCancle'}){
			makeHtml += "<a class='green' href='#'>취소 완료</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";
		}else if(${param.orderFlag eq 'orderCancleDone'}){
			makeHtml += "&nbsp;";
		}else if(${param.orderFlag eq 'returnNotYet'}){
			makeHtml += "<a class='green' href='#'>반품 완료</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";
		}else if(${param.orderFlag eq 'returnDone'}){
			makeHtml += "&nbsp;";
		}else if(${param.orderFlag eq 'exchangeNotYet'}){
			makeHtml += "<a class='green' href='#'>교환 완료</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";
		}else if(${param.orderFlag eq 'exchangeDone'}){
			makeHtml += "&nbsp;";
		}else if(${param.orderFlag eq 'refundNotYet'}){
			makeHtml += "<a class='green' href='#'>환불 완료</a><br>";
			makeHtml += "<a class='red' href='#'>주문 취소</a>";
		}else if(${param.orderFlag eq 'refundDone'}){
			makeHtml += "&nbsp;";
		}else {
			makeHtml += "&nbsp;";
		}		
		
		makeHtml += "</td>";
		makeHtml += "<td>";
		makeHtml += "<button class='btn btn-warning btn-xs' onclick='openDetail("+this.ordersNo+","+flagInput+")' type='button'><i class='fas fa-edit'></i></button>";
		makeHtml += "</td>";
		makeHtml += "</tr>";
	});
	
	return makeHtml;
}

function openDetail(ordersNo){
	location.href="orderDetail?orderNo="+ordersNo+"?orderFlag="+flagInput;
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
	<input id="flagInput" name="flag" type="hidden" value="${param.flag}">
</div>
<!--  -->
<!-- <%@ include file="../order/orderSideBody.jsp"%>  -->
<!--  -->
<div class="board-body">
	<div id="board-title">
		<%-- <c:choose> 
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
		</c:choose> --%>
		<h5>전체 주문 내역</h5>
		<button id="toggleBtn" class="btn btn-warning bg-gradient-secondary book-button"
			 type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
			  aria-expanded="false" aria-controls="collapseExample">검색창 열기</button>
	</div>
	
	
	<!--  -->
	<div>
	<div class="collapse" id="collapseExample">
	<form name="serach">
	 	<input id="searchFlag" name="flag"  type="hidden"
		 <c:if test="${param.flag == 'order' or param.flag == 'orderByKeyword'}"> value='orderByKeyword'</c:if>
	 	>
		<div class="flex shadow-sm p-3 mb-5 bg-body rounded"
			style="margin: 10px 0px; background: white; margin-right: 15px">
			<h2>상품 검색</h2>
				
			<div class="form-group box">
				<label>결제 타입</label>
				<div>
					<select class="form-control"  name="keywordPM">
						<option
							<c:if test="${param.orderBy eq ''}">
							 		selected="selected"
							</c:if>
						 value="">선택</option>
						<option
							<c:if test="${param.orderBy eq '카카오페이'}">
							 		selected="selected"
							</c:if>
						 value="카카오페이">카카오페이</option>
						<option
							<c:if test="${param.orderBy eq '신용카드'}">
							 		selected="selected"
							</c:if>
						 value="신용카드">신용카드</option>
						<option
							<c:if test="${param.orderBy eq '현금'}">
							 		selected="selected"
							</c:if>
						 value="현금">현금</option>
					</select>
				</div>
				<label>주문 상태</label>
				<div>
					<select class="form-control" name="keywordOrdersState">
						<option 
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="">선택</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						value="입금대기">입금대기</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="결제완료">결제완료</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
								selected="selected"
							</c:if>
						 value="배송준비">배송준비</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
					 			selected="selected"
							</c:if>
						 value="배송중">배송중</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="배송완료">배송완료</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
							 		selected="selected"
							</c:if>
						 value="구매확정">구매확정</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="취소 신청">취소 신청</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="취소완료">취소완료</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="반품신청">반품신청</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="반품완료">반품완료</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="교환신청">교환신청</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="교환완료">교환완료</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="환불신청">환불신청</option>
						<option
							<c:if test="${param.orderBy eq 'book_regdate'}">
						 		selected="selected"
							</c:if>
						 value="환불완료">환불완료</option>
					</select>
				</div>
			</div>
			<div class="form-group box">
				<label>주문번호</label>
				<div class="flex_ca">	
					<input class="form-control" type="number" name="keywordOrdersNo" placeholder="주문번호"
						<c:if test="${!empty param.keywordOrdersNo}"> value='${param.keywordOrdersNo}'</c:if>
					>
				</div>	
			</div>
			<div class="form-group box">
				<label>회원명</label>
				<div>
					<input class="form-control" name="keywordName" placeholder="회원명" type="text"
						<c:if test="${!empty param.keywordTitle}"> value='${param.keywordTitle}'</c:if>
					>
				</div>			
				<label>회원ID</label>
				<div>
					<input class="form-control" name="keywordUserID" placeholder="상품명" type="text"
						<c:if test="${!empty param.keywordTitle}"> value='${param.keywordTitle}'</c:if>
					>
				</div>
			</div>
			<div class="form-group box">
				<label>등록일</label>
				<div class="register">
					<input class="form-control" id="" name="keywordRegdate" placeholder="등록일" type="date"
						<c:if test="${!empty param.keywordRegdate}">
								 value=${param.keywordRegdate}
						</c:if>	
					 >
				</div>
				<div>
					<input class="form-control" id="" name="keywordRegdate2" placeholder="등록일(종료일)" type="date"
						<c:if test="${!empty param.keywordRegdate2}">
								 value=${param.keywordRegdate2}
						</c:if>
					 >
				</div>
			</div>
				<div class="form-group box">
					<label>정렬</label>
						<select class="form-select" id="" name="orderBy" style="margin-left: 214px;">
							<option value=""
								<c:if test="${!empty param.orderBy}">
									 selected="selected"
								</c:if>
							>선택</option>
							<option value="regdate"
								<c:if test="${param.orderBy eq 'regdate'}">
									 selected="selected"
								</c:if>
							>주문일 오름차순</option>
							<option value="regdate_desc"
								<c:if test="${param.orderBy eq 'regdate_desc'}">
									 selected="selected"
								</c:if>
							>주문일 내림차순</option>
							<option value="id"
								<c:if test="${param.orderBy eq 'id'}">
									 selected="selected"
								</c:if>
							>회원ID 오름차순</option>
							<option value="id_desc"
								<c:if test="${param.orderBy eq 'id_desc'}">
									 selected="selected"
								</c:if>
							>회원ID 내림차순</option>
							<option value="nm"
								<c:if test="${param.orderBy eq 'nm'}">
									 selected="selected"
								</c:if>
							>회원명 오름차순</option>
							<option value="nm_desc"
								<c:if test="${param.orderBy eq 'nm_desc'}">
									 selected="selected"
								</c:if>
							>회원명 내림차순</option>
							<option value="price"
								<c:if test="${param.orderBy eq 'price'}">
									 selected="selected"
								</c:if>
							>결제금액 오름차순</option>
							<option value="price_desc"
								<c:if test="${param.orderBy eq 'price_desc'}">
									 selected="selected"
								</c:if>
							>결제금액 내림차순</option>
							<option value="ono"
								<c:if test="${param.orderBy eq 'ono'}">
									 selected="selected"
								</c:if>
							>주문번호 오름차순</option>
							<option value="ono_desc"
								<c:if test="${param.orderBy eq 'ono_desc'}">
									 selected="selected"
								</c:if>
							>주문번호 내림차순</option>
						</select>
				</div>
				<div class="box num_01">
					<label>게시글 수</label>
						<select class="form-select" id="perRecord" name="perRecord">
							<option value="5"
								<c:if test="${param.orderBy == 5}">
									 selected="selected"
								</c:if>
							>5</option>
							<option value="10"
								<c:if test="${param.orderBy == 10}">
									 selected="selected"
								</c:if>
							>10</option>
							<option value="20"
								<c:if test="${param.orderBy == 20}">
									 selected="selected"
								</c:if>
							>20</option>
							<option value="30"
								<c:if test="${param.orderBy == 30}">
									 selected="selected"
								</c:if>
							>30</option>
							<option value="50"
								<c:if test="${param.orderBy == 50}">
									 selected="selected"
								</c:if>
							>50</option>
						</select>
				</div>
			
			<div class="btn">
				<button type="button" id="searchByKeywordBtn">검색</button>
			</div>
			
			<input id="frmPageIdflag" type="hidden" name="flag" value="${param.flag}">
			<input type="hidden" name="currentPage" value="1">
		</div>
	</form>
</div>
		</div>
	<!--  -->
	<div class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;margin-right: 15px">
		<table class="table">
		<caption id="captionBook" class="captionBook"></caption>
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
	<nav id="orderPaging" class="bookPaging" aria-label="Page navigation example">

	</nav>		
	</div>
</div>

</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
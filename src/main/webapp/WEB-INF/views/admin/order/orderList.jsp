<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">

var flagInput = $("input[name=flagInput]").val();

$(function(){
	
	$('#allCheck').click(function(){
	     var checked = $('#allCheck').is(':checked');
	     
	     if(checked){
	        $('input:checkbox').prop('checked',true);
	       } else{
	           $('input:checkbox').prop('checked',false);
	       }
	});
	
	$('#perRecord').change(function(){
		$('input[name=perRecord]').val($('#perRecord').val());
	});
	
	ajaxFunc(); // ajax 함수 
	
	$('#searchByKeywordBtn').click(function(){
		$('form[name=frmOrders]').html("");
		var kos = $("select[name=keywordOrdersState]").val();
		$("#copy").val(kos);
		
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
			var btns = makeBtn($("#copy").val());
			$("#buttonDiv").html(btns);
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
		
		var bookTitle = this.bookTitle;
		var check = bookTitle.indexOf("^");
		
		if(check>0){
			var sC = bookTitle.split("^");
			var len = sC[0].length;
			if(len > 14){
				sC[0] = sC[0].replace(sC[0].substring(14, len), "...");
			}
			var scLen = sC.length;
			bookTitle = sC[0] + " <br>외 " +(scLen-1)+ "개";
		}else{
			if(bookTitle.length > 14){
				bookTitle = bookTitle.replace(bookTitle.substring(14, bookTitle.length), "...");
			}
		}
		
		makeHtml += "<tr>";
		makeHtml += "<td scope='row'><input type='checkbox' class='book-checkbox' name='sortOrderViewItems["+idx+"].ordersNo' value='"+this.ordersNo+"' onclick='makeFormVal(this)'></td>";
		makeHtml += "<td style='display:none'><input type='hidden' name='sortOrderViewItems["+idx+"].ordersState' class='goalState'></td>";
		makeHtml += "<td style='vertical-align: middle;'>"+this.ordersNo+"</td>";
		makeHtml += "<td>"+bookTitle+"</td>";
		makeHtml += "<td style='vertical-align: middle;'>"+this.name+"("+this.userid+")</td>";
		makeHtml += "<td>"+sumPrice+"원</td>";
		makeHtml += "<td>"+this.recipient+"</td>";
		makeHtml += "<td>"+this.paymentMethod+"</td>";
		makeHtml += "<td>"+this.ordersState+"</td>";
		makeHtml += "<td>"+ordersRegdate+"</td>";
		makeHtml += "<td>";
		/* if(this.ordersState == '결제 완료'}){
			makeHtml += "<a class='red' href='#'>주문 취소</a>";				
		}
		else */
		if(this.ordersState == '결제 완료'){
			makeHtml += "<a class='green' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>배송 준비</a><br>";
			makeHtml += "<a class='red' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>취소 완료</a>";		
		}
		else if(this.ordersState == '배송 준비'){
			makeHtml += "<a class='green' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>배송중</a><br>";
		}
		else if(this.ordersState == '배송중'){
			makeHtml += "<a class='green' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>배송 완료</a><br>";
		}
		else if(this.ordersState == '배송 완료'){
			makeHtml += "<a class='red' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>취소 완료</a>";		
		}else if(this.ordersState == '취소 신청'){
			makeHtml += "<a class='red' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>취소 완료</a><br>";
		}else if(this.ordersState == '취소 완료'){
			makeHtml += "&nbsp;";
		}else if(this.ordersState == '반품 신청'){
			makeHtml += "<a class='green' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>반품 완료</a><br>";
			makeHtml += "<a class='red' href=javascript:void(0)#' onclick='updateStateAjax("+this.ordersNo+", this)'>취소 완료</a>";
		}else if(this.ordersState == '반품 완료'){
			makeHtml += "&nbsp;";
		}else if(this.ordersState == '교환 신청'){
			makeHtml += "<a class='green' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>교환 완료</a><br>";
			makeHtml += "<a class='red' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>취소 완료</a>";
		}else if(this.ordersState == '교환 완료'){
			makeHtml += "&nbsp;";
		}else if(this.ordersState == '환불 신청'){
			makeHtml += "<a class='green' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>환불 완료</a><br>";
			makeHtml += "<a class='red' href='javascript:void(0)' onclick='updateStateAjax("+this.ordersNo+", this)'>취소 완료</a>";
		}else if(this.ordersState == '환불 완료'){
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

var i = 0;
function makeFormVal(element){
	var result = "";
	if($('form[name=frmOrders]').find('.fos2').val() == $(element).val()){
		result+="";
	}else{
		result += "<input type='hidden' class='fos2' name='sortOrderViewItems[" + i + "].ordersNo' value='" + $(element).val() + "'>";
		result += "<input type='hidden' class='fOs' name='sortOrderViewItems[" + (i++) + "].ordersState'>";	
	}
	
	$('form[name=frmOrders]').append(result);
}

function updateStateAjax(ordersNo, element){
	var state = $(element).text();
	console.log("ordersNo : " + ordersNo, "ordersState : " + state);
	$('#confirmModalBody').html("ordersNo : " + ordersNo + "의 주문 상태를 \"" +state+ "\" (으)로 바꾸시겠습니까?");
	$('#confirmOk').attr("onclick","ajaxUpdateOrdersState(" + ordersNo+", " + "'"+state+"'" + ")");
	$('#confirmModalBtn').trigger('click');
}

function ajaxUpdateOrdersState(ordersNo, state){
	$.ajax({		
		url:"<c:url value='/admin/order/orderAjaxUpdateState'/>",
		type:'POST',
		data:{
			ordersNo: ordersNo,
			ordersState: state
		},
		success:function(cnt){
			if(cnt > 0){
				$('#alertModalBody').html("\"" + state+"\" (으)로 주문 상태 수정 성공했습니다.");
				$('#alertModalBtn').trigger('click');
				ajaxFunc();
			} else {
				$('#alertModalBody').html("주문 상태 수정 실패했습니다...");
				$('#alertModalBtn').trigger('click');
			} 
		},
		error:function(xhr, status, error){
			alert(status + " : " + error);
		}
	})
}

function openDetail(ordersNo){
	var flagInput = $("#flagInput").val();
	location.href="orderDetail?ordersNo="+ordersNo+"&orderFlag="+flagInput;
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
function makeBtn(kos){
	var text = "";
	
	if (kos == '결제 완료'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>배송 준비</button>";
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>취소 완료</button>";
	}else if(kos == '배송 준비'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>배송중</button>";		
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>취소 완료</button>";
	}else if(kos == '배송중'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>배송완료</button>";
	}else if(kos == '배송 완료'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>취소 완료</button>";
	}else if(kos == '반품 신청'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>반품 완료</button>";
	}else if(kos == '교환 신청'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>교환 완료</button>";
	}else if(kos == '환불 신청'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>환불 완료</button>";
	}else if(kos == '취소 신청'){
		text+="<button class='btn btn-warning bg-gradient-secondary book-button' onclick='updateStateMuti(this)'>취소 완료</button>";
	}else {
		text+="";
	}
	
	return text;
}
function orderListPage(curPage){
	$('form[name=frmOrders]').html("");
	$("#allCheck").prop("checked", false);
	$('input[name=currentPage]').val(curPage);
	$('input[name=perRecord]').val($('#perRecord').val());
	ajaxFunc();
}

function updateStateMuti(element){
	var cnt = $("table input[type='checkbox']:checked").length;
	var ordersState = $(element).text();
	$('.fOs').val(ordersState);
	$(".goalState").val(ordersState);
	$("#os").val(ordersState);
	if(cnt < 1) {
		$('#alertModalBody').html("주문을 선택하세요.");
		$('#alertModalBtn').trigger('click');
		return false;
    } else {	
		$('#confirmModalBody').html(ordersState+"로 주문"+cnt+"개를 수정할까요?");
		$('#confirmOk').attr("onclick","updateStateAjax('+ordersState+')");
		$('#confirmModalBtn').trigger('click');
		
	}
}

function updateStateAjax(ordersState){
	$.ajax({
		url:"<c:url value='/admin/order/orderAjaxUpdateMulti'/>",
		type:"post",
		dataType:"json",
		data: $('form[name=frmOrders]').serializeArray(), 
		success:function(result){
			if(result > 0){
				$('#alertModalBody').html("주문상태 수정 성공");
				$('#alertModalBtn').trigger('click');
				$("#searchByKeywordBtn").trigger('click');
			} else {
				$('#alertModalBody').html("수정 실패");
				$('#alertModalBtn').trigger('click');
			}
		},
		error:function(xhr, status, error){
			$('#alertModalBody').html(xhr + status + error);
			$('#alertModalBtn').trigger('click');
		}
	});//ajax
}


function submitFunc(){
	$("form[name=serach]").submit();
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
		<h5>전체 주문 내역</h5>
		<button id="toggleBtn" class="btn btn-warning bg-gradient-secondary book-button"
			 type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
			  aria-expanded="false" aria-controls="collapseExample">검색창 열기</button>
	</div>
	
	
	<!--  -->
	<div>
	<div class="collapse" id="collapseExample">
	<input type="hidden" id="copy">
	<form name="serach">
		<input id="os" name="ordersState" type="hidden">
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
							<c:if test="${param.orderBy eq ''}">
						 		selected="selected"
							</c:if>
						 value="">all</option>
						<option
							<c:if test="${param.orderBy eq '결제 완료'}">
						 		selected="selected"
							</c:if>
						 value="결제 완료">결제 완료</option>
						<option
							<c:if test="${param.orderBy eq '배송 준비'}">
								selected="selected"
							</c:if>
						 value="배송 준비">배송 준비</option>
						<option
							<c:if test="${param.orderBy eq '배송중'}">
					 			selected="selected"
							</c:if>
						 value="배송중">배송중</option>
						<option
							<c:if test="${param.orderBy eq '배송 완료'}">
						 		selected="selected"
							</c:if>
						 value="배송 완료">배송 완료</option>
						<option
							<c:if test="${param.orderBy eq '취소 신청'}">
						 		selected="selected"
							</c:if>
						 value="취소 신청">취소 신청</option>
						<option
							<c:if test="${param.orderBy eq '취소 완료'}">
						 		selected="selected"
							</c:if>
						 value="취소 완료">취소 완료</option>
						<option
							<c:if test="${param.orderBy eq '반품 신청'}">
						 		selected="selected"
							</c:if>
						 value="반품 신청">반품 신청</option>
						<option
							<c:if test="${param.orderBy eq '반품 완료'}">
						 		selected="selected"
							</c:if>
						 value="반품 완료">반품 완료</option>
						<option
							<c:if test="${param.orderBy eq '교환 신청'}">
						 		selected="selected"
							</c:if>
						 value="교환 신청">교환 신청</option>
						<option
							<c:if test="${param.orderBy eq '교환 완료'}">
						 		selected="selected"
							</c:if>
						 value="교환 완료">교환 완료</option>
						<option
							<c:if test="${param.orderBy eq '환불 신청'}">
						 		selected="selected"
							</c:if>
						 value="환불 신청">환불 신청</option>
						<option
							<c:if test="${param.orderBy eq '환불 완료'}">
						 		selected="selected"
							</c:if>
						 value="환불 완료">환불 완료</option>
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
			<col style="width:13%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />	
			<col style="width:9%;" />	
			<col style="width:9%;" />
			<col style="width:9%;" />
			<col style="width:9%;" />			
		</colgroup>
		<thead>
			<tr class="book-table-colum">
				<th scope="col"><input type="checkbox" id="allCheck" class="book-checkbox"></th>
				<th scope="col" class="orderNo">주문번호</th>
				<th scope="col" class="orderProduct">주문상품</th>
				<th scope="col" class="orderUserid">이름/아이디</th>
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
	<form name="frmOrders">
	</form>
	<nav id="orderPaging" class="bookPaging" aria-label="Page navigation example">

	</nav>
	<div id="buttonDiv">
	
	</div>
	</div>
</div>

</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
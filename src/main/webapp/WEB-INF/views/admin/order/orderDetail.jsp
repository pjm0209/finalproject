<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<link href="<c:url value='/admin-css-js/css/book-order.css'/>" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

$(function(){
    $('#d_zipcode').change(function(){
    	$('#d_addr2').focus();
    });
});


function sample4_execDaumPostcode_bookDetail() {
    new daum.Postcode({
        oncomplete: function(data) {

            var roadAddr = data.roadAddress; 
            var extraRoadAddr = '';

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }

            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('d_zipcode').value = data.zonecode;
            document.getElementById("d_addr1").value = roadAddr;
        }
    }).open();
}

function updateRecipientAjax(){
	var ordersNo = $('#iptOrdersNo').val();
	var reZipcode = $('input[name=reZipcode]').val();
	var reHp = $('input[name=reHp]').val();
	var reAddress = $('input[name=reAddress]').val();
	var reAddressDetail = $('input[name=reAddressDetail]').val();
	var recipient = $('input[name=recipient]').val();
	$('#confirmModalBody').html("배송지 정보를 수정하시겠습니까?");
	$('#confirmOk').attr("onclick","ajaxUpdateRecipient()");
	$('#confirmModalBtn').trigger('click');
}

function ajaxUpdateRecipient(){
	var ordersNo = $('#iptOrdersNo').val();
	var reZipcode = $('input[name=reZipcode]').val();
	var reHp = $('input[name=reHp]').val();
	var reAddress = $('input[name=reAddress]').val();
	var reAddressDetail = $('input[name=reAddressDetail]').val();
	var recipient = $('input[name=recipient]').val();
	$.ajax({		
		url:"<c:url value='/admin/order/orderAjaxRecipient'/>",
		type:'POST',
		dataType:"json",
		data: {
			ordersNo: ordersNo,
			reZipcode: reZipcode,
			reHp: reHp,
			reAddress: reAddress,
			reAddressDetail: reAddressDetail,
			recipient: recipient
		},
		success:function(cnt){
			if(cnt > 0){
				$('#alertModalBody').html("배송지 정보 수정 성공했습니다.");
				$('#alertModalBtn').trigger('click');
				ajaxFunc();
			} else {
				$('#alertModalBody').html("배송지 정보 수정 실패했습니다...");
				$('#alertModalBtn').trigger('click');
			} 
		},
		error:function(xhr, status, error){
			alert(status + " : " + error);
		}
	});
}

function updateStateAjax(element){
	var state = $(element).text();
	var ordersNo = $("#iptOrdersNo").val();
	alert("ordersNo : " + ordersNo, "ordersState : " + state);
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


</script>
<input type="hidden" id="sample4_postcode" placeholder="우편번호">
<input type="hidden" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">
<div class="head-div">
	<h2 class="text-gray-800">주문 관리</h2>
</div>

<!--  -->
	<div class="wrap shadow-sm p-3 mb-5 bg-body rounded" style="margin: 15px 15px;background: white;">
		<div class="x_panel">
		<div class="x_title">
			
		</div>
		<div class="x_content">

			<form action="ordermainup" class="form-horizontal" id="frm" name="frm" method="post">
		


				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<h2><b>주문상품정보</b></h2>
						<div class="table-responsive">
							<table class="table ">
								<thead>
									<tr style="background-color: #f1f1f1">
										<th style="text-align: center;">상품이미지</th>
										<th style="text-align: center;">상품명<br>옵션</th>
										<th style="text-align: center;">상품코드</th>
										<th style="text-align: center;">판매가</th>
										<th style="text-align: center;">주문수량</th>
										<th style="text-align: center;">판매가합</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="map" items="${list}">
										<tr>
											<td style="text-align: center;vertical-align: middle;">
												<a href="<c:url value='/main/book/bookDetail?bookNo=${map.BOOK_NO}'/> " target="_blank">
													<img width="140px" src="<c:url value='/images/bookProduct/upload_img/${map.BOOK_IMG_NAME}'/>">
												</a>
											</td>
											<td style="text-align: center;vertical-align: middle;">
												${map.BOOK_TITLE}
											</td>
											<td style="text-align: center;vertical-align: middle;">${map.BOOK_NO}</td>
											<td style="text-align: center;vertical-align: middle;">
												<fmt:formatNumber value="${map.BOOK_PRICE}" pattern="#,###"/>원
											</td>
											<td style="text-align: center;vertical-align: middle;">
												<%-- <input style="text-align:center;margin:0 auto;width: 100px;" class="form-control" type="number" name="ordersQty" value="${map.ORDERS_QTY}"> --%>
												${map.ORDERS_QTY}
											</td>
											<td style="text-align: center;vertical-align: middle;">
												<fmt:formatNumber value="${map.BOOK_PRICE * map.ORDERS_QTY}" pattern="#,###"/>원
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<h2><b>결제정보</b></h2>
						<div class="table-responsive">
							<table class="table ">
								<colgroup>
									<col style="background-color: #f1f1f1;text-align: center" width="20%">
									<col width="80%">
								</colgroup>

								<tbody><tr>
									<th style="text-align: center;">주문번호</th>
									<td>${list[0].ORDERS_NO}</td>
								</tr>
								<tr>
									<th style="text-align: center;">결제타입</th>
									<td>
										${list[0].PAYMENT_METHOD}
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">배송비</th>
									<td>
										<c:if test="${list[0].SUM_PRICE >= TOTAL_PRICE}">
											0원
										</c:if>
										<c:if test="${list[0].SUM_PRICE < TOTAL_PRICE}">
											<fmt:formatNumber value="${DELIVERY}" pattern="#,###"/>
										</c:if>
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">결제금액</th>
									<td>
										<fmt:formatNumber value="${list[0].SUM_PRICE}" pattern="#,###"/> 원
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">주문상태</th>
									<td>
										${list[0].ORDERS_STATE}
									</td>
								</tr>
							</tbody></table>
						</div>
					</div>
				</div>
				<form name="recipientFrm">				
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<h2><b>배송정보</b></h2>
							<div class="table-responsive">
								<table class="table ">
									<colgroup>
										<col style="background-color: #f1f1f1;" width="20%">
										<col width="80%">
									</colgroup>
									<tbody><tr>
										<th style="text-align: center;vertical-align: middle;">받으시는 분</th>
										<td>
											<input class="form-control" id="odma_name" name="recipient" type="text" value="${list[0].RECIPIENT}">															
										</td>
									</tr>
									<tr>
										<th style="text-align: center;vertical-align: middle;">휴대전화</th>
										<td>
											<input class="form-control" id="odma_phone" name="reHp" type="text" value="${list[0].RE_HP}">
										</td>
									</tr>
									<tr>
										<th style="text-align: center;vertical-align: middle;">배송지</th>
										<td>
											<input type="hidden" id="iptOrdersNo" name="ordersNo" value="${list[0].ORDERS_NO}">
											<input type="button" class="form-control btn btn-primary zip" onclick="sample4_execDaumPostcode_bookDetail()" value="우편번호 검색"><br>
											<input type="text" class="form-control" placeholder="우편번호" name="reZipcode" id="d_zipcode" value="${list[0].RE_ZIPCODE}" readonly="readonly">
											<input type="text" class="form-control" placeholder="기본주소" name="reAddress" id="d_addr1" value="${list[0].RE_ADDRESS}" readonly="readonly" style="margin-top: 5px;">
											<input type="text" class="form-control" placeholder="상세주소" name="reAddressDetail" value="${list[0].RE_ADDRESS_DETAIL}" style="margin-top: 5px;">
										</td>
									</tr>
								</tbody></table>
							</div>
						</div>
					</div>
				</form>
				<div class="form-group">
					<div class=" text-right">
						<button style="margin: 0px 5px;" type="button" class="btn btn-success" onclick="updateRecipientAjax()"><i class="fas fa-save"></i>수 정</button>
						<button style="margin: 0px 5px;" type="button" class="btn btn-primary" onclick="location.href='<c:url value='/admin/order/orderList?flag=order'/>'"><i class="fas fa-list-ul"></i>리스트</button>
					<c:if test="${list[0].ORDERS_STATE == '결제 완료'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-success btn-sm" onclick="updateStateAjax(this)">배송 준비</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="updateStateAjax(this)">취소 완료</button>
						</div>
					</c:if>
					<c:if test="${list[0].ORDERS_STATE == '배송 준비'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-success btn-sm" onclick="updateStateAjax(this)">배송중</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="updateStateAjax(this)">취소 완료</button>
						</div>
					</c:if>
					<c:if test="${list[0].ORDERS_STATE == '배송중'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-success btn-sm" onclick="updateStateAjax(this)">배송 완료</button>
						</div>
					</c:if>
					<c:if test="${list[0].ORDERS_STATE == '배송 완료'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-danger btn-sm" onclick="updateStateAjax(this)">취소 완료</button>
						</div>
					</c:if>
					<c:if test="${list[0].ORDERS_STATE == '반품 신청'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-success btn-sm" onclick="updateStateAjax(this)">반품 완료</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="updateStateAjax(this)">취소 완료</button>
						</div>
					</c:if>
					<c:if test="${list[0].ORDERS_STATE == '교환 신청'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-success btn-sm" onclick="updateStateAjax(this)">교환 완료</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="updateStateAjax(this)">취소 완료</button>
						</div>
					</c:if>
					<c:if test="${list[0].ORDERS_STATE == '환불 신청'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-success btn-sm" onclick="updateStateAjax(this)">환불 완료</button>
							<button type="button" class="btn btn-danger btn-sm" onclick="updateStateAjax(this)">취소 완료</button>
						</div>
					</c:if>
					<c:if test="${list[0].ORDERS_STATE == '취소 신청'}">	
						<div class=" text-right">
							<button type="button" class="btn btn-danger btn-sm" onclick="updateStateAjax(this)">취소 완료</button>
						</div>
					</c:if>
					</div>
				</div>
				
			</form>
		</div>
	</div>
</div>
<!--  -->


</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
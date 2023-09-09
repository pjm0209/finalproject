<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<script type="text/javascript">
function sample4_execDaumPostcode_mypageDetail() {
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
</script>
<section id="order_complete" class="order_complete">
	<c:if test="${empty param.flag}">
		<h2>주문 완료</h2>
	</c:if>
	<c:if test="${!empty param.flag}">
		<h2>주문 상세보기</h2>
	</c:if>
	<ul class="complet_list1">
		<li>
			<p><strong>결제 정보</strong></p>
			<div class="flex">
				<p>가격</p>
				<p><span>${list[0].SUM_PRICE}</span>원</p>
			</div>
			<div class="flex">
				<p>배송비</p>
				<c:set var="deli" value="${DELIVERY}"/>
				<c:set var="limit" value="${TOTAL_PRICE}"/>
				<c:if test="${deli <  TOTAL_PRICE}">
					<c:set var="deli" value="0"/>
				</c:if>
				<p><span>${deli}</span>원</p>
			</div>
		</li>
		<li class="flex">
			<p><strong>총 결제 금액</strong></p>
			<p><strong><span>${list[0].SUM_PRICE + deli}</span>원</strong></p>
		</li>
		
	</ul>
	<ul class="complet_list2">
		<li>
		<form name="recipientFrm">				
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<p><strong>수령인 - 주소 수정</strong></p>
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
											<input type="button" class="form-control btn btn-primary zip" onclick="sample4_execDaumPostcode_mypageDetail()" value="우편번호 검색"><br>
											<input type="text" class="form-control" placeholder="우편번호" name="reZipcode" id="d_zipcode" value="${list[0].RE_ZIPCODE}" readonly="readonly">
											<input type="text" class="form-control" placeholder="기본주소" name="reAddress" id="d_addr1" value="${list[0].RE_ADDRESS}" readonly="readonly" style="margin-top: 5px;">
											<input type="text" class="form-control" placeholder="상세주소" name="reAddressDetail" value="${list[0].RE_ADDRESS_DETAIL}" style="margin-top: 5px;">
										</td>
									</tr>
									<tr>
										<td>
											<div>
												<button type="button" class="btn btn-primary" onclick="updateRecipientAjax()"><i class="fas fa-save"></i>배송지 수정</button>
											</div>
										</td>
									</tr>
								</tbody></table>
							</div>
						</div>
					</div>
				</form>
			
			
		</li>
	</ul>
	<ul class="complet_list3">
		<li>
			<p><strong>구매 항목</strong></p>
			<ul>
				<c:forEach var="map" items="${list}">
					<li class="flex list">
						<img alt="${map.BOOK_IMG_ORIGINALNAME}" src="http://localhost:9091/mbti/images/bookProduct/upload_img/${map.BOOK_IMG_NAME}">
						<div class="text_box">
						<p><span>${map.BOOK_PRICE}</span>원</p>
						<p><span>${map.BOOK_TITLE}</span> &middot; <span>${map.ORDERS_QTY}</span>개</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</li>
	</ul>
	<a href="<c:url value='/main/mypage/mypageOrderList'/>" class="list_btn">주문목록가기</a>
</section>

<section class="booklist_right">
	
</section>
	
<%@ include file="../inc/bottom.jsp"%>
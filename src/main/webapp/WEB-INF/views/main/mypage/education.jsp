<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	$(function(){
		$("#eduLikeDelBtn").click(function(){
			$('.eduLike').find('tbody tr').each(function(){
				var result = $(this).find('input[type=checkbox]').is(':checked');
				var eduNo = $(this).find('input[name=eduNo]').val();
				
				if(result) {
					eduLikeDel(eduNo);
					
					$(this).remove();
				}
			});
		});
	});
	
	//결제하기 버튼
	var id=0;
	
	function requestPay() {
	    // IMP.request_pay(param, callback) 결제창 호출
	    var login= "${sessionScope.userid}";
	    var name=$('input[type=checkbox]:checked:not(#check-All-my)').parent().parent().find('#eduName').html();
	    var price=$('input[type=checkbox]:checked:not(#check-All-my)').parent().parent().parent().find('input[name=eduPrice]').val();
	    
	    var eduAppNo = $('#edu-pay-tb').find('input[type=checkbox]:checked').val();
	    
		var count = $('input[type=checkbox]:checked').length;
		
		if($('input[type=checkbox]:checked').length>1){
			$('#alertModalBody').html("결제할 교육을 하나만 선택하세요.");
			$('#alertModalBtn').trigger('click');
			return false;
		}
		
		if(count < 1) {
			$('#alertModalBody').html('결제할 교육을 선택하세요.');
			$('#alertModalBtn').trigger('click');
			return false;
		}

	    
	    if(login!=null && login!=''){
		    var uid = '';
		    IMP.init('imp68002104');
		    IMP.request_pay({ // param
		        pg: 'kakaopay',
		        pay_method: "card",
		        merchant_uid: id, //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
		        name: name, //결제창에 노출될 상품명
		        amount: price, //금액
		        buyer_email : "email@naver.com", 
		        buyer_name : "이름",
		        buyer_tel : "전화번호",
		    }, function (rsp) { // callback
		    	
		    	if(rsp.success) {
		    		$.ajax({
		    			url:"/mbti/main/mypage/payAjax",
		    			data:{eduAppNo : eduAppNo,
		    				  eduName : name, 
		    				  eduPrice : price
						},
						dataType:"TEXT",
		    			type:"POST",
		    			success:function(res){
		    				$('#alertModalBody').html("결제 완료");
							$('#alertModalBtn').trigger('click');
							$('#alertModal').on('hidden.bs.modal',function(){
				    			location.href="<c:url value='/main/mypage/education'/>";
							});
		    			},
		    			error:function(xhr, status, error){
		    				alert(status+" : "+error);
		    			}
		    		});
		    	}else{
		    		$('#alertModalBody').html("결제 실패");
					$('#alertModalBtn').trigger('click');
		    	}
			});
	    }
	}


	//신청 취소 버튼
	function applyCancel(a){
		var parent = $(a).parent();
		var count = $(parent).find('input[type=checkbox]:checked').length;
		
		if(count < 1) {
			$('#alertModalBody').html('신청 취소할 교육을 선택하세요.');
			$('#alertModalBtn').trigger('click');
			return false;
		}
		
		$('#confirmModalBody').html('선택한 교육의 신청을 취소하시겠습니까?');		
		$('#confirmOk').attr('onclick', "applyCan()");	 		 
        $('#confirmModalBtn').trigger('click');
        
	}
	
	function applyCan() {
		/* $('#myAppDelFrm').attr('action', '/mbti/main/mypage/applyCan'); */
		$('form[name=frmDelete]').submit();
	}
</script>

<section id="myEduPage">
<div class="board-body" style="width:87%">
	<div class="myEduBoard" style="margin-top: 35px;">
	<div class="board-head">
	<div id="eduApply-title">
		<h4>찜하기 목록</h4>
	</div>
	<!-- 찜하기 목록 -->
	<form name="frmDelete" method="post" class="eduLike" id="myAppDelFrm" action="<c:url value='/main/mypage/applyCan'/>">
		<table class="table" id="educationtb" style="margin-top:30px;">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="like-check-All" class="board-checkbox edu-check-All"></th>
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 날짜</th>
					<th scope="col">교육비</th>
					<th scope="col">교육장</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="idx" value="0"/>
				<c:if test="${empty likeList }">
					<tr>
						<td colspan="9">찜한 교육이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty likeList }">
					<c:set var="idx" value="0"/>
					<c:forEach var="map" items="${likeList}">
							<tr>
								<th scope="row">
									<input type="checkbox" class="edu-like-checkbox board-checkbox" name="eduNo" value="${map.EDU_NO }">
								</th>
								<td>${map.EDU_NAME }</td>
								<td>${map.EDU_TEA_NAME }</td>
								<td>${map.EDU_COM }</td>
								<td><fmt:formatNumber value="${map.EDU_PRICE }" pattern="#,###"/>
								<td>${map.EP_NAME }</td>
							</tr>
							<c:set var="idx" value="${idx + 1 }" />
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<input type="button" id="eduLikeDelBtn" value="취소하기" class="myPageBtn"/>
	</form>	
	<!-- 신청 현황 -->
	<form name="frmDelete" method="post" id="myAppDelFrm" action="<c:url value='/main/mypage/applyCan'/>">
	<div id="eduApply-title">
			<h4>신청 현황</h4>
		</div>
		<table class="table" id="educationtb" style="margin-top:30px;">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="edu-check-All" class="board-checkbox edu-check-All"></th>
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 날짜</th>
					<th scope="col">교육비</th>
					<th scope="col">교육장</th>
					<th scope="col">신청 현황</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="idx" value="0"/>
				<c:if test="${empty list }">
					<tr>
						<td colspan="9">신청한 교육이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach var="educationVo" items="${list}">
						<c:set var="educationNo" value="${educationVo.eduAppNo}"/>
						<tr>
							<th scope="row">
								<input type="checkbox" class="edu-checkbox board-checkbox" name="eduAppNo" value="${educationVo.eduAppNo }">
							</th>
							<td>${educationVo.eduName }</td>
							<td>${educationVo.eduTeaName }</td>
							<td>${educationVo.eduCom }</td>
							<td><fmt:formatNumber value="${educationVo.eduPrice }" pattern="#,###"/>
							<td>${educationVo.epName }</td>
							<td>${educationVo.eduAppFlag }</td>
						</tr>
						<c:set var="idx" value="${idx + 1 }" />
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<input type="button" id="applyDelBtn" value="신청 취소" onclick='applyCancel(this)'/>
		</form>	
		<!-- 결제 대기 목록 -->
		<form name="frmPay" method="post" id="myAppPayFrm" action="<c:url value='/main/mypage/applyPay'/>">
		<div id="eduApply-title">
			<h4>결제 대기</h4>
		</div>
		<table class="table" id="edu-pay-tb" style="margin-top:30px;">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All-my"></th>
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 날짜</th>
					<th scope="col">교육비</th>
					<th scope="col">교육장</th>
					<th scope="col">결제 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty payList }">
					<tr>
						<td colspan="9">결제할 교육이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty payList }">
					<c:forEach var="educationVo" items="${payList}">
						<c:set var="educationNo" value="${educationVo.eduAppNo}"/>
						<tr>
							<th scope="row"><input type="checkbox" class="edu-checkbox-my" name="eduAppNo" value="${educationVo.eduAppNo }"></th>
							<td id="eduName">${educationVo.eduName }</td>
							<td>${educationVo.eduTeaName }</td>
							<td>${educationVo.eduCom }</td>
							<td id="eduPrice"><fmt:formatNumber value="${educationVo.eduPrice }" pattern="#,###"/>
							<td>${educationVo.epName }</td>
							<td>${educationVo.eduAppPay }</td>
						</tr>
						<input type="hidden" name="eduPrice" value="${educationVo.eduPrice}">
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<button type="button" class="myAppPayBtn" id="my-app-payBtn" onclick="requestPay()">결제하기</button>
		</form>	
		<!-- 결제 완료 목록 -->
		<form name="frmFinish" method="post" id="myAppFinFrm">
		<div id="eduApply-title">
			<h4>결제 완료</h4>
		</div>
		<table class="table" id="educationtb" style="margin-top:30px;">
			<thead>
				<tr class="board-table-colum">
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 날짜</th>
					<th scope="col">교육비</th>
					<th scope="col">교육장</th>
					<th scope="col">결제 상태</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty finList }">
					<tr>
						<td colspan="9">결제 완료된 교육이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty finList }">
					<c:forEach var="educationVo" items="${finList}">
						<c:set var="educationNo" value="${educationVo.eduAppNo}"/>
						<tr>
							<td id="eduName">${educationVo.eduName }</td>
							<td>${educationVo.eduTeaName }</td>
							<td>${educationVo.eduCom }</td>
							<td id="eduPrice"><fmt:formatNumber value="${educationVo.eduPrice }" pattern="#,###"/>
							<td>${educationVo.epName }</td>
							<td>${educationVo.eduAppPay }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</form>	
	</div>
	</div>
</div>
</section>

<%@include file="../inc/bottom.jsp" %>
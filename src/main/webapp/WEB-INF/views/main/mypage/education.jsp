<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	//결제하기 버튼
	var id=0;
	
	function requestPay() {
	    // IMP.request_pay(param, callback) 결제창 호출
	    var login= "${sessionScope.userid}";
	    var name=$('input[type=checkbox]:checked:not(#check-All-my)').parent().parent().find('#eduName').html();
	    var price=$('input[type=checkbox]:checked:not(#check-All-my)').parent().parent().find('#eduPrice').html();
	    
	    alert("교육명 = "+ name+", 가격 = "+ price);
	    
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
		    }, function (rsp) { // callback\
		    	var eduAppNo = $('#edu-pay-tb').find('input[type=checkbox]:checked');
		    	if(rsp.success) {
		    		$.ajax({
		    			url:contextPath + "/main/mypage/payAjax",
		    			data:{"eduAppNo" : eduAppNo.val()},
		    			type:"POST",
		    			dataType:"text",
		    			success:function(res){
		    				alert(res);
		    			},
		    			error:function(xhr, status, error){
		    				alert(status+" : "+error);
		    			}
		    		});
		    		location.href="<c:url value='/main/mypage/education'/>";
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
		$('#myAppDelFrm').attr('action', contextPath + '/main/mypage/applyCan');
		$('form[name=frmDelete]').submit();
	}
</script>

<section id="myEduPage">
<div class="board-body" style="width:87%">
	<div class="myEduBoard" style="margin-top: 35px;">
	<div class="board-head">
	<div id="eduApply-title">
		<h4>교육 신청 현황</h4>
	</div>
	<form name="frmDelete" method="post" id="myAppDelFrm" action="<c:url value='/main/mypage/applyCan'/>">
		<table class="table" id="educationtb" style="margin-top:30px;">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 기간</th>
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
								<input type="checkbox" class="board-checkbox" name="eduAppNo" value="${educationVo.eduAppNo }">
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
		<form name="frmDelete" method="post" id="myAppPayFrm" action="<c:url value='/main/mypage/applyPay'/>">
		<div id="eduApply-title">
			<h4>결제 대기</h4>
		</div>
		<table class="table" id="edu-pay-tb" style="margin-top:30px;">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All-my"></th>
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 기간</th>
					<th scope="col">교육비</th>
					<th scope="col">교육장</th>
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
							<th scope="row"><input type="checkbox" class="board-checkbox-my" name="eduAppNo" value="${educationVo.eduAppNo }"></th>
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
		<button type="button" class="myAppPayBtn" id="my-app-payBtn" onclick="requestPay()">결제하기</button>
		</form>	
		<!-- 결제 완료 목록 -->
		<form name="frmDelete" method="post" id="myAppFinFrm">
		<div id="eduApply-title">
			<h4>결제 완료</h4>
		</div>
		<table class="table" id="educationtb" style="margin-top:30px;">
			<thead>
				<tr class="board-table-colum">
					<th scope="col">교육 이름</th>
					<th scope="col">강사명</th>
					<th scope="col">교육 기간</th>
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
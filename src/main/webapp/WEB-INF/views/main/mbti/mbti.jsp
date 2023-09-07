<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var id=0;

function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    var login= "${sessionScope.userid}";
    if(login!=null && login!=''){
	    var uid = '';
	    IMP.init('imp68002104');
	    IMP.request_pay({ // param
	        pg: 'kakaopay',
	        pay_method: "card",
	        merchant_uid: id, //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
	        name: "MBTI 정식검사", //결제창에 노출될 상품명
	        amount: "50000", //금액
	        buyer_email : "email@naver.com", 
	        buyer_name : "이름",
	        buyer_tel : "전화번호",
	    }, function (rsp) { // callback
	    	if(rsp.success) {
	    		location.href="<c:url value='/main/mbti/question?questionTypeNo=2'/>";
	    	}else{
	    		$('#alertModalBody').html("결제 실패");
				$('#alertModalBtn').trigger('click');
	    	}
	        
		});
    }else{
    	id=id+1;
		$('#alertModalBody').html("먼저 로그인 하세요");
		$('#alertModalBtn').trigger('click');
		$('#btnClose').click(function(){
			location.href="<c:url value='/main/member/memberLogin'/>";
			return false;
		})
    }
}
</script>
<section id="mbti" class="mbti">
	<c:if test="${!empty sessionScope.no}">
		<c:set var="isLogin" value="true" />
	</c:if>
	<c:if test="${empty sessionScope.no}">
		<c:set var="isLogin" value="false" />
	</c:if>
	<div id="mbti-title">
		<div id="mbti-div">
			<form name="frm-mbti1" id="frm-mbti1" method="post" action="<c:url value='/main/mbti/question'/>">
				<input type="hidden" name="questionTypeNo" value="1"/>
				<button type="submit" class="mbti-button2" id="mbti-free-button">간이 검사</button>
			</form>
			<button type="submit" class="mbti-button2" id="mbti-precise-button" onclick="requestPay()">정식 검사</button>
		</div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>
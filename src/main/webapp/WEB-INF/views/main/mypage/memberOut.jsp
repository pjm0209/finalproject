<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>     
<script type="text/javascript">
   $(function(){
     $('#btnOut').click(function() {
         if (!$('#agree_check').is(':checked')) {
             alert("회원탈퇴에 동의하셔야 합니다.");
         } else {
        	 window.location.href = "<c:url value='/main/mypage/memberOutPwd'/>";
           }
     });          
   });  
</script>

<style>
h2{
	font-weight:bold;
}
.memberOut-agreement{
	text-align:left;
	margin-top: 150px;
	margin-left: 300px;
	margin-right: 300px;
}

.top-border{
	border: 2px solid #ccc;
	background:	#ffeaed;
}

.content{
	color: red;
	font-weight: bold;
	font-size: 15px;
	margin-top: 20px;
	margin-left: 20px;
}

.content1{
	margin-left: 20px;
	font-size: 15px;
}

span{
	font-size: 20px;
	font-weight: bold;
}

.bottom-border{
	border: 2px solid #ccc;
	background:	#e9e9e9;
}

.content2{
	font-size: 15px;
	margin-top: 20px;
	margin-left: 20px;
}

.consent{
	font-size: 20px;
	font-weight: bold;
	color: #808080;	
}

#btnOut{
     font-size: 18px;
     padding: 10px 20px;
     background-color: red;
     color: white;
     border: none;
     cursor: pointer;	
}
</style>

<div class="memberOut-agreement">
<form name="form-memberOut" id="memberOut-form" method="post" action="<c:url value='/member/memberOut'/>" >
<h2>회원 탈퇴</h2><br>
	<div class="top-border">
		<div class="content">
			<p>회원탈퇴시 개인정보 및 ESSENTIAL MBTI에서 만들어진 모든 데이터는 삭제됩니다.</p>
			<p>(단,아래 항목은 표기된 법률에 따라 특정 기간 동안 보관됩니다.</p>
		</div>
	
	<div class="content1">
		<p>1.계약 또는 청약철회 등에 관한 기록 보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률/보존 기간 : 5년</p>
		<p>2.대금결제 및 재화 등의 공급에 관한 기록 보존 이유: 전자상거래 등에서의 소비자보호에 관한 법류:/보존 기간: 5년</p>
		<p>3.전자 금융 거래에 관한 기록 보존 이유 : 전자금융거래법:/보존기간 : 5년</p>
		<p>4.소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유: 신용정보의 이용 및 보호에 관한 법률:/보존기간 : 5년</p>
		<p>5.신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유: 신용정보의 이용 및 보호에 관한 법률:/보존기간 : 3년</p>
		<p>6.전자(세금)계산서 시스템 구축 및 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시 제2016-3호)(전자세금계산서 사용자에 한함):/보존 기간 : 5년</p>
		<p>(단,(세금)계산서 내 개인식별번호는 3년 경과 후 파기)</p>
	</div>
	</div><br>
	
	<span>*유의사항</span><br><br>
	<div class="bottom-border">
	<div class="content2">
	<p> - 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며, 회원탈퇴 진행 시 해당 아이디는 영구적으로 삭제되어 재가입이 불가합니다.
	<p> - 소속된 회사가 존재할 경우, "탈퇴"회원으로 조회됩니다.</p>
	<p> - 회사가 ESSENTIAL MBTI내에 존재하는 경우, 회사에 귀속된 데이터에 대해서는 보관 됩니다.</p>
	</div>
	</div><br>

	<div class="consent" style="text-align:left">
		<input type="checkbox" id="agree_check">&nbsp;해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.
	</div><br>

	<div style="text-align:center">
		<input type="button" id="btnOut" value="회원탈퇴">
	</div>
	</form>
</div>
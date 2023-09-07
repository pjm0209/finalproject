<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link type="text/css" rel="stylesheet" href="<c:url value='/admin-css-js/css/bookMain.css'/>">

<script type="text/javascript" src="<c:url value='/admin-css-js/js/bookMain.js'/>"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){
	$('.order_step .step3 .pay_box a').click(function(){

		$('.order_step .step3 .pay_box a').removeClass('on');
		$(this).addClass('on');
	})
	
	$('.order_step .step2 .slide_box').click(function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
		}else{
			$(this).addClass('on');
		}
	})
	
	var total = 0;
	$(".total span").each(function(){
    	
    	var price = parseInt($(this).text());
    	total += price;
    	$(".notDeliTotal").text(total);
    });
	
	var deli = $("input[name=DELIVERY]").val();
	var limit = $("input[name=limit]").val();
	var notDeliTotal = $(".notDeliTotal").text();
	if(notDeliTotal < limit){
		$(".notDeliTotal").text(notDeliTotal + deli);
		$("#deli").text(deli);
	}
	
	$(".booklist_area ul:eq(0) li:eq(0)").find('p span').text(notDeliTotal);
	var realDeli = $("#deli").text();
	$(".booklist_area ul:eq(1) li p span").text(notDeliTotal + realDeli);
	
	$(".selfClose").click(function(){
		$("#exampleModal").modal('hide');
	});
	
	$("#recipient").change(function(){
		$('#recipient2').val($(this).val());
	});
	$("#reHp").change(function(){
		$('#reHp2').val($(this).val());
	});
	$('#reZipcode').change(function(){
		$('#reZipcode2').val($(this).val());
	});
    $("#reAddress").change(function(){
    	$('#reAddress2').val($(this).val());
	});
    $("#reAddressDetail").change(function(){
    	$('#reAddressDetail2').val($(this).val());
	});
    
});

function sample4_execDaumPostcode() {
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

            document.getElementById('reZipcode').value = data.zonecode;
            document.getElementById('reZipcode2').value= document.getElementById('reZipcode').value
            document.getElementById("reAddress").value = roadAddr;
            document.getElementById('reAddress2').value= document.getElementById('reAddress').value               
        }
    }).open();
} 

var id=0;

function requestPay(t, t2) {
    // IMP.request_pay(param, callback) 결제창 호출
    var login= "${sessionScope.userid}";
    if(login!=null && login!=''){
	    var uid = '';
	    IMP.init('imp68002104');
	    IMP.request_pay({ // param
	        pg: 'kakaopay',
	        pay_method: "card",
	        merchant_uid: id, //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
	        name: t2+" 외 "+t+"개", //결제창에 노출될 상품명
	        amount: "50000", //금액
	        buyer_email : "email@naver.com", 
	        buyer_name : "이름",
	        buyer_tel : "전화번호",
	    }, function (rsp) { // callback
	    	if(rsp.success) {
	    		location.href="<c:url value='/main/book/basekt/bookOrderComplete'/>";
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

<input type="hidden" id="sample4_postcode" placeholder="우편번호">
<input type="hidden" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="hidden" id="sample4_roadAddress" placeholder="도로명주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="hidden" id="sample4_detailAddress" placeholder="상세주소">

<input type="hidden" name="DELIVERY" value="${DELIVERY}">
<input type="hidden" name="limit" value="${TOTAL_PRICE}">

<section id="order_step" class="order_step" >
	<h2>주문/결제</h2>
	<ul class="step">
		<li class="step1 flex shadow-sm bg-body rounded">
			<p class="box_tit">배송지 정보</p>
			<div class="rt_box ">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap"
				style="width: 700px;">
				주소 찾기
				</button>
			</div>
		</li>
		<div class="collapse shadow-sm bg-body rounded" id="collapseExample">
			  <div class="card card-body" style="display: flex;align-items: center;margin-bottom: 15px;">
			    <div class="modal-dialog shadow-sm bg-body rounded" style="margin: 50px 50px 50px 50px;width: 500px">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">입력된 주소</h1>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="mb-3 div-register">
				            <label for="recipient2" class="col-form-label">수령인 이름 :</label>
				            <input type="text" class="form-control" id="recipient2" name="recipient" placeholder="성함 입력">&nbsp;
				            <label for="reHp2" class="col-form-label">수령인 휴대폰 번호 :</label>
				            <input type="text" class="form-control" id="reHp2" name="reHp" placeholder="010-0000-0000">&nbsp;	
				          </div>
				          <div class="mb-3 div-register">
				            <label for="reZipcode" class="col-form-label">우편번호 :</label>
				            <input type="text" class="postalCode form-control" id="reZipcode2" name="reZipcode" placeholder="우편번호를 검색하세요">&nbsp;	
							<input type="Button" class="form-control btn-primary" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode()">	
				          </div>
				          <div class="mb-3 div-register">
				            <label for="reAddress" class="col-form-label">주소 :</label>
				            <input type="text" class="address form-control" id="reAddress2" name="reAddress" placeholder="주소를 입력하세요">
				          </div>
				          <div class="mb-3 div-register">
				            <label for="reAddressDetail2" class="col-form-label">상세주소 :</label>
				            <input type="text" class="addressDetail form-control" id="reAddressDetail2" name="reAddressDetail" placeholder="상세주소를 입력하세요">
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				      </div>
				    </div>
				  </div>
			  </div>
			</div>
		<li class="step2 shadow-sm bg-body rounded">
			<a href="javascript:void(0);" class="slide_box  flex">
				<p class="box_tit">주문 상품</p>
				<div class="rt_box flex">
					<p>총<span class="notDeliTotal">0</span>원</p>
					<span class="material-symbols-outlined"> keyboard_arrow_down </span>
				</div>
			</a>
			<ul class="">
				<c:if test="${empty mapList}">
					<div style="margin-left: 275px;margin-top: 110px;">
						<p>장바구니가 비어있습니다.</p>
							<img src="<c:url value='/images/empty.jpg'/>" alt="빈 장바구니" class="">
					</div>
				</c:if>
				<c:if test="${!empty mapList}">
					<c:forEach var="map" items="${mapList}">
					<li class="flex">
						<a href="javascript:void(0);"><img width="100px" alt="${map['BOOK_IMG_ORIGINALNAME']}" src="/mbti/images/bookProduct/upload_img/${map['BOOK_IMG_NAME']}" ></a>
						<p class="title">${map['BOOK_TITLE']} ${t}${t2}</p>
						<p class="book_count"><span>${map['BASKET_QTY']}</span>개</p>
						<p><span>${map['BOOK_PRICE']}</span>원</p>
						<p class="total"><span>${map['BOOK_PRICE'] * map['BASKET_QTY']}</span>원</p>
					</li>
					</c:forEach>
				</c:if>
			</ul>
		</li>
		<li class="step3 shadow-sm bg-body rounded">
			<p class="box_tit">결제 수단</p>
			<div class="pay_box flex">
				<a href="javascript:void(0);">신용카드</a>
				<a href="javascript:void(0);">카카오페이</a>
				<a href="javascript:void(0);">온라인입금</a>
				<a href="javascript:void(0);">휴대폰결제</a>
				<a href="javascript:void(0);">무통장입금</a>
			</div>
		</li>
		
	</ul>
	
</section>

<section class="booklist_right">
	<ul class="flex">
		<li>
		<span class="material-symbols-outlined"> counter_1 </span>
		장바구니
		</li>
		<li class="on">
		<span class="material-symbols-outlined  "> counter_2 </span>
		주문/결제
		</li>
		<li>
		<span class="material-symbols-outlined  "> counter_3 </span>
		주문완료
		</li>
	</ul>
	<div class="booklist_area shadow-sm bg-body rounded">
			
				<ul>
					<li class="flex">
						<p>상품금액</p>
						<p><span>0</span>원</p>
					</li>
					<li class="flex">
						<p>배송비</p>
						<p><span id="deli">0</span>원</p>
					</li>
				</ul>
				<hr>
				<ul>
					<li class="flex">
						<p>총 금액</p>
						<p><span>0</span>원</p>
					</li>
					
				</ul>
				<c:set var="t" value="${fn:length(mapList)}"/>
				<c:set var="t2" value="${mapList[0].BOOK_TITLE}"/>
				<button type="submit" onclick="requestPay(${t}, ${t2})">결제하기</button>
		</div>
		
		
		<!-- 모달창 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">주소 입력</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		          <div class="mb-3 div-register">
		            <label for="recipient" class="col-form-label">수령인 이름 :</label>
		            <input type="text" class="form-control" id="recipient"  placeholder="성함 입력">&nbsp;
		            <label for="reHp" class="col-form-label">수령인 휴대폰 번호 :</label>
		            <input type="text" class="form-control" id="reHp"  placeholder="010-0000-0000">&nbsp;	
		          </div>
		          <div class="mb-3 div-register">
		            <label for="reZipcode" class="col-form-label">우편번호 :</label>
		            <input type="text" class="postalCode form-control" id="reZipcode"  placeholder="우편번호를 검색하세요">&nbsp;	
					<input type="Button" class="form-control btn-primary" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode()">	
		          </div>
		          <div class="mb-3 div-register">
		            <label for="reAddress" class="col-form-label">주소 :</label>
		            <input type="text" class="address form-control" id="reAddress"  placeholder="주소를 입력하세요">
		          </div>
		          <div class="mb-3 div-register">
		            <label for="reAddressDetail" class="col-form-label">상세주소 :</label>
		            <input type="text" class="addressDetail form-control" id="reAddressDetail" placeholder="상세주소를 입력하세요">
		          </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button class="btn btn-primary selfClose" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" >
		        	완 료 
  				</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!--  -->
		
		
</section>

<%@ include file="../../inc/bottom.jsp"%>
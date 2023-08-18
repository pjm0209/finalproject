<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<link href="<c:url value='/admin-css-js/css/calendar.css'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='/admin-css-js/js/calendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar-6.1.8/dist/index.global.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar-6.1.8/packages/core/locales/ko.global.min.js'/>"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<script>

$(function() {

	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		String, default: 'bootstrap5',
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,multiMonthYear'
		},
		initialView: 'dayGridMonth',
		/*     initialDate: '2023-01-12', */
		locale: 'ko',
		/*  navLinks: true, // can click day/week names to navigate views */
		selectable: true,
		select: function(arg) {
			/* calendar.unselect() */
			var title = openModal(arg);
		},
		eventClick: function(arg){
			openModal(arg);
		},
		editable: true,
		dayMaxEvents: true, // allow "more" link when too many events
	    events: [
	    	if()
			{
				title: '결 제 금 액 : ',
				start: '2023-08-17',
				textColor : 'green',
				backgroundColor : "white",
				borderColor  : "white"
			},
			{
				title: '환 불 금 액 : ',
				start: '2023-08-17',
				textColor : 'red',
				backgroundColor : "white",
				borderColor  : "white"
			},
			{
				title: '매 출 액 : ',
				start: '2023-08-17',
				textColor : 'blue',
				backgroundColor : "white",
				borderColor  : "white"
			},{
				title: '결 제 금 액 : ',
				start: '2023-08-16',
				textColor : 'green',
				backgroundColor : "white",
				borderColor  : "white"
			},
			{
				title: '환 불 금 액 : ',
				start: '2023-08-16',
				textColor : 'red',
				backgroundColor : "white",
				borderColor  : "white"
			},
			{
				title: '매 출 액 : ',
				start: '2023-08-16',
				textColor : 'blue',
				backgroundColor : "white",
				borderColor  : "white"
			}
		] 
	});

	calendar.render();
	
	/* $('#calendar div:nth-child(2) table tbody tr td div div table tbody tr td div').attr('data-bs-toggle', 'modal');
	$('#calendar div:nth-child(2) table tbody tr td div div table tbody tr td div').attr('data-bs-target', '#exampleModal'); */
	
		
});


</script>
<style>
 
</style>
</head>
<body>
<div class="head-div">
	<h2 class="text-gray-800">매출 현황</h2>
</div>
<c:set var="price" value="10000원"/>
<!--  -->
<%@ include file="../book/bookSideBody.jsp"%>
<div class="board-body">
	<div id="board-title">
		<h5>매출 현황</h5>
	</div>
	<div class="shadow-sm p-3 mb-5 bg-body rounded" style="margin: 15px 0px;margin-right: 15px;background: white">
		<div>
			<ul class="list-group list-group-horizontal">
	            <li class="list-group-item">
	                <dl class="info payment align-right">
	                    <dt class="title">
	                        <i class="fas fa-fw fa-database greenF"></i>
	                        <span class="greenF align-right">결제 금액</span> 
	                    </dt>
	                    <dd id="payment" class="price"><span class="no">0</span><span class="unit">원</span></dd>
	                </dl>
	            </li>
	            <li class="list-group-item">
	                <dl class="info refund align-right">
	                    <dt class="tit">
	                        <i class="fas fa-fw fa-reply redF"></i>
	                        <span class="redF align-right">환불 금액</span> 
	                    </dt>
	                    <dd id="refund" class="price"><span class="no">0</span><span class="unit">원</span></dd>
	                </dl>
	            </li>
	            <li class="list-group-item">
	                <dl class="info sales align-right">
	                    <dt class="tit">
	                        <i class="fas fa-fw fa-cubes blueF"></i>
	                        <span class="blueF">매출액 </span>
	                    </dt>
	                    <dd id="sales" class="price"><span class="no">0</span><span class="unit">원</span></dd>
	                </dl>
	            </li>
			</ul>
           	<div id="ex1" class="modal" style="display: hidden;">
					      <div class="modal-header" style="background-image: linear-gradient(316deg, #c87fdf 10%, #5a63cf 100%);">
					      	<h3 id="modalLabel">매출정보 ( ${date} )</h3>
					      </div>
					      <div class="modal-body">
					      	<table class="table table-striped-columns" id="modalTable">
							  <tbody class="table-group-divider">
							    <tr>
							      <th scope="row">상품 결제금액</th>
							      <td>
							      	<fmt:formatNumber value="${money}" pattern="#,###"/>원
							      </td>
							    </tr>
							    <tr>
							      <th scope="row">배송비 결제금액</th>
							      <td>
							      	<fmt:formatNumber value="${money}" pattern="#,###"/>원
							      </td>
							    </tr>
							    <tr>
							      <th scope="row">상품 환불금액</th>
							      <td>
							      	<fmt:formatNumber value="${money}" pattern="#,###"/>원
							      </td>
							    </tr>
							     <tr>
							      <th scope="row">배송비 환불금액</th>
							      <td>
							      	<fmt:formatNumber value="${money}" pattern="#,###"/>원
							      </td>
							    </tr>
							     <tr>
							      <th scope="row">매출액</th>
							      <td>
							      	<b>
							      		<fmt:formatNumber value="1000000" pattern="#,###"/>
							      	</b>원
							      </td>
							    </tr>
							  </tbody>
							</table>
					      </div>
					      <div class="modal-footer">
					        <a href="#" rel="modal:close" type="button" class="btn btn-primary" data-bs-dismiss="modal" style="width: 100%;">닫기</a>
					      </div>
					</div>
	        <br><br>
				<!-- Cloudflare Pages Analytics -->	
			<div id='calendar'></div>
				<!-- Cloudflare Pages Analytics -->
			
		</div>
	</div>
</div>
</div>
</body>
<%@ include file="../inc/bottom.jsp"%>
</html>

<%@page import="java.text.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	var yearFisrtDay = new Date('2023-01-01');
	var yearFisrtDay2 = yearFisrtDay.getFullYear() + "-"
		+ ( (yearFisrtDay.getMonth() + 1) < 10 ? "0" + (yearFisrtDay.getMonth() + 1) : (yearFisrtDay.getMonth() + 1) )
		+ "-" + ( yearFisrtDay.getDate() < 10 ? "0" + yearFisrtDay.getDate() : yearFisrtDay.getDate());
	
	var yearLastDay = new Date('2023-01-01');
	var yearLastDay2 = yearLastDay.getFullYear() + "-"
		+ ( (yearLastDay.getMonth() + 1) < 10 ? "0" + (yearLastDay.getMonth() + 1) : (yearLastDay.getMonth() + 1) )
		+ "-" + ( yearLastDay.getDate() < 10 ? "0" + yearLastDay.getDate() : yearLastDay.getDate());
	
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
		dateClick: function(info) {
			console.log(info.dateStr);
			$('#dateStr').val(info.dateStr);
			openModal(info);
		},
		/*  navLinks: true, // can click day/week names to navigate views */
		selectable: true,
		select: function(info) {
			/* calendar.unselect() */
			console.log(info.dateStr);
			openModal(info);
		},
		eventClick: function(info){
			
			var date = info.event.start;
			var d = date.getFullYear() + "-"
			+ ( (date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1) )
			+ "-" + ( date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
			
			$('#dateStr').val(d);
			
			console.log(d);
			openModal(info);
		},
		editable: true,
		dayMaxEvents: true, // allow "more" link when too many events
	    events: [
		    	<% // 날짜 형식
		    	// 날짜 형식
		 		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
		 		Calendar cal = Calendar.getInstance();
		 		try {
		 			cal.setTime(dateFormat.parse("2023-12-32"));
		 		} catch (ParseException e) {
		 			e.printStackTrace();
		 		}
		 		/*
		 		 * 종료날짜: 금일-1일 셋팅 실행 조건이 특정일로부터 금일의 하루전까지 출력 만약 현재날짜라면 cal.add(Calendar.DATE, 1); 해줘야 함
		 		 */
		 		String nowDay = dateFormat.format(cal.getTime());
	
		 		// 시작 날짜 셋팅
		 		cal.set(2023, 0, 1);
	
		 		// while 비교를 위한 날짜 선언
		 		String nextDay = "";
	
		 		while (!nowDay.equals(nextDay)) {
		 			String resultDay = dateFormat.format(cal.getTime());
		 			String dot = ",";
					if(resultDay.equals("2023-12-31")) {
						dot = "";}%> 

	    		{
					title: '결 제 금 액 : ',
					start: "<%=resultDay%>",
					textColor : 'green',
					backgroundColor : "white",
					borderColor  : "white"
				},
				{
					title: '환 불 금 액 : ',
					start: "<%=resultDay%>",
					textColor : 'red',
					backgroundColor : "white",
					borderColor  : "white"
				},
				{
					title: '매 출 액 : ',
					start: "<%=resultDay%>",
					textColor : 'blue',
					backgroundColor : "white",
					borderColor  : "white"
				}<%=dot%>
			 <%
				cal.add(Calendar.DATE, 1); // 하루하루 더해준다.
	 			nextDay = dateFormat.format(cal.getTime()); // 비교를 위한 값 셋팅
			}%>
		] 
	});

	calendar.render();
		
});

$.setDate = function(date) {
	//endDay 기준으로 7일을 빼거나 1개월이나 3개월을 빼서 startDay에 셋팅
	//var d = new Date(년, 월, 일);
	//endDay를 Date형식으로 변환
	//endDay(String)를 Date형식으로 변환
	var str = date.split('-');

	$('#startDay').val($.findDate(d));

}

$.findDate = function(date) {
	return date.getFullYear()
		+ "-" + $.formatDate((date.getMonth() + 1)) + "-" + $.formatDate(date.getDate());
}
$.formatDate = function(d) {
	//(date.getMonth()+1) : 월
	//date.getDate() : 일
	if (d < 10) { // 10월 미만, 10일 미만
		d = "0" + d;
	}

	return d;
}

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
	        <br><br><input id="dateStr" type="text">
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

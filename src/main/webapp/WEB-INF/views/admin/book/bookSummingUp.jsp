<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<link href="<c:url value='/admin-css-js/css/calendar.css'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='admin-css-js/js/calendar.js'/>"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

</script>
<!-- Begin Page Content -->
<!-- Page Heading -->

<div class="head-div">
	<h2 class="text-gray-800">매출 현황</h2>
</div>

<!--  -->
<%@ include file="../book/bookSideBody.jsp"%>
<!--  -->

<div class="board-body">
	<div id="board-title">
		<h5>매출 현황</h5>
		<input type="button" class="bg-gradient-secondary" id="bt1" >
		<input type="button" class="bg-gradient-secondary" id="bt2" >
	</div>
	<div class="shadow-sm p-3 mb-5 bg-body rounded" style="margin: 15px 0px;margin-right: 15px;">
		<div>
			<ul class="list-group list-group-horizontal">
	            <li class="list-group-item">
	                <dl class="info payment align-right">
	                    <dt class="tit">
	                        <i class="fas fa-fw fa-database greenF"></i>
	                        <span class="greenF align-right">결제 금액</span> 
	                    </dt>
	                    <dd id="payment" class="	price"><span class="no">0</span><span class="unit">원</span></dd>
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
				<!-- Cloudflare Pages Analytics -->	
			<div id='calendar'></div>
				<!-- Cloudflare Pages Analytics -->
		</div>
	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
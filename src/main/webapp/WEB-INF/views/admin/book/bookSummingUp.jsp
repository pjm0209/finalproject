<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<link href="<c:url value='/admin-css-js/css/calendar.css'/>" rel="stylesheet">
<script type="text/javascript" src="<c:url value='admin-css-js/js/calendar.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar-6.1.8/'/>"></script> 
<script type="text/javascript" src="<c:url value='/resources/fullcalendar-6.1.8/dist/index.global.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/fullcalendar-6.1.8/packages/core/locales/ko.global.min.js'/>"></script>
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
      /* navLinks: true, // can click day/week names to navigate views */
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	  
    	var _width = '650';
    	var _height = '550';
    	 
    	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    	var popupX = Math.ceil(( $(window).width() - (_width)*1.7 )/2);
        var popupY = Math.ceil(( $(window).height() - _height*1.3 )/2); 
		
        var contextPath = "/mbti/admin/book";
       /*  var title =
        	window.open(contextPath+'/bookSummingUpPopup','팝업창',
        			'location=no,status=no,menubar=no,width=600,height=500,location=yes,resizable=no,left='+popupX+',top='+popupY); */ 
        			
        calendar.unselect()
      },
      /* eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true, */
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2023-01-01'
        },
        {
          title: 'Long Event',
          start: '2023-01-07',
          end: '2023-01-10',
          color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-01-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2023-01-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2023-01-11',
          end: '2023-01-13'
        },
        {
          title: 'Meeting',
          start: '2023-01-12T10:30:00',
          end: '2023-01-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2023-01-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2023-01-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2023-01-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2023-01-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2023-01-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2023-01-28'
        }
      ]
    });

    calendar.render();
    
    $('#calendar div:nth-child(2) table tbody tr td div div table tbody tr td div').click(function(){
    	$('#calendar div:nth-child(2) table tbody tr td div div table tbody tr td div').attr('data-bs-toggle', 'modal');
    	$('#calendar div:nth-child(2) table tbody tr td div div table tbody tr td div').attr('data-bs-target', '#exampleModal');	
    }); 
    
  });

</script>
<style>
  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  
  .fc .fc-button-primary {
    background-color: #6f42c1;
    border-color: #6f42c1;
	}
	
	.fc .fc-button-primary:not(:disabled).fc-button-active, .fc .fc-button-primary:not(:disabled):active {
    background-color: #6f42c1;
    border-color: #6f42c1;
	}
	.fc .fc-button-primary:disabled {
   		background-color: #E5CCFF;
    	border-color: #E5CCFF;
	}
	
	:root {
	--fc-today-bg-color: #E5CCFF;
	}
</style>
</head>
<body>
<div class="head-div">
	<h2 class="text-gray-800">매출 현황</h2>
</div>

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
	            <li class="list-group-item">
	            	<!-- Button trigger modal -->
					<button id='bt1' type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  Launch demo modal
					</button>
					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        ...
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
					</div>
	            </li>
	        </ul>
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

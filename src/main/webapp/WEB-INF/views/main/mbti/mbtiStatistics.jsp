<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['MBTI', 'SCORE'],
          <c:forEach var="map" items="${list}">
          	['${map["MBTI_TYPE"]}', ${map["COUNT"]}],
          </c:forEach>
        ]);

		var options = {
			slices: {
	            0: { color: '#6c51ff' },
	            1: { color: '#3ac906' },
	            2: { color: '#b9b136' },
	            3: { color: '#86c501' },
	            4: { color: '#009bff' },
	            5: { color: '#015eac' },
	            6: { color: '#163fbb' },
	            7: { color: '#03cecb' },
	            8: { color: '#6524d7' },
	            9: { color: '#f15d09' },
	            10: { color: '#d300ff' },
	            11: { color: '#de1764' },
	            12: { color: '#ff8900' },
	            13: { color: '#64aa0c' },
	            14: { color: '#ff74e7' },
	            15: { color: '#f6be06' }
	        }
		};

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data,options);
      }
</script>
<section>
	<div>
		<div id="chart1" class="mbtiRatio">
			<h1>MBTI 전체 비율</h1>
		</div>
	</div>
	<div id="piechart" style="width: 1400px; height: 800px;"></div>
	<!-- Pie Chart -->
                        <!-- <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                Card Header - Dropdown
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">MBTI별 비율</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
    		 
                                Card Body
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div> -->
</section>
<%@ include file="../inc/bottom.jsp"%>
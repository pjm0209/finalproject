<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="inc/top.jsp"%>

<!-- 데이터 -->
<input type="hidden" id="memMinus1" value="${memMinus1}">
<input type="hidden" id="memMinus2" value="${memMinus2}">
<input type="hidden" id="memMinus3" value="${memMinus3}">
<input type="hidden" id="memMinus4" value="${memMinus4}">
<input type="hidden" id="memMinus5" value="${memMinus5}">
<input type="hidden" id="memToday" value="${memToday}">

<c:set var="bookTotalPrice" value="0" />
<c:forEach var="map" items="${bookSalesList}">
	<c:set var="bookTotalPrice" value="${bookTotalPrice + map['SUMPRICE']}" />
</c:forEach>
<c:set var="mbtiTotalPrice" value="0" />
<c:forEach var="map" items="${mbtiSalesList}">
	<c:set var="mbtiTotalPrice" value="${mbtiTotalPrice + map['SUMPRICE']}" />
</c:forEach>
<c:set var="eduTotalPrice" value="0" />
<c:forEach var="map" items="${eduSalesList}">
	<c:set var="eduTotalPrice" value="${eduTotalPrice + map['SUMPRICE']}" />
</c:forEach>

<c:set var="totalPrice" value="0" />
<c:forEach var="map" items="${allSalesList}">
	<c:set var="totalPrice" value="${totalPrice + map['SUMPRICE']}" />
</c:forEach>
<c:set var="bookSales" value="0" />
<c:set var="mbtiSales" value="0" />
<c:set var="eduSales" value="0" />
<c:set var="regdate" value="0" />
<c:set var="sumCount" value="0" />
<script type="text/javascript">
	$(function(){
		chartAjax("day");
	});
	function chartAjax(d){
		$.ajax({
			url:"<c:url value='/admin/indexChartAjax'/>",
			data: {date : d},
			type: "POST",
			dataType: "json",
			success:function(res){
				console.log(res);
				drawChart2(res);
			},
			error:function(xhr,status,error){
				alert(status + " : "+ error);
			}
		});
	}

      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['MBTI', 'SCORE'],
          <c:forEach var="map" items="${pieChartList}">
          	['${map["MBTI_TYPE"]}', ${map["COUNT"]}],
          	<c:set var="sumCount" value="${sumCount+map['COUNT']}"/>
          </c:forEach>
        ]);

		var options = {
			title:"검사한 인원 : ${sumCount}명",
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

        var chart = new google.visualization.PieChart(document.getElementById('mbtiPiechart'));

        chart.draw(data,options);
      }
		function drawChart2(res) {
			var date = res[0].regdate.length;
			var title="";
			if(date==10){
				title="일별 총 매출";
			}
			if(date==7){
				title="월별 총 매출";
			}
			if(date==4){
				title="연별 총 매출";
			}
			google.charts.load('current', { 'packages': ['bar'] });
			google.charts.setOnLoadCallback(function () {
				var data = new google.visualization.DataTable();
				data.addColumn('string', "");
				data.addColumn('number', '책');
				data.addColumn('number', 'MBTI검사');
				data.addColumn('number', 'MBTI교육');
				
				//데이터 추가
				$.each(res, function (index, item) {
				    // salesList 배열의 길이를 확인하고 부족한 부분을 0으로 채웁니다.
				    while (item.salesList.length < 3) {
				        item.salesList.push({ SALES_CATEGORY_NO: null, REGDATE: null, SUMPRICE: 0 });
				    }
				    data.addRow([
				        item.regdate,
				        item.salesList[0].SUMPRICE, // 책 데이터
				        item.salesList[1].SUMPRICE, // MBTI검사 데이터
				        item.salesList[2].SUMPRICE  // MBTI교육 데이터
				    ]);
				});
				
				var options = {
					chart: {
						title: title,
					},vAxis: {
						format: '#,###원' // 값 뒤에 원(₩) 기호를 붙이고 천 단위 구분 기호를 사용합니다.
					}
				};
				
				var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
				
				chart.draw(data, google.charts.Bar.convertOptions(options));
			});
		}
      
      <c:set var="totalPrice" value="0"/>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {
        var data = google.visualization.arrayToDataTable([
          ['MBTI', 'SCORE'],
          <c:forEach var="map" items="${salesRateList}">
          	[<c:if test="${map['SALES_CATEGORY_NO']==1}">"책"</c:if>
          	<c:if test="${map['SALES_CATEGORY_NO']==2}">"MBTI검사"</c:if>
          	<c:if test="${map['SALES_CATEGORY_NO']==3}">"MBTI교육"</c:if>
          	,${map["SUMPRICE"]}],
          	<c:set var="totalPrice" value="${totalPrice + map['SUMPRICE']}"/>
          </c:forEach>
        ]);

		var options = {
			title:"총 매출 : <fmt:formatNumber value="${totalPrice}" pattern="#,###" />원",
			slices: {
	            0: { color: '#6c51ff' },
	            1: { color: '#3ac906' },
	            2: { color: '#b9b136' }
	        }
		};

        var chart = new google.visualization.PieChart(document.getElementById('salesPiechart'));
        
        google.visualization.events.addListener(chart, 'ready', function () {
            var svg = chart.getContainer().getElementsByTagName('svg')[0];
            svg.setAttribute('width', '2000'); // 원하는 가로 크기로 설정
            svg.setAttribute('height', '2000'); // 원하는 세로 크기로 설정
          });

        chart.draw(data,options);
      }
      
</script>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">매출 현황</h1>
		<!-- 		<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
 -->
	</div>

	<!-- Content Row -->
	<div class="row">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-primary text-uppercase mb-1">
								MBTI 검사</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<fmt:formatNumber value="${mbtiTotalPrice}" pattern="#,###" />
								원
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-won-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								MBTI 교육</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<fmt:formatNumber value="${eduTotalPrice}" pattern="#,###" />
								원
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-won-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-info text-uppercase mb-1">도서/자료
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
										<fmt:formatNumber value="${bookTotalPrice}" pattern="#,###" />
										원
									</div>
								</div>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-won-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">
								합산 매출</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<fmt:formatNumber value="${totalPrice}" pattern="#,###" />
								원
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-won-sign fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Content Row -->

		<div class="row">

			<!-- Area Chart -->
			<div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">총 매출 그래프</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Dropdown Header:</div>
								<a class="dropdown-item" href="#" onclick='chartAjax("day")'>일별 매출</a>
								<a class="dropdown-item" href="#" onclick='chartAjax("month")'>월별 매출</a>
								<a class="dropdown-item" href="#" onclick='chartAjax("year")'>연별 매출</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div id="columnchart_material"
						style="width: 1000px; height: 360px;"></div>
				</div>
			</div>
			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">MBTI별 비율</h6>
					</div>
					<!-- Card Body -->
					<div id="mbtiPiechart"
						style="width: 470px; height: 360px; margin: 0 auto; margin-left: 30px"></div>
				</div>
			</div>
		</div>
		<div style="width: 1050px; height: 700px;">
			<div class="card">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">판매 비율</h6>
				</div>
				<!-- Card Body -->
				<div id="salesPiechart"
					style="width: 1000px; height: 600px; margin: 0 auto; padding-left: 100px"></div>
			</div>
		</div>
	</div>
</div>
<!-- End of Main Content -->

<%@ include file="inc/bottom.jsp"%>
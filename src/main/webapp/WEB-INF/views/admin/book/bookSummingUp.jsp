<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>

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
	</div>
	
	<div>
		<div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">판매 상품별 비율</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="chart-pie pt-4 pb-2">
                    	<div class="chartjs-size-monitor">
                    		<div class="chartjs-size-monitor-expand">
                    			<div class=""></div>
                    		</div>
                    		<div class="chartjs-size-monitor-shrink">
                    			<div class=""></div>
                    		</div>
                    	</div>
                        <canvas id="myPieChart" width="1094" height="490" style="display: block; height: 245px; width: 547px;" class="chartjs-render-monitor">
                        	
                        </canvas>
                    </div>
                    <div class="mt-4 text-center small">
                        <span class="mr-2">
                            <i class="fas fa-circle text-primary">mbti검사지</i>
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-success">성인심리전문서적</i>
                        </span>
                        <span class="mr-2">
                            <i class="fas fa-circle text-info">유아심리전문서적</i>
                        </span>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	
	
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
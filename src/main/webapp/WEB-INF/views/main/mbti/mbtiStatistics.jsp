<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<section>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
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
    		 
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> ISFP
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> ISFJ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> ISTP
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> ISTJ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> INFP
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> INFJ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> INTP
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> INTJ
                                        </span><br>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> ESFP
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> ESFJ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> ESTP
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> ESTJ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> ENFP
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> ENFJ
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> ENTP
                                        </span>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> ENTJ
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
</section>
<%@ include file="../inc/bottom.jsp"%>
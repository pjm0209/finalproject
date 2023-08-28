<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript">
	//-----------------------차트 설정 시작-----------------------

	//rMateChart 를 생성합니다.
	//파라메터 (순서대로)
	//1. 차트의 id ( 임의로 지정하십시오. )
	//2. 차트가 위치할 div 의 id (즉, 차트의 부모 div 의 id 입니다.)
	//3. 차트 생성 시 필요한 환경 변수들의 묶음인 chartVars
	//4. 차트의 가로 사이즈 (생략 가능, 생략 시 100%)
	//5. 차트의 세로 사이즈 (생략 가능, 생략 시 100%)
	rMateChartH5.create("chart1", "chartHolder", "", "100%", "100%");

	//스트링 형식으로 레이아웃 정의.
	var layoutStr = '<rMateChart backgroundColor="#FFFFFF" borderStyle="none">'
			+ '<Options>'
			+ '<Caption text="Monthly Sales Distribution (2019 - 1H)"/>'
			+ '<SubCaption text="클릭한 파이차트 조각은 모두 삐져나옵니다.(Layout 참고)" fontSize="11" textAlign="right" paddingRight="10"/>'
			+ '<Legend useVisibleCheck="true"/>'
			+ '</Options>'
			+ '<CurrencyFormatter id="numFmt" currencySymbol="$" alignSymbol="left"/>'
			+ '<Pie2DChart showDataTips="true">'
			/*
			Pie2D 차트 생성시에 필요한 Pie2DChart 정의합니다
			showDataTips : 데이터에 마우스를 가져갔을 때 나오는 Tip을 보이기/안보이기 속성입니다.
			 explodingAlone : 클릭 시 쪼개져 나오는 파이 조각이 항상 1개인지 여부를 나타냅니다.
			 */
			+ '<series>'
			/* startAngle : 첫번째 데이터가 표현되는 파이 조각이 기본으로 3시 방향입니다.
			90도 반시계 방향으로 회전하여 12시 방향을 시작점으로 설정합니다. */
			/* perWedgeExplodeRadius : 파이 조각을 삐져나오게 하는 역할을 합니다.
			5번째 파이 조각이 삐져 나오게 설정되었습니다. 만약 2, 7 번째 파이 조각이 삐져나오게 설정하려면
			  perWedgeExplodeRadius="[0,0.1,0,0,0,0,0.1]" 로 설정하면 됩니다.*/
			+ '<Pie2DSeries nameField="Month" field="Sales" perWedgeExplodeRadius="[0,0,0.1,0,0,0]" labelPosition="inside" formatter="{numFmt}" color="#ffffff" renderDirection="counterClockwise" startAngle="90">'
			/* Pie2DChart 정의 후 Pie2DSeries labelPosition="inside"정의합니다 */
			+ '<showDataEffect>'
			/* 차트 생성시에 Effect를 주고 싶을 때 shoDataEffect정의합니다 */
			+ '<SeriesInterpolate/>'
			/*
			SeriesSlide 효과는 시리즈 데이터가 데이터로 표시될 때 한쪽에서 미끄러지듯 나타나는 효과를 적용합니다
			- 공통 -
			elementOffset : effect를 지연시키는 시간을 지정합니다 default:20
			minimumElementDuration : 각 엘리먼트의 최소 지속 시간을 설정합니다 default:0
			            이 값보다 짧은 시간에 effect가 실행되지 않습니다
			offset : effect개시의 지연시간을 설정합니다 default:0
			 perElementOffset : 각 엘리먼트의 개시 지연시간을 설정합니다
			- SeriesSlide -
			direction : left:왼쪽, right:오른쪽, up:위, down:아래 default는 left입니다
			 */
			+ '</showDataEffect>' + '</Pie2DSeries>' + '</series>'
			+ '</Pie2DChart>' + '</rMateChart>';

	//차트 데이터
	var chartData = [ {
		"Month" : "Jan",
		"Sales" : 42000
	}, {
		"Month" : "Feb",
		"Sales" : 15000
	}, {
		"Month" : "Mar",
		"Sales" : 10000
	}, {
		"Month" : "Apr",
		"Sales" : 9000
	}, {
		"Month" : "May",
		"Sales" : 18000
	}, {
		"Month" : "Jun",
		"Sales" : 20000
	} ];

	//rMateChartH5.calls 함수를 이용하여 차트의 준비가 끝나면 실행할 함수를 등록합니다.
	//
	//argument 1 - rMateChartH5.create시 설정한 차트 객체 아이디 값
	//argument 2 - 차트준비가 완료되면 실행할 함수 명(key)과 설정될 전달인자 값(value)
	//
	//아래 내용은 
	//1. 차트 준비가 완료되면 첫 전달인자 값을 가진 차트 객체에 접근하여
	//2. 두 번째 전달인자 값의 key 명으로 정의된 함수에 value값을 전달인자로 설정하여 실행합니다.
	rMateChartH5.calls("chart1", {
		"setLayout" : layoutStr,
		"setData" : chartData
	});

	/**
	 * rMateChartH5 3.0이후 버전에서 제공하고 있는 테마기능을 사용하시려면 아래 내용을 설정하여 주십시오.
	 * 테마 기능을 사용하지 않으시려면 아래 내용은 삭제 혹은 주석처리 하셔도 됩니다.
	 *
	 * -- rMateChartH5.themes에 등록되어있는 테마 목록 --
	 * - simple
	 * - cyber
	 * - modern
	 * - lovely
	 * - pastel
	 * -------------------------------------------------
	 *
	 * rMateChartH5.themes 변수는 theme.js에서 정의하고 있습니다.
	 */
	rMateChartH5.registerTheme(rMateChartH5.themes);

	/**
	 * 샘플 내의 테마 버튼 클릭 시 호출되는 함수입니다.
	 * 접근하는 차트 객체의 테마를 변경합니다.
	 * 파라메터로 넘어오는 값
	 * - simple
	 * - cyber
	 * - modern
	 * - lovely
	 * - pastel
	 * - default
	 *
	 * default : 테마를 적용하기 전 기본 형태를 출력합니다.
	 */
	function rMateChartH5ChangeTheme(theme) {
		document.getElementById("chart1").setTheme(theme);
	}
</script>
<section>
<rMateChart backgroundColor="#FFFFFF" borderStyle="none">
    <Options>
        <Caption text="Monthly Sales Distribution (2019 - 1H)"/>
        <SubCaption text="클릭한 파이차트 조각은 모두 삐져나옵니다.(Layout 참고)" fontSize="11" textAlign="right" paddingRight="10"/>
        <Legend useVisibleCheck="true"/>
    </Options>
    <CurrencyFormatter id="numFmt" currencySymbol="$" alignSymbol="left"/>
    <Pie2DChart showDataTips="true">
        <series>
            <Pie2DSeries nameField="Month" field="Sales" perWedgeExplodeRadius="[0,0,0.1,0,0,0]" labelPosition="inside" formatter="{numFmt}" color="#ffffff" renderDirection="counterClockwise" startAngle="90">
                <showDataEffect>
                    <SeriesInterpolate/>
                </showDataEffect>
            </Pie2DSeries>
        </series>
    </Pie2DChart>
</rMateChart>
	<div>
		<div id="chart1" class="mbtiRatio">
			<h1>MBTI 전체 비율</h1>
		</div>
	</div>
	<div>
		<div class="mbtiRatio">
			<h1>MBTI 남자 비율</h1>
		</div>
	</div>
	<div>
		<div class="mbtiRatio">
			<h1>MBTI 비율 비율</h1>
		</div>
	</div>
=======
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
>>>>>>> branch 'main' of https://github.com/pjm0209/finalproject.git
</section>
<%@ include file="../inc/bottom.jsp"%>
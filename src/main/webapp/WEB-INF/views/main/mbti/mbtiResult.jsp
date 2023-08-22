<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="mbtiSurvey" class="mbtiSurvey">
	<div class="mbti-result" style="background-image: url(<c:url value='/images/${resultMbti}.jpg'/>)">
		<div class="mbti-result-top">
			<h1 style="text-shadow: 1px 1px 3px #6524d7;">
				당신의 MBTI는<br><span style="color:#6524d7;">${resultMbti}</span> 입니다.
			</h1>
		</div>
	</div>
	<div class="character-type">
		<h2 style="color:#6524d7;">성격 유형</h2>
	</div>
	<!-- Project Card Example -->
    <div class="card shadow mb-4 mbti-div-size">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">성격 유형</h6>
        </div>
        <div class="card-body">
            <h4 class="font-weight-bold">내향형 ${resultI}%
	            <span class="float-right">외향형 ${resultE}%</span>
            </h4>
            <div class="progress mb-4"
            	<c:if test="${fn:substring(resultMbti,0,1)=='E'}">style="justify-content: flex-end;"</c:if>
            >
                <div class="progress-bar bg-danger" role="progressbar"
                style="width:
	                <c:if test="${fn:substring(resultMbti,0,1)=='I'}">${resultI}%;</c:if>
	                <c:if test="${fn:substring(resultMbti,0,1)=='E'}">${resultE}%;</c:if>"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <h4 class="font-weight-bold">감각형 ${resultS}%
	            <span class="float-right">직관형 ${resultN}%</span>
            </h4>
            <div class="progress mb-4"
            	<c:if test="${fn:substring(resultMbti,1,2)=='N'}">style="justify-content: flex-end;"</c:if>
            >
                <div class="progress-bar bg-warning" role="progressbar"
                style="width:
	                <c:if test="${fn:substring(resultMbti,1,2)=='S'}">${resultS}%;</c:if>
	                <c:if test="${fn:substring(resultMbti,1,2)=='N'}">${resultN}%;</c:if>"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <h4 class="font-weight-bold">사고형 ${resultT}%
	            <span class="float-right">감정형 ${resultF}%</span>
            </h4>
            <div class="progress mb-4"
            	<c:if test="${fn:substring(resultMbti,2,3)=='F'}">style="justify-content: flex-end;"</c:if>
            >
            	<div class="progress-bar" role="progressbar"
                style="width:
                	<c:if test="${fn:substring(resultMbti,2,3)=='T'}">${resultT}%;</c:if>
	            	<c:if test="${fn:substring(resultMbti,2,3)=='F'}">${resultF}%;</c:if>"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <h4 class="font-weight-bold">인식형 ${resultP}%
	            <span class="float-right">판단형 ${resultJ}%</span>
            </h4>
            <div class="progress mb-4"
            	<c:if test="${fn:substring(resultMbti,3,4)=='J'}">style="justify-content: flex-end;"</c:if>
            >
                <div class="progress-bar bg-info" role="progressbar"
                style="width:
	                <c:if test="${fn:substring(resultMbti,3,4)=='P'}">${resultP}%;</c:if>
		            <c:if test="${fn:substring(resultMbti,3,4)=='J'}">${resultJ}%;</c:if>"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
    </div>
	<div class="personality">
		<h2 style="color:#6524d7;">성격 특징</h2>
		<p style="color:#000000;">
			따뜻하고 협조적이며, 주변 사람들과 조화롭고 화합하기를 원한다.<br>
			상대의 감정을 잘 알아차리며 현실적으로 도와주고자 한다.<br>
			자기가 맡은 일은 끝까지 책임을 지며. 사소한 일에도 성실하게 임한다.
		</p>
		
	</div>
	<div class="inner" style="background-color:#6524d7;">
		<h2>주요 특징</h2>
	</div>
	<div class="defining" style="background-color:#dfcdff;">
		<div style="color:#14100c;font-weight: bold;">
			자신이 느끼는 감정을 남들도 비슷하게 느끼게 하기 위해 감정을 덜어내거나 추가하거나
			혹은 변형하는 등 다양하거나 독창적인 방식으로
			표현 방법을 찾고 가다듬는 능력을 개발한다.<br>
			<br>
			내면에 집중할수록 외부 세계의 사건이나 잇속에 무관심해지며 창조적 몰입에 빠지면서
			자신도 놀랄만한 창조를 하지만 종종 기이한 행동을 일으키기도 한다.<br>
			<br>
			내면의 몰입은 칙센트미하이가 말하는 무념무상의 창조적 상태를 말하며,
			식음을 전폐하는 엄청난 고통과 인내 속에서 막연히 표현하고
			싶었던 것의 실체를 구체화하며 종종 놀랄만한 결과를 창조하고
			스스로도 감격스러워하는 생겨 난다.<br>
			<br>
			이는 자신도 잘 이해할 수 없는 감정적 기복에서 일어나는 것으로
			창조적 활동에 수반되는 일종의 예술 행위의 부산물로 해석되어진다.<br>
			<br>
			일반적으로 남의 얘기를 듣기 보다는 말을 많이 하며
			자기 주장을 반복하고 남의 의견을 무시하는데,
			이는 고집이 세다기 보다는 자기중심성이 강해 남의 이야기 자체에 별로 관심을 두지 않기 때문이다.<br>
			<br>
			이로 인하여 대인 관계 기술을 잘 터득하지 못하고
			밀당을 못하기 때문에 사람들과 끈끈한 관계를
			만들지 못해 까칠하고 괴팍하다는 말을 자주 듣게 된다.<br>
		</div>
	</div>
	
	<div class="inner2" style="background-color:#6524d7;">
		<h2>강점 및 약점</h2>
	</div>
	<div class="defining2" style="background-color:#dfcdff;">
		<div id="strength" >
			<h2>강점</h2><br>
			<ul>
				<li>사교적입니다.</li> 
				<li>공감능력이 좋습니다.</li>
				<li>규칙을 잘 지키고 상냥합니다.</li> 
				<li>책임감이 강합니다. </li>
				<li>서비스 정신이 투철합니다. </li>
				<li>꼼꼼하고 성실하며 센스가 있습니다.</li> 
			</ul>
		</div><br>
		<div id="weakness" >
			<h2>약점</h2><br>
			<ul>
				<li>새로운 방법으로 일을 처리하기가 어려운 편입니다.</li> 
				<li>익숙하지 않은 것에 거부감이 큰 편입니다. </li>
				<li>주변 사람을 챙기기 위해 자신을 희생하는 편입니다.</li> 
				<li>비판을 받으면 심하게 상처받는 편입니다.</li> 
				<li>창의성이 부족한 편입니다.</li> 
				<li>상당히 감정적인 편입니다.</li> 
			</ul>
		</div>
	</div>
	
	<div id="mbti-jop" style="background-color: #dfcdff;">
		<span style="background-color:#6524d7;">관련 직업</span>
		<div class="mbti-jop" style="background-color: #6524d7;">
			<p>놀이와 창작을 요하는 엔터테인먼트 종사자<br>
				연예인, 영화 관련 종사자, 연극인, 게임, 애니메이션 등
			</p>
		</div>
		<div class="mbti-jop" style="background-color: #6524d7;">
			<p>신사업 기획자<br>
				대기업 및 중소기업의 신제품 및 신사업 기획
			</p>
		</div>
		<div class="mbti-jop" style="background-color: #6524d7;">
			<p>벤처 기업자<br>
				IT, 바이오, 로봇 등 첨단 기술을 포함하는 벤처 기업
			</p>
		</div>
	</div>
	
	<div id="mbti-compatibility" style="background-image: url('<c:url value="/images/2.jpg"/>')">
		<span style="background-color: #b8b13d;">궁합</span>
		<div id="best">
			<p>Best궁합은 ISTJ 현실주의자 유형입니다.</p>
			<p>
			   ISTJ는 실하게 행동하는 자신의 모습에서 자부심을 느끼며,<br>
			   자기 생각을 솔직하게 이야기하고 어떤 것에 헌신하기로 한 경우 최선을 다합니다.<br>
			   상대방에게 배려심이 깊고 인내심이 강한 편입니다.<br>
			   사귀기 시작하면 관계를 오래 지속하는 성격입니다.</p>
		</div>
		<div id="mbti-etc">
			<!-- <p>연애특징</p>
			<p>
				연애특징<br>
				1. 목적 없이 사람들과 어울리는 것을 싫어합니다.<br>
				
				2. 내향적 이성에겐 끌려 하지 않으며 밝고 활기찬 E type(외향적)을 선호합니다.<br>
				
				3. 본인이 진정 사랑하는 상대를 만나게 되면 모든 걸 다 쏟는 성격입니다.<br>
				
				4. 자신의 생각과 감정을 모두 표현해야 좋은 관계를 유지하는 데 도움이 됩니다.<br>
				
				5. 직관보다 현실과 사실을 중요시 합니다.
			</p> -->
		</div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>
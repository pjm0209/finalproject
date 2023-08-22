<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="mbtiSurvey" class="mbtiSurvey">
	<div class="mbti-result">
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
			삶과 죽음 속에서 솟아나는 사랑과 슬픔, 일상에서 느끼는 경외와 혐오 등 솟아나는 다양한 감정을 규명하고<br>
			이를 표현하려는 갈망이 진화한 것으로, 감정을 덜어내고 추가하면서 변형함으로써<br>
			자신의 느낌과 생각을 남도 알 게 하는 창의성을 키우지만 내면에 치우쳐 외부 환경에 둔감하고 대개는 대인 관계를 소홀하게 만든다.
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
				<li>사람들과 원활하게 소통하고, 타인의 감정을 잘 이해합니다.</li>
				<li>창의적이고 새로운 아이디어를 생각해내는 능력이 뛰어나며, 독창적인 해결책을 제시합니다.</li>
				<li>긍정적이고 열정적인 에너지를 가지고 있어, 동기부여와 영감을 주는 역할을 합니다.</li>
			</ul>
		</div>
		<div id="weakness" >
			<h2>약점</h2><br>
			<ul>
				<li>계획적인 일 처리보다는 즉흥적인 결정을 선호하는 경향이 있습니다.</li>
				<li>일을 끝내기 전에 새로운 일에 흥미를 느끼고 전환하는 경향이 있어, 일의 완성도가 낮을 수 있습니다.</li>
				<li>감정적으로 변덕스러울 때가 있어, 일관성을 유지하기 어려울 수 있습니다.</li>
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
	
	<div id="mbti-compatibility" style="background-color: #dfcdff;">
		<span style="background-color: #6524d7;">궁합</span>
		<div id="best" style="background-color: #6524d7;">
			<img src="<c:url value='/images/감사콩로아콘.png'/>" alt="best궁합 이미지" width="300" />
			<p>Best궁합은 ENTJ 유형입니다.</p>
			<p>ENTJ 도전을 즐기는 성격으로 충분한 시간과 자원이 주어진다면
			어떠한 목표도 달성할 수 있다고 믿습니다.<br>
			훌륭한 사업가가 될 가능성이 높으며, 전략적 사고 능력과 장기적 목표에 집중하고
			결단력 있게 계획을 실행하는 능력은 위대한 비즈니스 리더가 되는 데 도움이 됩니다.<br>
			한 번 연애에 빠지면 연애 상대에게 정말 잘해줍니다.<br>
			명확한 호불호를 가지고 있으며, 사랑도 열심히 공부하려고 합니다.</p>
		</div>
		<div id="mbti-etc" style="background-color: #6524d7;">
			<p>연애특징</p>
			<p>
				1. 연애하는 티를 잘 내지 않습니다.<br><br>
				2. 좋아하는 사람에게는 부드럽고 칭찬도 많이 해주는 편입니다.<br>
				(좋아하는 사람에게 약해지는 타입)<br><br>
				3. 자존심이 세고 논쟁을 좋아합니다<br><br>
				4. 워커홀릭이라 연애할 때 종종 갈등의 원인이 되기도 합니다.<br><br>
				5. 연애를 하면서도 본인의 사생활은 존중받아야 한다고 생각합니다.<br>
				(각자 개인의 시간 중요히 여김니다)<br><br>
				6. 은근 눈이 높은편이고 본인이랑 비슷한 사람을 좋아합니다.<br><br>
				7. 마음에 드는 상대가 있으면 은근 쉽게 사랑에 빠지는 편입니다.
			</p>
		</div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>
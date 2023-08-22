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
			${mbtiVo.personalityTrait}
		</p>
		
	</div>
	<div class="inner" style="background-color:#6524d7;">
		<h2>주요 특징</h2>
	</div>
	<div class="defining" style="background-color:#dfcdff;">
		<div style="color:#14100c;font-weight: bold;">
			${mbtiVo.definingTrait}
		</div>
	</div>
	
	<div class="inner2" style="background-color:#6524d7;">
		<h2>강점 및 약점</h2>
	</div>
	<c:set var="strength" value="${fn:split(mbtiVo.strength,'hr')}"/>
	<c:set var="weakness" value="${fn:split(mbtiVo.weakness,'hr')}"/>
	<div class="defining2" style="background-color:#dfcdff;">
		<div id="strength" >
			<h2>강점</h2><br>
			<ul>
				<c:forEach var="i" begin="0" end="${fn:length(strength)-1}">
					<li>${strength[i]}</li> 
				</c:forEach>
			</ul>
		</div><br>
		<div id="weakness" >
			<h2>약점</h2><br>
			<ul>
				<c:forEach var="i" begin="0" end="${fn:length(weakness)-1}">
					<li>${weakness[i]}</li> 
				</c:forEach>
			</ul>
		</div>
	</div>
	<c:set var="mbtiJop" value="${fn:split(mbtiVo.mbtiJop,'@')}"/>
	<div id="mbti-jop" style="background-color: #dfcdff;">
		<span style="background-color:#6524d7;">관련 직업</span>
	 	<c:forEach var="i" begin="0" end="${fn:length(mbtiJop)-1}">
			<div class="mbti-jop" style="background-color: #6524d7;">
				<p>${mbtiJop[i]}</p>
			</div>
	 	</c:forEach>
		
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
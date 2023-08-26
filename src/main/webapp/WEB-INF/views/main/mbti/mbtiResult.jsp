<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<section id="mbtiSurvey" class="mbtiSurvey">
	<c:if test="${resultMbti=='ISTP'}">
		<c:set var="color1" value="#3ac906"/>
		<c:set var="color2" value="#b4ff9a"/>
		<c:set var="color3" value="#e8ffe2"/>
		<c:set var="color4" value="#64a910"/>
	</c:if>
	<c:if test="${resultMbti=='ISTJ'}">
		<c:set var="color1" value="#6c51ff"/>
		<c:set var="color2" value="#beb3ff"/>
		<c:set var="color3" value="#e6e1ff"/>
		<c:set var="color4" value="#6423d7"/>
	</c:if>
	<c:if test="${resultMbti=='ISFJ'}">
		<c:set var="color1" value="#86c501"/>
		<c:set var="color2" value="#d5ff7c"/>
		<c:set var="color3" value="#efffd2"/>
		<c:set var="color4" value="#dc1864"/>
	</c:if>
	<c:if test="${resultMbti=='ISFP'}">
		<c:set var="color1" value="#b9b136"/>
		<c:set var="color2" value="#fff998"/>
		<c:set var="color3" value="#fefccc"/>
		<c:set var="color4" value="#ff74e6"/>
	</c:if>
	<c:if test="${resultMbti=='INFP'}">
		<c:set var="color1" value="#009bff"/>
		<c:set var="color2" value="#94d5ff"/>
		<c:set var="color3" value="#e1f3ff"/>
		<c:set var="color4" value="#f05e0a"/>
	</c:if>
	<c:if test="${resultMbti=='INFJ'}">
		<c:set var="color1" value="#015eac"/>
		<c:set var="color2" value="#80c5ff"/>
		<c:set var="color3" value="#e0f2fe"/>
		<c:set var="color4" value="#ff8900"/>
	</c:if>
	<c:if test="${resultMbti=='INTJ'}">
		<c:set var="color1" value="#163fbb"/>
		<c:set var="color2" value="#7a9cfe"/>
		<c:set var="color3" value="#dae4ff"/>
		<c:set var="color4" value="#f3c003"/>
	</c:if>
	<c:if test="${resultMbti=='INTP'}">
		<c:set var="color1" value="#03cecb"/>
		<c:set var="color2" value="#84fffd"/>
		<c:set var="color3" value="#e1ffff"/>
		<c:set var="color4" value="#d100ff"/>
	</c:if>
	<c:if test="${resultMbti=='ENTP'}">
		<c:set var="color1" value="#64aa0c"/>
		<c:set var="color2" value="#c7ff84"/>
		<c:set var="color3" value="#f0ffe0"/>
		<c:set var="color4" value="#3acc07"/>
	</c:if>
	<c:if test="${resultMbti=='ENTJ'}">
		<c:set var="color1" value="#ff8900"/>
		<c:set var="color2" value="#ffc675"/>
		<c:set var="color3" value="#fef5e6"/>
		<c:set var="color4" value="#025dad"/>
	</c:if>
	<c:if test="${resultMbti=='ENFP'}">
		<c:set var="color1" value="#ff74e7"/>
		<c:set var="color2" value="#ffc1f4"/>
		<c:set var="color3" value="#fee0fa"/>
		<c:set var="color4" value="#b9b33b"/>
	</c:if>
	<c:if test="${resultMbti=='ENFJ'}">
		<c:set var="color1" value="#f6be06"/>
		<c:set var="color2" value="#ffe783"/>
		<c:set var="color3" value="#fffae2"/>
		<c:set var="color4" value="#163fbb"/>
	</c:if>
	<c:if test="${resultMbti=='ESFJ'}">
		<c:set var="color1" value="#6524d7"/>
		<c:set var="color2" value="#cbaefe"/>
		<c:set var="color3" value="#dfcdff"/>
		<c:set var="color4" value="#dfcdff"/>
	</c:if>
	
	<c:if test="${resultMbti=='ESFP'}">
		<c:set var="color1" value="#f15d09"/>
		<c:set var="color2" value="#ffb085"/>
		<c:set var="color3" value="#fef0e5"/>
		<c:set var="color4" value="#0399ff"/>
	</c:if>
	<c:if test="${resultMbti=='ESTJ'}">
		<c:set var="color1" value="#de1764"/>
		<c:set var="color2" value="#ffa0c6"/>
		<c:set var="color3" value="#ffebf4"/>
		<c:set var="color4" value="#88c600"/>
	</c:if>
	<c:if test="${resultMbti=='ESTP'}">
		<c:set var="color1" value="#d300ff"/>
		<c:set var="color2" value="#efa4ff"/>
		<c:set var="color3" value="#fbe7ff"/>
		<c:set var="color4" value="#03cecb"/>
	</c:if>
	<div class="mbti-result" style="background-image: url(<c:url value='/images/${resultMbti}.jpg'/>)">
		<div class="mbti-result-top">
			<h1 style="text-shadow: 1px 1px 3px ${color1};">
				당신의 MBTI는<br><span style="color:${color1};">${resultMbti}</span> 입니다.
			</h1>
		</div>
	</div>
	<div class="character-type">
		<h2 style="color:${color1};">성격 유형</h2>
	</div>
	<!-- Project Card Example -->
    <div class="card shadow mb-4 mbti-div-size">
        <div class="card-body">
            <h4 class="font-weight-bold">내향형 ${resultI}%
	            <span class="float-right">외향형 ${resultE}%</span>
            </h4>
            <div class="progress mb-4"
            	<c:if test="${fn:substring(resultMbti,0,1)=='E'}">style="justify-content: flex-end;"</c:if>
            >
                <div class="progress-bar" role="progressbar" 
                style="width:
	                <c:if test="${fn:substring(resultMbti,0,1)=='I'}">${resultI}%;</c:if>
	                <c:if test="${fn:substring(resultMbti,0,1)=='E'}">${resultE}%;</c:if>
	            	background-color: ${color1} !important;"
                aria-valuemin="0" aria-valuemax="100" ></div>
            </div>
            <h4 class="font-weight-bold">감각형 ${resultS}%
	            <span class="float-right">직관형 ${resultN}%</span>
            </h4>
            <div class="progress mb-4"
            	<c:if test="${fn:substring(resultMbti,1,2)=='N'}">style="justify-content: flex-end;"</c:if>
            >
                <div class="progress-bar" role="progressbar"
                style="width:
	                <c:if test="${fn:substring(resultMbti,1,2)=='S'}">${resultS}%;</c:if>
	                <c:if test="${fn:substring(resultMbti,1,2)=='N'}">${resultN}%;</c:if>
	            	background-color: ${color1} !important;"
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
	            	<c:if test="${fn:substring(resultMbti,2,3)=='F'}">${resultF}%;</c:if>
	            	background-color: ${color1} !important;"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <h4 class="font-weight-bold">인식형 ${resultP}%
	            <span class="float-right">판단형 ${resultJ}%</span>
            </h4>
            <div class="progress mb-4"
            	<c:if test="${fn:substring(resultMbti,3,4)=='J'}">style="justify-content: flex-end;"</c:if>
            >
                <div class="progress-bar" role="progressbar"
                style="width:
	                <c:if test="${fn:substring(resultMbti,3,4)=='P'}">${resultP}%;</c:if>
		            <c:if test="${fn:substring(resultMbti,3,4)=='J'}">${resultJ}%;</c:if>
		            background-color: ${color1} !important;"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
    </div>
	<div class="personality">
		<h2 style="color:${color1};">성격 특징</h2>
		<p style="color:#000000;">
			${mbtiVo.personalityTrait}
		</p>
		
	</div>
	<div class="inner" style="background-color:${color1};">
		<h2>주요 특징</h2>
	</div>
	<div class="defining" style="background-color:${color3};">
		<div style="color:#14100c;font-weight: bold;">
			${mbtiVo.definingTrait}
		</div>
	</div>
	
	<div class="inner2" style="background-color:${color1};">
		<h2>강점 및 약점</h2>
	</div>
	<c:set var="strength" value="${fn:split(mbtiVo.strength,'@')}"/>
	<c:set var="weakness" value="${fn:split(mbtiVo.weakness,'@')}"/>
	<div class="defining2" style="background-color:${color3};">
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
	<div id="mbti-jop" style="background-color: ${color3};">
		<span style="background-color:${color1};">관련 직업</span>
	 	<c:forEach var="i" begin="0" end="${fn:length(mbtiJop)-1}">
			<div class="mbti-jop" style="background-color: ${color1};">
				<p>${mbtiJop[i]}</p>
			</div>
	 	</c:forEach>
	</div>
	
	<c:set var="compatibility" value="${fn:split(mbtiVo.compatibility,'@')}"/>
	<div id="mbti-compatibility" style="background-image: url('<c:url value="/images/${mbtiVo.bestMbti}.jpg"/>');background-position: center;">
		<span style="background-color: ${color4};">궁합</span>
		<div id="best">
			<p>${compatibility[0]}</p>
			<p>${compatibility[1]}</p>
		</div>
	</div>
	<div id="mbti-dating" style="background-color: ${color3};">
		<span style="background-color: ${color1};">${compatibility[2]}</span>
			<p>${compatibility[3]}</p>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>
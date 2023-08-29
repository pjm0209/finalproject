<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<section id="myPage">
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
</section>
<%@include file="../inc/bottom.jsp" %>

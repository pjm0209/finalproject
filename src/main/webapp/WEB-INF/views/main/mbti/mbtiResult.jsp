<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<section id="mbtiSurvey" class="mbtiSurvey">
	<div class="mbti-result">
		<div class="mbti-result-top">
			<h1>
				당신은<br><img class="img_max_cont" src="<c:url value='/images/text_stoke.png'/>"> 입니다.
			</h1>
		</div>
	</div>
	<div class="personality">
		<h2>성격 특징</h2>
		<p>성격 내용</p>
	</div>
	<div class="inner">
		<h2>주요 특징</h2>
	</div>
	<div class="defining">
		<div>
		pjm푸쉬
		</div>
	</div>
	
	<div class="inner2">
		<h2>강점 및 약점</h2>
	</div>
	<div class="defining2">
		<div id="strength">
			<h2>강점</h2>
		</div>
		<div id="weakness">
			<h2>약점</h2>
		</div>
	</div>
	
	<div id="mbti-jop">
		<span>관련 직업</span>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>
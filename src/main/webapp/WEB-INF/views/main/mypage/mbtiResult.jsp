<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<script type="text/javascript">
	var title='';
	$(function(){
		var name='${sessionsScope.name}';
		if(name==null || name==''){
			title='나의 MBTI는?';
		}else{
			 title="${sessionsScope.name}님의 MBTI는?";
		}
		if (!Kakao.isInitialized()) {
		  Kakao.init('492cfd61b5b9e8677ad3f4db8cfedbdf');
		}
	});
	var sendKakao = function() {
	    // 메시지 공유 함수
	  Kakao.Share.sendScrap({
	    requestUrl: 'http://localhost:9091', // 페이지 url
	    templateId: 97845, // 메시지템플릿 번호
	    templateArgs: {
	  	  NAME: '',
	      TITLE: title, // 제목 텍스트 ${TITLE}
	      DESC: '${resultMbti}', // 설명 텍스트 ${DESC}
	      PATH: '${resultMbti}',
	    },
	  });
	};
	
</script>
<section id="myPage">
	<div class="mbti-result2" style="background-image: url(<c:url value='/images/${resultMbti}.jpg'/>)">
		<div class="mbti-result-top">
			<h1 style="color:black;">
				당신의 MBTI는<br><span style="color:black;">${resultMbti}</span> 입니다.
			</h1>
		</div>
	</div>
	
	<div class="card shadow mb-4 mbti-div-size2">
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
	            	background-color: skyblue !important;"
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
	            	background-color: cyan !important;"
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
	            	background-color: purple !important;"
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
		            background-color: orange !important;"
                aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
    </div>
    <div id="kakaotalkButtonDiv">
    	<a id="kakaotalk-sharing-btn" href="javascript:;">
		  <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
		    alt="카카오톡 공유 보내기 버튼" onclick="sendKakao()"/>
		</a><br>공유하기
    </div>
</section>
<%@include file="../inc/bottom.jsp" %>

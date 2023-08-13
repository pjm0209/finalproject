<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('.MBTI_test1').first().find('.statement').addClass('active');
		
		$('.MBTI_test2').hide();
		$('.MBTI_test3').hide();
		$('.MBTI_test4').hide();
		$('.MBTI_test5').hide();
		$('.MBTI_test6').hide();
		$('input[type=radio]').click(function(){
			$('*').removeClass('active');
			$(this).parent().parent().parent().parent().next().find('.statement').addClass('active');
			scrollToPosition($(window).scrollTop() + 400);
		});
		
		$('.test_btn_style').click(function(){
			scrollToPosition($(window).scrollTop() + 670);
		});
        
        function scrollToPosition(position) {
            $('html, body').animate({
				scrollTop: position
			}, 500);
        }
	});
</script>
<section id="mbtiSurvey" class="mbtiSurvey">
	<div class="mbti-survey">
		<div>
			<h2>
				<img src="<c:url value='/images/text_stoke.png'/>" class="img_max_cont"> 페이지에 오신걸<br>환영합니다
			</h2>
			<h2 class="postition_new">
                <img src="<c:url value='/images/m_true_01.png'/>" alt="MBTI달걀모양 MBTI검사" class="after_go">
            </h2><br>
			<p>무료 정밀검사로 성격유형에 맞는 <br><span>학과, 직업, 취미, 운동 등의 장.단점</span>을 알아보세요 !</p>
            <p>현재 감정상태를 기준으로 설문에 응해 주세요!</p>
            <p>소요시간은 10분 내외 입니다.</p>
            <button class="test_btn_style">
            	<c:if test="${param.questionTypeNo==1}">
            		MBTI 정식검사 시작하기
            	</c:if>
            	<c:if test="${param.questionTypeNo==2}">
            		MBTI 간이검사 시작하기
            	</c:if>
            </button> 
		</div>
	</div>
	<!--text1 -->
	<c:set var="idx" value="1"/>
	<c:set var="idx2" value="1"/>
	<hr class="MBTI_test0">
    <c:forEach var="mbtiSurveyVo" items="${list}">
	    <div class="MBTI_test${idx2} puls">
	        <div class="statement">
	            <div class="question">
	                <h3>${idx}.&nbsp;${mbtiSurveyVo.question}</h3>
	            </div><br>
	            <div class="answer">
	                <div class="options">
	                	<input type="radio" id="statement${idx}_1" name="statement${idx}" />
	                    <label for="statement${idx}_1" class="ch_01 disagree max">전혀 그렇지 않다</label>
	                    <input type="radio" id="statement${idx}_2" name="statement${idx}" />
	                    <label for="statement${idx}_2" class="ch_02 disagree mid">그렇지 않다</label>
	                    <input type="radio" id="statement${idx}_3" name="statement${idx}" />
	                    <label for="statement${idx}_3" class="ch_03 natural">보통</label>
	                    <input type="radio" id="statement${idx}_4" name="statement${idx}" />
	                    <label for="statement${idx}_4" class="ch_04 agree mid">그렇다</label>
	                    <input type="radio" id="statement${idx}_5" name="statement${idx}" />
	                    <label for="statement${idx}_5" class="ch_05 agree max">매우 그렇다</label><br>
	                </div>
	            </div>
	        </div>
	        <c:if test="${idx%10==0}">
	        	<c:set var="idx2" value="${idx2+1}"/>
	        </c:if>
	        <c:set var="idx" value="${idx+1}"/>
	    </div>
    </c:forEach>
</section>
<%@ include file="../inc/bottom.jsp" %>
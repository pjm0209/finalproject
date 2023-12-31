<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<script type="text/javascript">
	$(function(){
		var idx=1;
		
		$('#statement1_1').focus();
		$('.MBTI_test1').first().find('.statement').addClass('active');
		
		$('.MBTI_test2').hide();
		$('.MBTI_test3').hide();
		$('.MBTI_test4').hide();
		$('.MBTI_test5').hide();
		$('.MBTI_test6').hide();
		$('#resultDivMbti').hide();
		
		$('input[type=radio]').click(function(){
			$('*').removeClass('active');
			$(this).parent().parent().parent().parent().next().find('.statement').addClass('active');
			scrollToPosition($(window).scrollTop() + 400);
		});
		
		var bool=false;
		var count=10;
		$('#nextMbtiQuestion').click(function(){
			if($('input[type=radio]:checked').length<count){
				$('#alertModalBody').html("정확한 성격유형을 위해서 모두 선택해 주셔야 합니다.");
				$('#alertModalBtn').trigger('click');
				bool=false;
				return false;
			}
			bool=true;
			
			if(idx!=${num}){
				if(bool){
					$('.MBTI_test'+idx).hide();
					idx++;
					$('.MBTI_test'+idx).show();
					
					scrollToPosition($(window).scrollTop() + -3820);
					
					if(idx==${num}){
						$('#nextDivMbti').hide();
						$('#resultDivMbti').show();
					}
				}
			}
			count=count+10;
		});
		$('#resultMbtiQuestion').click(function(){
			if($('input[type=radio]:checked').length<count){
				$('#alertModalBody').html("정확한 성격유형을 위해서 모두 선택해 주셔야 합니다.");
				$('#alertModalBtn').trigger('click');
				bool=false;
				return false;
			}
		});
		
        function scrollToPosition(position) {
            $('html, body').animate({
				scrollTop: position
			}, "fast");
        }
	});
</script>
<section id="mbtiSurvey" class="mbtiSurvey">
	<div class="mbti-survey">
		<div id="mbtiTopDiv">
			<p>무료 정밀검사로 성격유형에 맞는 <br><span>학과, 직업, 취미, 운동 등의 장.단점</span>을 알아보세요!</p>
            <p>현재 감정상태를 기준으로 설문에 응해 주세요!</p>
            <p>소요시간은 20분 내외 입니다.</p>
		</div>
	</div>
	<c:set var="num" value="0"/>
	<c:set var="idx" value="1"/>
	<c:set var="idx2" value="1"/>
	<hr class="MBTI_test0">
	<form name="frmMbtiResult" method="post" action="<c:url value='/main/mbti/mbtiResult'/>">
	    <c:forEach var="mbtiSurveyVo" items="${list}">
		    <div class="MBTI_test${idx2} puls">
		        <div class="statement">
		            <div class="question">
		                <h3>${idx}.&nbsp;${mbtiSurveyVo.question}</h3>
		            </div><br>
		            <div class="answer">
		                <div class="options">
		                	<input type="hidden" name="mbtiResultItem[${num}].questionTypeNo" value="${mbtiSurveyVo.questionTypeNo}" />
		                	<input type="hidden" name="mbtiResultItem[${num}].questionCategoryNo" value="${mbtiSurveyVo.questionCategoryNo}" />
		                	<input type="radio" id="statement${idx}_1" data-name="statement${idx}" name="mbtiResultItem[${num}].mbtiVal" value="1"/>
		                    <label for="statement${idx}_1" class="ch_01 disagree max">전혀 그렇지 않다</label>
		                    <input type="radio" id="statement${idx}_2" data-name="statement${idx}" name="mbtiResultItem[${num}].mbtiVal" value="2"/>
		                    <label for="statement${idx}_2" class="ch_02 disagree mid">그렇지 않다</label>
		                    <input type="radio" id="statement${idx}_3" data-name="statement${idx}" name="mbtiResultItem[${num}].mbtiVal" value="3"/>
		                    <label for="statement${idx}_3" class="ch_03 natural">보통</label>
		                    <input type="radio" id="statement${idx}_4" data-name="statement${idx}" name="mbtiResultItem[${num}].mbtiVal" value="4"/>
		                    <label for="statement${idx}_4" class="ch_04 agree mid">그렇다</label>
		                    <input type="radio" id="statement${idx}_5" data-name="statement${idx}" name="mbtiResultItem[${num}].mbtiVal" value="5"/>
		                    <label for="statement${idx}_5" class="ch_05 agree max">매우 그렇다</label><br>
		                </div>
		            </div>
		        </div>
		        <c:if test="${idx%10==0}">
		        	<c:set var="idx2" value="${idx2+1}"/>
		        </c:if>
		        <c:set var="idx" value="${idx+1}"/>
		        <c:set var="num" value="${num+1}"/>
		    </div>
	    </c:forEach>

	    <div id="nextDivMbti">
	    	<button type="button" class="mbti-button3" id="nextMbtiQuestion">다음</button>
	    </div>
	    <div id="resultDivMbti">
	    	<button type="submit" class="mbti-button3" id="resultMbtiQuestion">검사결과</button>
	    </div>
    </form>
</section>
<%@ include file="../inc/bottom.jsp" %>
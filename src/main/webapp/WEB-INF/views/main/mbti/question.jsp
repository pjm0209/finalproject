<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
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
            <button class="test_btn_style">MBTI 정밀검사 시작하기</button> 
		</div>
	</div>
	<!--text1 -->
    <div class="MBTI_test puls">
        <div class="statement active">
            <div class="question">
                <h3>1. 나는 걱정이 많다. 남들은 잘 신경쓰지 않는 일도 미리 생각하고 염려한다.</h3>
            </div>
            <div class="answer"><br>
                <div class="options">
                    <label for="statement1_1" class=" ch_01 disagree max">
                        <input type="radio" id="statement1_1" name="statement1">
                        <span><i class="fas fa-check"></i></span>
                    </label>
                    <label for="statement1_2" class=" ch_02 disagree mid">
                        <input type="radio" id="statement1_2" name="statement1">
                        <span><i class="fas fa-check"></i></span>
                    </label>
                    <label for="statement1_3" class=" ch_03 natural">
                        <input type="radio" id="statement1_3" name="statement1">
                        <span><i class="fas fa-check"></i></span>
                    </label>
                    <label for="statement1_4" class=" ch_04 agree mid">
                        <input type="radio" id="statement1_4" name="statement1">
                        <span><i class="fas fa-check"></i></span>
                    </label>
                    <label for="statement1_5" class=" ch_05 agree max">
                        <input type="radio" id="statement1_5" name="statement1">
                        <span><i class="fas fa-check"></i></span>
                    </label>
                </div>
            </div>
        </div>
</section>
<%@ include file="../inc/bottom.jsp" %>
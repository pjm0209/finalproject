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
		<div class="mbti-jop">
			<p>놀이와 창작을 요하는 엔터테인먼트 종사자<br>
				연예인, 영화 관련 종사자, 연극인, 게임, 애니메이션 등
			</p>
		</div>
		<div class="mbti-jop">
			<p>신사업 기획자<br>
				대기업 및 중소기업의 신제품 및 신사업 기획
			</p>
		</div>
		<div class="mbti-jop">
			<p>벤처 기업자<br>
				IT, 바이오, 로봇 등 첨단 기술을 포함하는 벤처 기업
			</p>
		</div>
	</div>
	
	<div id="mbti-compatibility">
		<span>궁합</span>
		<div id="best">
			<img src="<c:url value='/images/감사콩로아콘.png'/>" alt="best궁합 이미지" width="300" />
			<p>Best궁합은 ENTJ 유형입니다.</p>
			<p>ENTJ 도전을 즐기는 성격으로 충분한 시간과 자원이 주어진다면
			어떠한 목표도 달성할 수 있다고 믿습니다.<br>
			훌륭한 사업가가 될 가능성이 높으며, 전략적 사고 능력과 장기적 목표에 집중하고
			결단력 있게 계획을 실행하는 능력은 위대한 비즈니스 리더가 되는 데 도움이 됩니다.<br>
			한 번 연애에 빠지면 연애 상대에게 정말 잘해줍니다.<br>
			명확한 호불호를 가지고 있으며, 사랑도 열심히 공부하려고 합니다.</p>
		</div>
		<div id="mbti-etc">
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
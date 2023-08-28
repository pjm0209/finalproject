<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<section id="mbti" class="mbti">
	<div id="mbti-title">
<<<<<<< HEAD
		<div id="mbti-div">
			<form name="frm-mbti2" id="frm-mbti2" method="post" action="<c:url value='/main/mbti/question'/>">
				<input type="hidden" name="questionTypeNo" value="1"/>
				<button type="submit" class="mbti-button2" id="mbti-free-button">간이 검사</button>
			</form>
			<form name="frm-mbti1" id="frm-mbti1" method="post" action="<c:url value='/main/mbti/question'/>">
				<input type="hidden" name="questionTypeNo" value="2"/>
				<button type="submit" class="mbti-button2" id="mbti-precise-button">정식 검사</button>
			</form>
		</div>
=======
		<form name="frm-mbti2" id="frm-mbti2" method="post" action="<c:url value='/main/mbti/question'/>">
			<input type="hidden" name="questionTypeNo" value="2"/>
			<button type="submit" class="mbti-button2" id="mbti-free-button">간이 검사</button>
		</form>
		<form name="frm-mbti1" id="frm-mbti1" method="post" action="<c:url value='/main/mbti/question'/>">
			<input type="hidden" name="questionTypeNo" value="1"/>
			<button type="submit" class="mbti-button2" id="mbti-precise-button">정식 검사</button>
		</form>

>>>>>>> parent of b1adafa (Merge branch 'main' of https://github.com/pjm0209/finalproject.git into)
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>
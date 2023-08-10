<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
button.mbti-button{
	background-color: #c87fdf;
    background-size: cover;
    border:1px solid black;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="text/javascript" src="<c:url value='/admin-css-js/js/mbti.js'/>"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	CKEDITOR.replace('question', {height: 300});
});
</script>
</head>
<body>
<c:if test="${empty vo}">
	<c:set var="str" value="등록"/>
</c:if>
<c:if test="${!empty vo}">
	<c:set var="str" value="수정"/>
</c:if>
	<form name="frmMbtiWrite" method="post" action="<c:url value='/admin/mbti/mbtiWrite'/>">
		<div style="height:650px;width: 750px;margin-left: 25px;margin-top: 30px;">
			<h1>질문지 등록</h1><br>
			<h5 style="float: left;">문제 유형</h5>
			<select class="form-control" name="questionTypeNo" id="questionTypeNo" style="width: 300px;float: right;">
				<option value="0">선택</option>
				<option value="1"<c:if test="${vo.questionTypeNo=='1'}">selected="selected"</c:if>>F(무료검사)</option>
				<option value="2"<c:if test="${vo.questionTypeNo=='2'}">selected="selected"</c:if>>P(일반검사)</option>
				<option value="3"<c:if test="${vo.questionTypeNo=='3'}">selected="selected"</c:if>>M(From M)</option>
			</select><br>
			<div style="margin-top: 40px">
				<h5 style="clear: both;float: left;">질문 유형</h5>
				<select class="form-control" name="questionCategoryNo" id="questionCategoryNo" style="width: 300px;float: right;">
					<option value="0">선택</option>
					<option value="1"<c:if test="${vo.questionCategoryNo=='1'}">selected="selected"</c:if>>I/E</option>
					<option value="2"<c:if test="${vo.questionCategoryNo=='2'}">selected="selected"</c:if>>S/N</option>
					<option value="3"<c:if test="${vo.questionCategoryNo=='3'}">selected="selected"</c:if>>T/F</option>
					<option value="4"<c:if test="${vo.questionCategoryNo=='4'}">selected="selected"</c:if>>P/J</option>
				</select>
			</div>
			<hr style="clear: both;border: 0">
			<textarea name="question" id="question">${vo.question}</textarea>
		</div>
		<div style="width: 775px;text-align: center;">
			<c:if test="${!empty vo}">
				<input type="hidden" name="mbtiServeyNo" value="${vo.mbtiServeyNo}">
			</c:if>
			<button class="mbti-button" type="submit" id="mbti-button">${str}</button>
			<button class="mbti-button" type="button" id="mbti-close-button" onclick="self.close()">닫기</button>
		</div>
	</form>

</body>
</html>
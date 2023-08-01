<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">MBTI</h2>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>MBTI </h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="board-group-list" class="nav">
			<div class="side-boardItem">
				<div class="board-name" name="mbtiList" value="mbtiList">
					<span>MBTI 목록</span>
				</div>
			</div>
			<div class="side-boardItem">
				<div class="board-name" name="mbtiManage" value="mbtiManage">
					<span>MBTI 관리</span>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
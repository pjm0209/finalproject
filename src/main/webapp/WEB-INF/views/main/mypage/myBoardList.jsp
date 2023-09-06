<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>    

<link rel="stylesheet" type="text/css" href="<c:url value='/main-css-js/css/myPageBoard.css'/>">
    
<section id="myPageBoardList">
	<div class="myBoardListTable">
		<h1>내 게시글</h1>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">First</th>
					<th scope="col">Last</th>
					<th scope="col">Handle</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
    
<%@include file="../inc/bottom.jsp" %>
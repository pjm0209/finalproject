<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<section id="myPage">
	<table>
		<tr>
			<th>
				<input type="checkbox" name="check-All">
			</th>
			<th>보낸 사람</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
		<tr>
			<c:forEach var="map" items="${list}">
				<td type="checkbox" value="${map['RECEIVE_DM_NO']}"></td>
			</c:forEach>
		</tr>
	</table>
</section>
<%@include file="../inc/bottom.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../inc/top.jsp" %>
<%@include file="../../inc/mypage.jsp" %>
<style>
	section#myMessageWrite{
		padding-left: 223px;
		padding-top: 100px;
		height:2000px;
		background-color: #f7f7f7;
	}
	section#myMessageWrite div{
		width: 1850px;
	}
	section#myMessageWrite hr{
		border: 1px solid black;
	}
	span.bold{
		font-weight: bold;
	}
	
	section#myMessageWrite .firstM{
		margin-left: 30px;
	}
	
	p.firstM{
		padding-top: 30px;
		padding-bottom: 30px;
	}
	
	button#messageDetailBtn{
		background-color: #eb5d1e;
	    border:0;
		border-radius: 5px;
		padding: 6px 15px;
		margin-top: -6px;
		margin-right: 9px;
		color: white;
	}
</style>
<section id="myMessageWrite">
	<input type="hidden" name="sendDmNo" id="sendDmNo" value="${map['SEND_DM_NO']}">
	<div>
		<button id="messageDetailBtn" class="firstM">삭제</button>
		<hr>
		<span class="bold firstM" onclick="commentMore(this)">
			${map['SEND_ID']}
			<c:if test="${map['ADMIN_NO']!=null && map['ADMIN_NO']!=''}">
				(관리자)
			</c:if>
		</span>
		<c:if test="${map['SEND_DM_ID'] != sessionScope.userid}">
			<span>님의 쪽지</span>
		</c:if>
		<c:if test="${map['SEND_DM_ID'] == sessionScope.userid}">
			<span>님의 내게 쓴 쪽지</span>
		</c:if>
		<br>
		<span class="bold firstM">보낸 시간</span>
		<span>
			<fmt:formatDate value="${map['SEND_REGDATE']}" pattern="yyyy-MM-dd[HH:mm]"/>
		</span>
		<hr>
		<p class="firstM">${map["SEND_BODY"]}</p>
		<hr>
	</div>
</section>
<%@include file="../../inc/bottom.jsp" %>
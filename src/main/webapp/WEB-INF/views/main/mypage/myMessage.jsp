<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<script>
	$(function(){
		$('section#myMessage div a').first().css('color','#eb5d1e');
		$('.myMessageCheck-All').click(function(){
			var checked=$(this).prop('checked');
			$(this).parent().parent().nextAll('tr').find('input[type=checkbox]').prop('checked',checked);
		});
		
	});

	function messageF(idx,evt){
		$('table').hide();
		$('table').eq(idx).show();
		$('input[type=checkbox]').prop('checked',false);
		$(evt).parent().find('a').css('color','black');
		$(evt).css('color','#eb5d1e');
	}
	
	
	function lochref(sendDmNo){
		location.href=contextPath+"/main/mypage/myMessage/messageWrite?sendDmNo="+sendDmNo;
	}
	
</script>
<style>
	section#myMessage{
		padding-left: 223px;
		padding-top: 100px;
		height:2000px;
		background-color: #f7f7f7;
	}
	section#myMessage div{
		height: 40px;
		margin-bottom: 20px;
		margin-right: 44px;
	}
	#myMessageDelBtn{
		float:right;
		background: #eb5d1e;
	    color: #fff;
	    padding: 10px 25px;
	    margin-left: -10px;
	    border:0;
    }
    section#myMessage div a{
    	line-height: 40px;
    	text-decoration: none;
    }
    section#myMessage div a:first-child{
    	margin-left: 50px;
    }
    
    section#myMessage div span{
    	color: #7a6960;
    	margin-left: 10px;
    }
    
    tr th{
    	background-color: #eb5d1e;
    	color: white;
    }
    
    tr td{
    	background-color: white;
    }
    
	tr{
		border-bottom: 1px solid lightgray;
	}
	tr th:nth-of-type(1), tr td:nth-of-type(1) {
		width:50px;
		height:40px;
		border-right: 1px solid lightgray;
	}
	tr th:nth-of-type(2), tr td:nth-of-type(2) {
		width:250px;
		border-right: 1px solid lightgray;
	}
	tr th:nth-of-type(3), tr td:nth-of-type(3) {
		border-right: 1px solid lightgray;
	}
	tr th:nth-of-type(4), tr td:nth-of-type(4) {
		width:200px;
		border-right: 1px solid lightgray;
	}
	tr th:nth-of-type(5), tr td:nth-of-type(5) {
		width:200px;
		border-right: 1px solid lightgray;
	}
	
	tr td:nth-of-type(3){
		text-align: left;
		padding-left: 20px;
	}
	
</style>
<section id="myMessage">
	<div>
		<a href="#" onclick="messageF(0,this)">받은 쪽지함</a><span>|</span>
		<a href="#" onclick="messageF(1,this)">보낸 쪽지함</a><span>|</span>
		<a href="#" onclick="messageF(2,this)">내게 쓴 쪽지함</a>
		<button id="myMessageDelBtn">삭제</button>
	</div>
	<table width="1800px" style="border: 1px solid lightgray;margin-left: 50px;">
		<tr>
			<th>
				<input class="board-checkbox myMessageCheck-All" type="checkbox" name="myMessageCheck-All" id="myMessageCheck-All">
			</th>
			<th>보낸 사람</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="map" items="${list}">
			<tr>
				<td><input class="board-checkbox" type="checkbox" name="sendDmNo" value="${map['SEND_DM_NO']}"></td>
				<c:if test="${map['ADMIN_NO']!=null && map['ADMIN_NO']!=''}">
					<td>${map["SEND_ID"]}(관리자)</td>
				</c:if>
				<c:if test="${map['NO']!=null && map['NO']!=''}">
					<td>${map["SEND_ID"]}</td>
				</c:if>
				<td onclick="lochref(${map['SEND_DM_NO']})" style="cursor: pointer;">${map["SEND_BODY"]}</td>
				<td><fmt:formatDate value="${map['SEND_REGDATE']}" pattern="yyyy-MM-dd[HH:mm]" /></td>
			</tr>
		</c:forEach>
	</table>
	<table width="1800px" style="border: 1px solid lightgray;margin-left: 50px;display: none;">
		<tr>
			<th>
				<input class="board-checkbox myMessageCheck-All" type="checkbox" name="myMessageCheck-All" id="myMessageCheck-All">
			</th>
			<th>받은 사람</th>
			<th>내용</th>
			<th>보낸 날짜</th>
			<th>읽은 날짜</th>
		</tr>
		<c:forEach var="map" items="${list}">
			<tr>
				<td><input class="board-checkbox" type="checkbox" name="sendDmNo" value="${map['SEND_DM_NO']}"></td>
				<c:if test="${map['RECEIVE_MANAGER_FLAG']=='Y'}">
					<td>${map["RECEIVE_ID"]}(관리자)</td>
				</c:if>
				<c:if test="${map['RECEIVE_MANAGER_FLAG']=='N'}">
					<td>${map["RECEIVE_ID"]}</td>
				</c:if>
				<td onclick="lochref(${map['SEND_DM_NO']})" style="cursor: pointer;">${map["SEND_BODY"]}</td>
				<td><fmt:formatDate value="${map['SEND_REGDATE']}" pattern="yyyy-MM-dd[HH:mm]" /></td>
				<td>
					<c:if test="${map['READ_REGDATE']==null || map['READ_REGDATE']==''}">
						<span>읽지 않음</span>
					</c:if>
					<fmt:formatDate value="${map['READ_REGDATE']}" pattern="yyyy-MM-dd[HH:mm]" />
				</td>
			</tr>
		</c:forEach>
	</table>
	<table width="1800px" style="border: 1px solid lightgray;margin-left: 50px;display: none;">
		<tr>
			<th>
				<input class="board-checkbox myMessageCheck-All" type="checkbox" name="myMessageCheck-All" id="myMessageCheck-All">
			</th>
			<th>받은 사람</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
		<c:set var="hasMessages" value="false" />
		<c:set var="myMessagesCnt" value="0" />
		<c:forEach var="map" items="${list}">
			<c:choose>
				<c:when test="${map['RECEIVE_ID'] == map['SEND_ID']}">
					<tr>
						<td><input class="board-checkbox" type="checkbox" name="sendDmNo" value="${map['SEND_DM_NO']}"></td>
						<c:if test="${map['RECEIVE_MANAGER_FLAG']=='Y'}">
							<td>${map["SEND_ID"]}(관리자)</td>
						</c:if>
						<c:if test="${map['RECEIVE_MANAGER_FLAG']=='N'}">
							<td>${map["SEND_ID"]}</td>
						</c:if>
						<td onclick="lochref(${map['SEND_DM_NO']})" style="cursor: pointer;">${map["SEND_BODY"]}</td>
						<td>
							<fmt:formatDate value="${map['READ_REGDATE']}" pattern="yyyy-MM-dd[HH:mm]" />
						</td>
					</tr>
					<c:set var="myMessagesCnt" value="${myMessagesCnt+1}" />
				</c:when>
		        <c:otherwise>
		            <c:set var="hasMessages" value="true" />
		        </c:otherwise>
	        </c:choose>
		</c:forEach>
		<c:if test="${hasMessages && myMessagesCnt==0}">
		    <tr>
		        <td colspan="4">쪽지가 없습니다.</td>
		    </tr>
		</c:if>
	</table>
</section>
<%@include file="../inc/bottom.jsp" %>
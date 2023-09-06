<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp" %>
<%@include file="../inc/mypage.jsp" %>
<script>
	$(function(){
		$('section#myMessage div a').first().css('color','#eb5d1e');
		
		$('.messageEditDelDiv').hide();
		
		$('.myMessageCheck-All').click(function(){
			var checked=$(this).prop('checked');
			$(this).parent().parent().nextAll('tr').find('input[type=checkbox]').prop('checked',checked);
		});
		
		$('td[name=sendName]').click(function(){
			$(this).find('.messageEditDelDiv').toggle();
			$('.messageEditDelDiv').not($(this).find('.messageEditDelDiv')).hide();
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
		location.href=contextPath+"/main/mypage/myMessage/messageDetail?sendDmNo="+sendDmNo;
	}
	
</script>
<style>
	section#myMessage{
		padding-left: 223px;
		padding-top: 100px;
		height:2000px;
		background-color: #f7f7f7;
	}
	section#myMessage #messageDiv1{
		height: 40px;
		margin-bottom: 20px;
		margin-right: 44px;
	}
	#myMessageSendBtn{
		float:right;
		background: #eb5d1e;
	    color: #fff;
	    padding: 10px 25px;
	    margin-left: -10px;
	    border:0;
	}
	
	#myMessageDelBtn{
		float:right;
		background: #eb5d1e;
	    color: #fff;
	    padding: 10px 25px;
	    margin-left: 25px;
	    border:0;
    }
    section#myMessage div a{
    	line-height: 40px;
    	text-decoration: none;
    }
    section#myMessage #messageDiv1 a:first-child{
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
	
	.messageEditDelDiv{
	    position: absolute;
	    left: 450px;
	    top: auto;
	    background: white;
	    box-shadow: 0 1px 12px 0 rgba(0, 0, 0, .06);
	    border-radius: 6px;
	    padding: 8px 15px;
	    box-sizing: border-box;
	    z-index: 1;
	    max-height: 370px;
    	width: 120px;
    }
    
    section#myMessage table{
    	 width: 95%;
    }
</style>
<section id="myMessage">
	<div id="messageDiv1">
		<a href="#" onclick="messageF(0,this)">받은 쪽지함</a><span>|</span>
		<a href="#" onclick="messageF(1,this)">보낸 쪽지함</a><span>|</span>
		<a href="#" onclick="messageF(2,this)">내게 쓴 쪽지함</a>
		<button id="myMessageDelBtn">삭제</button>
	</div>
	
	<form name="messageFrm" method="post">
		<table style="border: 1px solid lightgray;margin-left: 50px;">
			<tr>
				<th>
					<input class="board-checkbox myMessageCheck-All" type="checkbox" name="myMessageCheck-All" id="myMessageCheck-All">
				</th>
				<th>보낸 사람</th>
				<th>내용</th>
				<th>날짜</th>
			</tr>
			<c:set var="myMessagesCnt1" value="0" />
			<c:set var="idx" value="0"/>
			<c:set var="hasMessage1" value="false" />
			<c:forEach var="map" items="${list}">
				<c:if test="${map['SEND_ID']!=null && map['SEND_ID']!=''}">
					<tr>
						<td><input class="board-checkbox" type="checkbox" name="sendItems[${idx}].sendDmNo" value="${map['SEND_DM_NO']}"></td>
						<c:if test="${map['ADMIN_NO']!=null && map['ADMIN_NO']!=''}">
							<td name="sendName">${map["SEND_ID"]}(관리자)
								<div class="messageEditDelDiv" id="messageEditDelDiv">
									<a href="/mbti/main/mypage/myMessage/messageWrite?receiveNo=${map['ADMIN_NO']}">쪽지 보내기</a>
									<a name="messageDelA" href="/mbti/main/mypage/myMessage/messageDelete?sendDmNo=${map['SEND_DM_NO']}">쪽지 삭제</a>
								</div>
							</td>
						</c:if>
						<c:if test="${map['NO']!=null && map['NO']!=''}">
							<td name="sendName">${map["SEND_ID"]}
								<div class="messageEditDelDiv" id="messageEditDelDiv">
									<a href="/mbti/main/mypage/myMessage/messageWrite?receiveNo=${map['NO']}">쪽지 보내기</a>
									<a name="messageDelA" href="/mbti/main/mypage/myMessage/messageDelete?sendDmNo=${map['SEND_DM_NO']}">쪽지 삭제</a>
								</div>
							</td>
						</c:if>
						<td onclick="lochref(${map['SEND_DM_NO']})" style="cursor: pointer;">${map["SEND_BODY"]}</td>
						<td><fmt:formatDate value="${map['SEND_REGDATE']}" pattern="yyyy-MM-dd[HH:mm]" /></td>
					</tr>
					<c:set var="idx" value="${idx+1}"/>
					<c:set var="myMessagesCnt1" value="${myMessagesCnt1+1}" />
				</c:if>
				<c:if test="${map['SEND_ID']=='' || map['SEND_ID']==null}">
					<c:set var="hasMessage1" value="true" />
				</c:if>
			</c:forEach>
			<c:if test="${(hasMessage1 && myMessagesCnt1==0 ) || empty list}">
				<tr>
			        <td colspan="4">쪽지가 없습니다.</td>
			    </tr>
			</c:if>
		</table>
		<table style="border: 1px solid lightgray;margin-left: 50px;display: none;">
			<tr>
				<th>
					<input class="board-checkbox myMessageCheck-All" type="checkbox" name="myMessageCheck-All" id="myMessageCheck-All">
				</th>
				<th>받은 사람</th>
				<th>내용</th>
				<th>보낸 날짜</th>
				<th>읽은 날짜</th>
			</tr>
			<c:set var="myMessagesCnt" value="0" />
			<c:forEach var="map" items="${list}">
				<c:if test="${map['SEND_ID']==sessionScope.userid}">
					<tr>
						<td><input class="board-checkbox" type="checkbox" name="sendItems[${idx}].sendDmNo" value="${map['SEND_DM_NO']}"></td>
						<c:if test="${map['RECEIVE_MANAGER_FLAG']=='Y'}">
							<td name="sendName">${map["RECEIVE_ID"]}(관리자)
								<div class="messageEditDelDiv" id="messageEditDelDiv">
									<a href="/mbti/main/mypage/myMessage/messageWrite?receiveNo=${map['ADMIN_NO']}">쪽지 보내기</a>
									<a name="messageDelA" href="/mbti/main/mypage/myMessage/messageDelete?sendDmNo=${map['SEND_DM_NO']}">쪽지 삭제</a>
								</div>
							</td>
						</c:if>
						<c:if test="${map['RECEIVE_MANAGER_FLAG']=='N'}">
							<td name="sendName">${map["RECEIVE_ID"]}
								<div class="messageEditDelDiv" id="messageEditDelDiv">
									<a href="/mbti/main/mypage/myMessage/messageWrite?receiveNo=${map['NO']}">쪽지 보내기</a>
									<a name="messageDelA" href="/mbti/main/mypage/myMessage/messageDelete?sendDmNo=${map['SEND_DM_NO']}">쪽지 삭제</a>
								</div>
							</td>
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
					<c:set var="myMessagesCnt" value="${myMessagesCnt+1}" />
				</c:if>
				<c:if test="${map['SEND_ID']!=sessionScope.userid}">
					<c:set var="hasMessage" value="true" />
				</c:if>
				<c:set var="idx" value="${idx+1}"/>
			</c:forEach>
			<c:if test="${(hasMessage && myMessagesCnt==0) || empty list}">
				<tr>
			        <td colspan="5">쪽지가 없습니다.</td>
			    </tr>
		    </c:if>
		</table>
		<table style="border: 1px solid lightgray;margin-left: 50px;display: none;">
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
							<td><input class="board-checkbox" type="checkbox" name="sendItems[${idx}].sendDmNo" value="${map['SEND_DM_NO']}"></td>
							<c:if test="${map['RECEIVE_MANAGER_FLAG']=='Y'}">
								<td name="sendName">${map["SEND_ID"]}(관리자)
									<div class="messageEditDelDiv" id="messageEditDelDiv">
										<a href="/mbti/main/mypage/myMessage/messageWrite?receiveNo=${map['ADMIN_NO']}">쪽지 보내기</a>
										<a name="messageDelA" href="/mbti/main/mypage/myMessage/messageDelete?sendDmNo=${map['SEND_DM_NO']}">쪽지 삭제</a>
									</div>
								</td>
							</c:if>
							<c:if test="${map['RECEIVE_MANAGER_FLAG']=='N'}">
								<td name="sendName">${map["SEND_ID"]}
									<div class="messageEditDelDiv" id="messageEditDelDiv">
										<a href="/mbti/main/mypage/myMessage/messageWrite?receiveNo=${map['NO']}">쪽지 보내기</a>
										<a name="messageDelA" href="/mbti/main/mypage/myMessage/messageDelete?sendDmNo=${map['SEND_DM_NO']}">쪽지 삭제</a>
									</div>
								</td>
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
		        <c:set var="idx" value="${idx+1}"/>
			</c:forEach>
			<c:if test="${(hasMessages && myMessagesCnt==0) || empty list}">
			    <tr>
			        <td colspan="4">쪽지가 없습니다.</td>
			    </tr>
			</c:if>
		</table>
	</form>
</section>
<%@include file="../inc/bottom.jsp" %>
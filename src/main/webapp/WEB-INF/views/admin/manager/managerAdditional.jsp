<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
.manager-Additional-head-button {
	width: max-content;
	display: inline-block;
	float: right;
	margin-right: 15px;
}

.managerAdditional-head input {
	border: 0;
	border-radius: 5px;
	padding: 5px 20px 5px 20px;
	color: white;
}

.managerAdditional-head {
	border-bottom: 1px solid #d8dce5;
	padding: 0px 20px 10px 32px;
}

h2#managerCreate-title {
	font-weight: bold;
	display: inline-block;
}

input#save-managerAdditional {
	margin-left: 10px;
	background: #eb5d1e;
}

.managerAdditional-body {
	display: flex;
	justify-content: space-evenly;
	width: 100%;
	flex-direction: column;
	align-items: center;
	margin-top: 30px;
	
}

div.managerAdditional-setting {
	border: 1px solid #e1e1e1;
	background: white;
	border-radius: 5px;
	width: 60%;
	margin-top: 30px;
}

div.managerAdditional-setting-head {
	border-bottom: 1px solid #e1e1e1;
}

div.managerAdditional-setting-head h3 {
	display: inline-block;
	font-weight: bold;
	color: black;
	font-size: 17px;
	margin: 13px 73px 10px 20px;
}

.managerAdditional-setting-body {
	padding: 20px 30px;
}

.managerAdditional-body dd {
	margin-left: 190px;
	padding: 10px 22px 10px 0;
}

div.managerAdditional-setting-body dt {
	font-size: 14px;
	color: black;
	float: left;
	width: 190px;
	padding: 17px 0;
}

#adminZipcode{
	width: 50%;
	
}
</style>

<c:if test="${empty vo}">
	<c:set var="str" value="등록"/>
	<c:set var="pageTitle" value="관리자 등록" />
	<c:set var="url" value="/admin/manager/managerAdditional" />
	<c:set var="no" value="${param.adminNo }" />	
</c:if>
<c:if test="${!empty vo}">
	<c:set var="str" value="수정"/>
	<c:set var="pageTitle" value="관리자 수정" />
	<c:set var="url" value="/admin/manager/managerEdit" />
	<c:set var="no" value="0" />	
</c:if>
<div class=manager-Additional>
	<form name="managerAdditional-frm" method="post" action="<c:url value='${url}'/>" enctype="multipart/form-data">
	<c:if test="${!empty vo}">
		<input type="hidden" value="${vo.adminNo }" name="adminNo">
	</c:if>
	<div class="managerAdditional-head">
		<h2 class="text-gray-800" id="managerCreate-title">${pageTitle}</h2>
		<div class="manager-Additional-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/manager/managerList"/>'" value="취소">
			<input type="submit" class="bg-gradient-primary" id="save-managerAdditional" value="${str}">
		</div>
	</div>
		<div class="managerAdditional-body">
			<div class="managerAdditional-setting">
				<div class="managerAdditional-setting-head">
					<h3>관리자 정보</h3>
				</div>
				<div class="managerAdditional-setting-body" >
					<dt>아이디</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.adminId }" type="text" name="adminId" id="admin_id" maxlength="60">
							${memberVo.adminId }
						</div>
					</dd>
					<dt>비밀번호</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.eduTeaPwd }" type="text" name="eduTeaPwd" id="teacher_pwd" maxlength="60">
							${educationVo.eduTeaPwd }
						</div>
					</dd>	
					<dt>비밀번호 확인</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.eduTeaPwd }" type="text" name="eduTeaPwd" id="teacher_pwd" maxlength="60">
							${educationVo.eduTeaPwd }
						</div>
					</dd>									
					<dt>이메일</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.adminEmail }" type="text" name="adminEmail" id="admin_email" maxlength="60">
							${memberVo.adminEmail }
						</div>
					</dd>
					<dt>전화번호</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.adminTel }" type="text" name="adminTel" id="admin_tel" maxlength="60">
							${memberVo.adminTel }
						</div>
					</dd>
					<dt>우편번호</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.adminZipcode }" type="text" name="adminZipcode" id="admin_zipcode" maxlength="60">
							${memberVo.adminZipcode }					
						</div>
					</dd>	
					<dt>주소</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.adminAddress }" type="text" name="adminAddress" id="admin_address" maxlength="60">
							${memberVo.adminAddress }
						</div>
					</dd>
					<dt>상세주소</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.adminAddressDetail }" type="text" name="adminAddressDetail" id="admin_address_detail" maxlength="60">
							${memberVo.adminAddressDetail }
						</div>
					</dd>																			
				</div>
			</div>
		</div>
	</form>
</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
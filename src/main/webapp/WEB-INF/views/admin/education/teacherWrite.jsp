<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<c:if test="${empty vo}">
	<c:set var="str" value="등록"/>
	<c:set var="pageTitle" value="강사 등록" />
	<c:set var="url" value="/admin/education/teacherWrite" />
	<c:set var="no" value="${param.eduTeaNo }" />	
</c:if>
<c:if test="${!empty vo}">
	<c:set var="str" value="수정"/>
	<c:set var="pageTitle" value="강사 수정" />
	<c:set var="url" value="/admin/education/teacherEdit" />
	<c:set var="no" value="0" />	
</c:if>
<div class="teacher-write">
	<form name="teacherWrite-frm" method="post" action="<c:url value='${url}'/>" enctype="multipart/form-data">
	<c:if test="${!empty vo}">
		<input type="hidden" value="${vo.eduTeaNo }" name="eduTeaNo">
	</c:if>
	<div class="teacherWrite-head">
		<h2 class="text-gray-800" id="teacherCreate-title">${pageTitle}</h2>
		<div class="teacher-write-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/education/teacher?eduTeaNo=1"/>'" value="취소">
			<input type="submit" class="bg-gradient-primary" id="save-teacherWrite" value="${str}">
		</div>
	</div>
		<div class="teacherWrite-body">
			<div class="teacherWrite-setting">
				<div class="teacherWrite-setting-head">
					<h3>강사 정보</h3>
				</div>
				<div class="teacherWrite-setting-body" >
					<dt>이름</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.eduTeaName }" type="text" name="eduTeaName" id="teacher_name" maxlength="60">
							${educationVo.eduTeaName }
						</div>
					</dd>
					<dt>아이디</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.eduTeaId }" type="text" name="eduTeaId" id="teacher_id" maxlength="60">
							${educationVo.eduTeaId }
						</div>
					</dd>
					<dt>비밀번호</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.eduTeaPwd }" type="text" name="eduTeaPwd" id="teacher_pwd" maxlength="60">
							${educationVo.eduTeaPwd }
						</div>
					</dd>
					<dt>이메일</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.eduTeaEmail }" type="text" name="eduTeaEmail" id="teacher_email" maxlength="60">
							${educationVo.eduTeaEmail }
						</div>
					</dd>
					<dt>전화번호</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" type="text" value="${vo.eduTeaTel }" name="eduTeaTel" id="teacher_tel" maxlength="13">
							${educationVo.eduTeaTel }
						</div>
					</dd>
					<dt>사진</dt>
					<dd>
						<div class="input_group v2">
							<input type="hidden" name="oldFileName" value="${vo.eduTeaImg }">
							<input class="form-control" type="file" value="${vo.eduTeaImg }" name="file" id="teacher_img" maxlength="20">
							${educationVo.eduTeaImg }
							<c:if test="${vo.eduTeaImg != null && vo.eduTeaImg != ''}">
								<img src="<c:url value='/fileUpload/${vo.eduTeaImg }'/>">
							</c:if>
						</div>
					</dd>
				</div>
			</div>
		</div>
	</form>
</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
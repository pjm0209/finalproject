<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<c:if test="${empty vo}">
	<c:set var="str" value="등록"/>
	<c:set var="pageTitle" value="교육 등록" />
	<c:set var="url" value="/admin/education/educationWrite" />
	<c:set var="no" value="${param.eduNo }" />	
</c:if>
<c:if test="${!empty vo}">
	<c:set var="str" value="수정"/>
	<c:set var="pageTitle" value="교육 수정" />
	<c:set var="url" value="/admin/education/educationEdit" />
	<c:set var="no" value="0" />	
</c:if>
<div class="education-write">
	<form name="educationWrite-frm" method="post" action="<c:url value='${url}'/>">
	<c:if test="${!empty vo}">
		<input type="hidden" value="${vo.eduNo }" name="eduNo">
	</c:if>
	<div class="educationWrite-head">
		<h2 class="text-gray-800" id="educationCreate-title">${pageTitle}</h2>
		<div class="education-write-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/education/list?eduNo=1"/>'" value="취소">
			<input type="submit" class="bg-gradient-primary" id="save-educationWrite" value="${str}">
		</div>
	</div>
		<div class="educationWrite-body">
			<div class="educationWrite-setting">
				<div class="educationWrite-setting-head">
					<h3>교육 정보</h3>
				</div>
				<div class="educationWrite-setting-body" >
					<dt>교육 이름</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" value="${vo.eduName }" type="text" name="eduName" id="education_name" maxlength="60">
							${educationVo.eduName}
						</div>
					</dd>
					<dt>강사명</dt>
					<dd>
						<div class="input_group v2 mb-3">
							<select id="getTeaName" class="form-control" name="eduTeaNo">
								<option value="0">강사명을 선택하세요.</option>
								<c:forEach var="educationVo" items="${teaNameList}">
									<option value="${educationVo.eduTeaNo }"
										<c:if test="${vo.eduTeaNo == educationVo.eduTeaNo }">
											selected="selected"
										</c:if>
								>
								${educationVo.eduTeaName }</option>
								</c:forEach>
							</select>
						</div>
					</dd>
					<dt>교육 기간</dt>
					<dd>
						<div class="input_group v2">
							<input type="date" name="eduCom" value="${vo.eduCom }" class="form-control">${educationVo.eduCom}
						</div>
					</dd>
					<dt>최대 인원</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" type="text" value="${vo.eduPeopleNumber }" name="eduPeopleNumber" id="education_people" maxlength="10">
							${educationVo.eduPeopleNumber }
						</div>
					</dd>
					<dt>교육비</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" type="text" value="${vo.eduPrice }" name="eduPrice" id="education_price" maxlength="10">
							${educationVo.eduPrice }
						</div>
					</dd>
					<dt>교육장</dt>
					<dd>
						<div class="input_group v2 mb-3">
						    <select id="selectPlace" class="form-control"  name="epNo" >
						    	<option value="0">교육장을 선택하세요.</option>
						    	<c:forEach var="educationVo" items="${epNameList }">
						    		<option value="${educationVo.epNo }"
						    			<c:if test="${vo.epNo == educationVo.epNo }">
											selected="selected"
										</c:if>
						    		>${educationVo.epName }</option>
						    	</c:forEach>
						    </select>
						</div>
					</dd>
				</div>
			</div>
		</div>
	</form>
</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
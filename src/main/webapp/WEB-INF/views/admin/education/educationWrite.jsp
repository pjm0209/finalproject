<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>


<div class="education-write">
	<form name="educationWrite-frm" method="post" action="<c:url value='/admin/education/educationWrite'/>">
	<div class="educationWrite-head">
		<h2 class="text-gray-800" id="educationCreate-title">새 교육 추가</h2>
		<div class="education-write-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/education/list?eduNo=1"/>'" value="취소">
			<input type="submit" class="bg-gradient-primary" id="save-educationWrite" value="저장">
		</div>
	</div>
		<div class="educationWrite-body">
			<div class="educationWrite-setting">
				<div class="educationWrite-setting-head">
					<h3>교육 정보</h3>
				</div>
				<div class="educationWrite-setting-body">
					<dt>교육 이름</dt>
					<dd>
						<div class="input_group v2"><input type="text" name="educationName" id="education_name" maxlength="60"></div>
					</dd>
					<dt>강사명</dt>
					<div class="mb-3">
					    <select id="selectTeaName" class="form-control"  name="teacherName" >
					    	<option></option>
					       		<c:forEach var="educationVo" items = "${list }">
					      	 	</c:forEach>
					    </select>
					</div>
					<dt>교육 기간</dt>
					
					<dt>최대 인원</dt>
					<dd>
						<div class="input_group v2"><input type="text" name="educationPeople" id="education_people" maxlength="10"></div>
					</dd>
					<dt>교육비</dt>
					<dd>
						<div class="input_group v2"><input type="text" name="educationPrice" id="education_price" maxlength="10"></div>
					</dd>
					<dt>교육장</dt>
					<div class="mb-3">
					    <select id="selectPlace" class="form-control"  name="educationPlace" >
					    	<option></option>
					    </select>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</div>

<script type="text/javascript" src="<c:url value='/admin-css-js/js/education.js'/>"></script>
<%@ include file="../inc/bottom.jsp"%>
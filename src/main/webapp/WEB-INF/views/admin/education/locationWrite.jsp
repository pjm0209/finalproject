<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/js/paging.js'/>"></script>

<div class="location-write">
	<form name="locationWrite-frm" method="post" action="<c:url value='/admin/education/locationWrite'/>">
	<div class="locationWrite-head">
		<h2 class="text-gray-800" id="locationCreate-title">새 교육 추가</h2>
		<div class="location-write-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/education/location?epNo=1"/>'" value="취소">
			<input type="submit" class="bg-gradient-primary" id="save-locationWrite" value="저장">
		</div>
	</div>
		<div class="locationWrite-body">
			<div class="locationWrite-setting">
				<div class="locationWrite-setting-head">
					<h3>교육장 정보</h3>
				</div>
				<div class="locationWrite-setting-body" >
					<dt>교육장 이름</dt>
					<dd>
						<div class="input_group v2"><input class="form-control" type="text" name="locationName" id="location_name" maxlength="60"></div>
					</dd>
					<dt>우편번호</dt>
					<dd>
						<div class="mb-3">
							<input type="text" name="zipcode" id="zipcode" ReadOnly  
					        	title="우편번호" class="width_80">
					        <input type="Button" value="우편번호 찾기" id="btnZipcode" title="새창열림"><br />
					        <span class="sp1">&nbsp;</span>
					        <input type="text" name="address" ReadOnly title="주소"  class="width_350"><br />
					        <span class="sp1">&nbsp;</span>
					        <input type="text" name="addressDetail" title="상세주소"  class="width_350">
						</div>
					</dd>
					<dt>교육 기간</dt>
					<dd>
						<div><input type="date" name="educationCom" class="form-control"></div>
					</dd>
					<dt>최대 인원</dt>
					<dd>
						<div class="input_group v2"><input class="form-control" type="text" name="educationPeople" id="education_people" maxlength="10"></div>
					</dd>
					<dt>교육비</dt>
					<dd>
						<div class="input_group v2"><input class="form-control" type="text" name="educationPrice" id="education_price" maxlength="10"></div>
					</dd>
					<dt>교육장</dt>
					<dd>
						<div class="mb-3">
						    <select id="selectPlace" class="form-control"  name="educationPlace" >
						    	<option></option>
						    	<option value="0">교육장을 선택하세요.</option>
						    	<c:forEach var="educationVo" items="${epNameList }">
						    		<option value="${educationVo.epNo }">${educationVo.epName }</option>
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
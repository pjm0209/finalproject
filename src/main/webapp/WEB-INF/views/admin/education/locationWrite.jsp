<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<c:if test="${empty vo}">
	<c:set var="str" value="등록"/>
	<c:set var="pageTitle" value="교육장 등록" />
	<c:set var="url" value="/admin/education/locationWrite" />
	<c:set var="no" value="${param.epNo }" />	
</c:if>
<c:if test="${!empty vo}">
	<c:set var="str" value="수정"/>
	<c:set var="pageTitle" value="교육장 수정" />
	<c:set var="url" value="/admin/education/locationEdit" />
	<c:set var="no" value="0" />	
</c:if>
<div class="location-write">
	<form name="locationWrite-frm" method="post" action="<c:url value='${url}'/>">
	<c:if test="${!empty vo}">
		<input type="hidden" value="${vo.epNo }" name="epNo">
	</c:if>
	<div class="locationWrite-head">
		<h2 class="text-gray-800" id="locationCreate-title">${pageTitle}</h2>
		<div class="location-write-head-button">
			<input type="button" class="bg-gradient-secondary" onclick="location.href='<c:url value="/admin/education/location?epNo=1"/>'" value="취소">
			<input type="submit" class="bg-gradient-primary" id="save-locationWrite" value="${str}">
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
						<div class="input_group v2">
							<input class="form-control" value="${vo.epName }" type="text" name="epName" id="location_name" maxlength="60">
							${educationVo.epName }
						</div>
					</dd>
					<dt>우편번호</dt>
					<dd>
						<div>
							 <input class="form-control mr-2" type="text" value="${vo.epZipcode }" name="epZipcode" id="zipcodePostalCode" style="width:200px; float:left">	
							 ${educationVo.epZipcode }
       						 <input type="button" class="form-control" style="width:130px" value="우편번호 찾기" id="btnZipcode" title="새창열림" onclick="sample4_execDaumPostcode()">
						</div>
					</dd>
					<dt>상세 주소</dt>
					<dd>
						<div class="input_group v2">
							<input type="text" class="form-control" id="locationAddress" name="epAddress"  value="${vo.epAddress }" >${educationVo.epAddress}
						</div>
					</dd>
					<dt>경도</dt>
					<dd>
						<div class="input_group v2">
							<input type="text" class="form-control" id="locationLatitude" name="epLatitude"  value="${vo.epLatitude }" >${educationVo.epLatitude}
						</div>
					</dd>
					<dt>위도</dt>
					<dd>
						<div class="input_group v2">
							<input type="text" class="form-control" id="locationLongitude" name="epLongitude"  value="${vo.epLongitude }" >${educationVo.epLongitude}
						</div>
					</dd>
					<dt>전화번호</dt>
					<dd>
						<div class="input_group v2">
							<input class="form-control" type="text" value="${vo.epTel }" name="epTel" id="location_tel" maxlength="13">
							${educationVo.epTel }
						</div>
					</dd>
				</div>
			</div>
		</div>
	</form>
</div>
</div>

<%@ include file="../inc/bottom.jsp"%>
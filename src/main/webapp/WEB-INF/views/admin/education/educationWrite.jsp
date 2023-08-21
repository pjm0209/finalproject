<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value='/admin-css-js/js/education.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<meta charset="UTF-8">
</head>
<body>
<c:if test="${empty vo}">
	<c:set var="str" value="등록"/>
</c:if>
<c:if test="${!empty vo}">
	<c:set var="str" value="수정"/>
</c:if>
	<form name="frmEduWrite" method="post" action="<c:url value='/admin/education/educationWrite'/>">
		<div style="height:650px;width: 750px;margin-left: 25px;margin-top: 30px;">
			<h1>교육 ${str}</h1><br>
		</div>
	</form>
</body>
</html>
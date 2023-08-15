<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>message.jsp</title>
</head>
<body>
<c:if test="${empty closePopup}">
	<c:set var="closePopup" value="false"/>
</c:if>
	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript">
		alert('${msg}');
		location.href="<c:url value='${url}'/>";
		if(${closePopup}){
			self.close();
		}
	</script>
</body>
</html>
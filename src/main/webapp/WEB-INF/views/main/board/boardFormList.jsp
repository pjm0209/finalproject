<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
a {
	color: black;
	text-decoration: none;	
}

a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<c:forEach var="vo" items="${boardFormList }">
		<li><a href="<c:url value='/main/board/boardMain'/>">${vo.boardFormName }</a></li>
	</c:forEach>
</body>
</html>
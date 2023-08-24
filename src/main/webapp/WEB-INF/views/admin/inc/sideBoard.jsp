<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="sideBoardNav">
	<c:forEach var="vo" items="${boardList }">
		<input type="hidden" value="${vo.boardFormNo }">
		<a class="collapse-item" href="<c:url value='/admin/board/board?boardFormNo=${vo.boardFormNo }'/>">
			<span>${vo.boardFormName }</span>
		</a>
	</c:forEach>
</div>
</body>
</html>
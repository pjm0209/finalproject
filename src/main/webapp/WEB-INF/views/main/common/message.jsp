<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>message.jsp</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<link href="<c:url value='/admin-css-js/css/board.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
<c:if test="${empty closePopup}">
	<c:set var="closePopup" value="false"/>
</c:if>

	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		$('#MessageModal').trigger('click');
		$('#btClose').click(function(){
			if(${closePopup}){
				opener.location.reload();
				self.close();
			}
		});
		$(".modal").on("shown.bs.modal", function () {		
			$('#btClose').focus();
		});
		
	});
</script>
	<button type="button" style="display: none" id="MessageModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop"></button>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">알림창</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        	${msg}
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="btClose" class="btn bg-orange-primary" onclick='location.href="<c:url value='${url}'/>"' data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 화면</title>
<script type="text/javascript">
	$(function(){
	    $('input[type=submit]').click(function(){
	       if($('#pwd').val().length<1){
	          alert("비밀번호를 입력해주세요");
	          $('#pwd').focus();
	          return false;
	       }
	       
	       if(!confirm("삭제하시겠습니까?")){
	          return false;
	       }
	    })
	 });

</script>
</head>
<body>
<div class="divfrm">
		<form name="frmDelete" method="post"
			action="<c:url value='/member/memberDelete'/>">
			<fieldset>
				<legend>회원 삭제</legend>
				<input type="hidden" name="no" value="${param.no }">

				<div>
					<span class="sp">${param.name} 회원을 삭제하시겠습니까?</span>
				</div>
				<div>
					<label for="pwd">비밀번호</label> <input type="password" id="pwd"
						name="pwd" />
				</div>
				<div class="center">
					<input type="submit" value="삭제" /> <input type="Button"
						value="회원목록" OnClick="location.href='<c:url value='/member/memberList'/>'"/>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>
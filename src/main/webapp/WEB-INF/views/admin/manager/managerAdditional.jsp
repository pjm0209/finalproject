<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<title>관리자 추가</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-color: #f7f7f7;
}

.container {
  max-width: 500px;
  margin: 0 auto;
  padding: 20px;
  background-color: white;
  border: 1px solid #dddddd;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
  border-radius: 5px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 10px;
}

th, td {
  padding: 10px;
  border: 1px solid #dddddd;
}

th {
  background-color: #f2f2f2;
}

input[type="text"], input[type="password"], input[type="email"] {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
  margin: 5px 0;
  box-sizing: border-box;
}


.btn-primary {
  background-color: #eb5d1e;
  border: none;
  color: white;
  padding: 10px 20px;
  border-radius: 3px;
  cursor: pointer;
}

.error-message {
  color: red;
  font-size: 14px;
  margin-top: 5px;
}

.success-message {
  color: green;
  font-size: 14px;
  margin-top: 5px;
}

.hidden {
  visibility: hidden;
}
</style>

<script type="text/javascript">

function validateSignupForm() {
    var userid = $('#managerId').val();
    var password1 = $('#managerPwd').val();
    var password2 = $('#managerCheckPwd').val();
    var telNumber = $('#managerTel').val();
    var email = $('#managerEmail').val();
    
    if (!validate_userid(userid)) {
        alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
        $('#managerId').focus();
        return false;
    }
    
    // ... (기존의 유효성 검사 코드들)
    
    // 아이디 중복확인 여부 확인
    var btnChkId = $('#btnChkId').val();
    if (btnChkId !== 'Y') {
        alert('아이디 중복확인을 해주세요.');
        return false;
    }
    
    return true;
}

$(function(){
    $('#adminSignUpButton').click(function(){
        var userid = $('#managerId').val();
        
        if (!validate_userid(userid)) {
            alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
            $('#managerId').focus();
            return false;
        }
        
        $.ajax({
            url: "<c:url value='/main/member/checkId'/>",
            type: "get",
            data: "userid=" + userid,
            dataType: 'json',
            success: function(res){
                if (res == 1) {
                    alert("이미 존재하는 아이디입니다.");
                } else if (res == 2) {
                    $('#useridError').html("사용가능한 아이디입니다.");
                    $('#useridError').css('color', 'blue');
                    $('#btnChkId').val('Y'); 
                }
            },
            error: function(xhr, status, error){
                alert(status + " : " + error);
            }                        
        });
    });
});

</script>

<div class="container">
	<form name="form-ManagerAdditional" method="post" action="<c:url value='/admin/manager/managerAdditional'/>">
		<table class="table table-bordered table-hover" style="text-align:center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="3"><h4>관리자 등록 </h4></th>
				</tr>
			</thead>		
		<tbody>
			<tr>
			    <td style="width:100px;"><h5>아이디</h5></td>
			    <td>
			        <div style="display: flex;">
			            <input class="form-control" type="text" id="managerId" name="managerId" maxLength="20" style="flex: 1;">&nbsp;
			            <button class="btn btn-primary" onclick="registerCheckFunction();" type="button">중복확인</button>  
			        </div>                      
			    </td>
			</tr>
			
			<tr>
				<td style="width:100px;"><h5>비밀번호</h5></td>
				<td><input class="form-control" type="password" id="managerPwd" name="managerPwd" maxLength="20"></td>							
			</tr>
			
			<tr>
				<td style="width:100px;"><h5>비밀번호 확인</h5></td>
				<td><input class="form-control" type="password" id="managerCheckPwd" name="managerCheckPwd" maxLength="20"></td>							
			</tr>
			
			<tr>
				<td style="width:100px;"><h5>전화번호</h5></td>
				<td><input class="form-control" type="text" id="managerTel" name="managerTel"  maxLength="20"></td>							
			</tr>
						
			<tr>
				<td style="width:100px;"><h5>이메일</h5></td>
				<td colspan="2"><input class="form-control" type="email" id="managerEmail" name="managerEmail"  maxLength="20"></td>							
			</tr>
						
			<tr>
				<td colspan="3"><input class="btn btn-primary pull center" type="submit" value="등록" style="width: 50%;"></td> 							
			</tr>		
																																
		</tbody>
		</table>
	</form>
</div>


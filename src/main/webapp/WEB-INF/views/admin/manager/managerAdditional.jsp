<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>

<style>
.container2 {
  font-family: Arial, sans-serif;
  background-color: #f7f7f7;	
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: white;
  border: 1px solid #dddddd;
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1)
  border-radius: 5px;
  margin-top: 80px;
  margin-bottom: 90px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 10px;
}

h4{
	font-width: bold;
}

th, td {
  padding: 20px;
  border: 1px solid #dddddd;
}

th {
  background-color: #f2f2f2;
}

input[type="text"], input[type="password"], input[type="email"] {
  width: 50%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 3px;
  margin: 5px 0;
  box-sizing: border-box;
  float: left;
}


#btnChkId {
  background-color: #eb5d1e;
  border: none;
  color: white;
  padding: 10px 20px;
  border-radius: 3px;
  cursor: pointer;
}


button#signUpButton {
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

.error {
  width: 15rem;
  color: red;
  font-size: 15px;
  margin-top: 15px;
  font-weight: bold;
  float: left;
}

.error2 {
  width: 14rem;
  color: red;
  font-size: 15px;
  margin-top: 15px;
  font-weight: bold;
  float: left;
}

#btAdminChkId{
    background-color: #eb5d1e; 
    border: none;
    color: white;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
}


</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
function validate_userid(uid) {
	var contextPath = "/mbti";
	
   console.log(uid);
   var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
   return pattern.test(uid);
}

function validate_hp(ph) {
   var pattern = new RegExp(/^[0-9]*$/g);
   return pattern.test(ph); 
}
   
$(document).ready(function() {     
    $('#btAdminChkId').click(function() {
        // 아이디 입력
        var managerId = $('#managerId').val();
        if (managerId.length < 1) {
            $('#idError').text("먼저 아이디를 입력하세요").css('color', 'red');
            $('#managerId').focus();
            return false;
        }
               
      //아이디 조건
      if (!validate_userid($('#managerId').val())) {
         alert("아이디는 영문, 숫자, _(밑줄문자)만 가능합니다");
         $('#managerId').focus();
         return false;
      }
        
      $.ajax({
         url:contextPath + "/admin/manager/checkId",
         type: "get",
         data: "adminId=" + $('#managerId').val(),
         dataType: 'json',
         success:function(res){
            console.log(res);
            if(res==1){
               $('#idError').html("이미 존재하는 아이디입니다.");
               $('#idError').css('color', 'red'); 
            } else if(res == 0) {
               $('#idError').html("사용가능한 아이디입니다.");
               $('#idError').css('color', 'blue');
               $('#ckId').val('Y'); 
            }
         },
         error:function(xhr, status, error){
            alert(status+" : " + error);
         }                  
      });
   });
    
    //비밀번호 조건
    $('#managerPwd').keyup(function() {
        var memberPwd = $('#managerPwd').val();
        var pwdError = $('#PwdError');

        if (memberPwd.length < 8 || memberPwd.length > 20 ||
            !/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]+$/.test(memberPwd)) {
            pwdError.html("비밀번호는 문자, 숫자, 특수문자를 포함한 8~20자여야 합니다");
            pwdError.css('color', 'red');
        } else {
            pwdError.html("");
        }
    });
    
	//비밀번호 일치/불일치
	$('#managerCheckPwd').keyup(function() {
	    var memberPwd = $('#managerPwd').val();
	    var memberpwdCheck = $(this).val();
	    var pwdCheckError = $('#PwdCheckError');

	    if (memberPwd !== memberpwdCheck) {
	    	pwdCheckError.html("비밀번호가 일치하지 않습니다.");
	    	pwdCheckError.css('color', 'red');
	    } else {
	    	pwdCheckError.html("비밀번호가 일치합니다");
	    	pwdCheckError.css('color', 'blue');
	    }
	});
	
 	//전화번호 ('-')자동입력
	$('#managerTel').on('input', function() {
	    var inputTel = $(this).val();
	    
	    var cleanedTel = inputTel.replace(/-/g, '');

	    if (cleanedTel.length >= 4) {
	        cleanedTel = cleanedTel.substring(0, 3) + '-' + cleanedTel.substring(3);
	    }
	    if (cleanedTel.length >= 9) {
	        cleanedTel = cleanedTel.substring(0, 8) + '-' + cleanedTel.substring(8);
	    }
	    
	    $(this).val(cleanedTel);
	    
	});   
 	
 	//전화번호 조건
    $('#managerTel').on('input', function() {
        var inputTel = $(this).val();
        var TelError = $('#TelError');	

        var pattern = /^\d{3}-\d{3,4}-\d{4}$/; 

        if (!pattern.test(inputTel)) {
            TelError.html("유효한 전화번호 형식이 아닙니다.");
            TelError.css('color', 'red');
        } else {
            TelError.html("");
        }
    });
	
	//이메일 조건
    $('#managerEmail').keyup(function() {
        var email = $('#managerEmail').val();
        var emailError = $('#EmailError');

        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

        if (!emailPattern.test(email)) {
            emailError.html("유효한 이메일 형식이 아닙니다.");
            emailError.css('color', 'red');
        } else {
            emailError.html("");
        }
    });
	
	$('#signUpButton').click(function(){	
		//아이디 입력
        if ($('#managerId').val().length < 1) {
            //alert("아이디를 입력하세요");
            $('#alertModalBody').html("아이디를 입력하세요");
			$('#alertModal').modal('show');
            $('#managerId').focus();
            return false;
        }
		
        //아이디 중복확인
		if($('#ckId').val()!='Y'){
	         //alert('아이디 중복확인을 해주세요.');
	        $('#alertModalBody').html("아이디 중복 확인을 해주세요");
		 	$('#alertModal').modal('show');
	        $('#managerId').focus();
	        return false;
	    }
      
		//비밀번호 입력
		if ($('#managerPwd').val().length < 1) {
			//alert("비밀번호를 입력하세요");
			$('#alertModalBody').html("비밀번호를 입력하세요");
		 	$('#alertModal').modal('show');
			$('#managerPwd').focus();
			return false;
		}
		        
        //전화번호 입력
        var managerTel = $('#managerTel').val();
        if (managerTel.length < 1) {
        	//alert("전화번호를 입력하세요");
            $('#alertModalBody').html("전화번호를 입력하세요");
		 	$('#alertModal').modal('show');
            $('#managerTel').focus();
            return false;
        }
               
        //이메일 입력
        if ($('#managerEmail').val().length < 1) {
            //alert("이메일을 입력하세요");
            $('#alertModalBody').html("이메일을 입력하세요");
		 	$('#alertModal').modal('show');
            $('#managerEmail').focus();
            return false;
        }  	 	       
	});		
      
});
</script>

<div class="container2">
   <form name="form-ManagerAdditional" method="post" action="<c:url value='/admin/manager/managerAdditional'/>">
      <table class="table table-bordered table-hover" style="text-align:center; border: 1px solid #dddddd">
         <thead>
            <tr>
               <th colspan="4"><h4>관리자 등록 </h4></th>
            </tr>
         </thead>      
      <tbody>
         <tr>
             <td style="width:100px;" colspan="2" class="td1"><h6>아이디</h6></td>
             <td>
                 <div style="display: flex;">
                     <input class="form-control" type="text" id="managerId" name="adminId" maxLength="20" style="flex: 1;">&nbsp;
                     <button id="btAdminChkId" value="중복 확인" type="button">중복 확인</button>
                     <input type="hidden" value="" id="ckId">
                     <span class="error" id="idError"></span>    
                 </div>                      
             </td>
         </tr>
         
         <tr>
            <td style="width:100px;" colspan="2" class="td1"><h6>비밀 번호</h6></td>
            <td><input class="form-control" type="password" id="managerPwd" name="adminPwd" maxLength="20">
            	<span class="error" id="PwdError"></span>  
            </td>                     
         </tr>
         
         <tr>
            <td style="width:100px;" colspan="2" class="td1"><h6>비밀 번호<br>확인</h6></td>
            <td><input class="form-control" type="password" id="managerCheckPwd" name="managerCheckPwd" maxLength="20">
            	<span class="error2" id="PwdCheckError"></span>  
            </td>                     
         </tr>
         
         <tr>	
            <td style="width:100px;" colspan="2" class="td1"><h6>전화번호</h6></td>
            <td><input class="form-control" type="text" id="managerTel" name="adminTel"  maxLength="20">
            	<span class="error" id="TelError"></span>  
            </td>                     
         </tr>
                  
         <tr>
            <td style="width:100px;" colspan="2" class="td1"><h6>이메일</h6></td>
            <td colspan="2"><input class="form-control" type="email" id="managerEmail" name="adminEmail"  maxLength="30">
            	<span class="error" id="EmailError"></span> 
            </td>                     
         </tr>
                  
         <tr>
            <td colspan="3"> <button class="submit" id="signUpButton">등록</button></td>                      
         </tr>                                                                                                  
      </tbody>
      </table>
   </form>
</div>
<%@ include file="../inc/bottom.jsp"%>
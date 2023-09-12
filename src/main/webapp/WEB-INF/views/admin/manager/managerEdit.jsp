<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  margin-top: 200px;
  margin-bottom: 200px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 10px;
}

h4{
	font-width: bold;
	font-weight: 700;
}

h6{
	color:black;
	font-weight: 700;
	
}

th, td {
  padding: 20px;
  border: 1px solid #dddddd;
}

th {
  background-color: #f2f2f2;
}

input[type="text"], input[type="email"] {
  width: 50%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
  margin: 5px 0;
  box-sizing: border-box;
  float: left;
}

button#EditButton {
    background-color: #eb5d1e; 
    border: none;
    color: white;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
}

</style>

<script>
$(document).ready(function() {   
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
});

</script>

<div class="container2">
   <form name="form-ManagerEdit" method="post" action="<c:url value='/admin/manager/managerEdit'/>">
      <table class="table table-bordered table-hover" style="text-align:center; border: 1px solid #dddddd">
         <thead>
            <tr>
               <th colspan="4"><h4>관리자 정보</h4></th>
            </tr>
         </thead>      
      <tbody>
         <tr>
             <td style="width:100px;" colspan="2" class="td1"><h6>관리자 번호</h6></td>
             <td>
                 <div style="display: flex;">
                    <input type="text" name="adminNo" value="${adminvo.adminNo }" readonly="readonly"/>
                 </div>                      
             </td>
         </tr>      
         <tr>
             <td style="width:100px;" colspan="2" class="td1"><h6>아이디</h6></td>
             <td>
                 <div style="display: flex;">
                 	<input type="text" name="adminId" value="${adminvo.adminId }" readonly="readonly"/>
                 </div>                      
             </td>
         </tr>
                       
         <tr>	
            <td style="width:100px;" colspan="2" class="td1"><h6>전화번호</h6></td>
            <td><input class="form-control" type="text" id="managerTel" name="adminTel"  maxLength="20" value='${adminvo.adminTel }'>
            </td>                     
         </tr>
                  
         <tr>
            <td style="width:100px;" colspan="2" class="td1"><h6>이메일</h6></td>
            <td colspan="2"><input class="form-control" type="email" id="managerEmail" name="adminEmail"  maxLength="30" value='${adminvo.adminEmail}'>
            </td>                     
         </tr>
          <tr>
         </tr>                  
         <tr>
            <td colspan="3"> <button class="submit" id="EditButton">수정</button></td>                      
         </tr>                                                                                                  
      </tbody>
      </table>
   </form>
</div> 
<%@ include file="../inc/bottom.jsp"%>  
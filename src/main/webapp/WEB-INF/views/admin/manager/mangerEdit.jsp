<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>


</style>

<div class="container2">
   <form name="form-ManagerEdit" method="post" action="<c:url value='/admin/manager/managerEdit'/>">
      <table class="table table-bordered table-hover" style="text-align:center; border: 1px solid #dddddd">
         <thead>
            <tr>
               <th colspan="4"><h4>관리자 정보 </h4></th>
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
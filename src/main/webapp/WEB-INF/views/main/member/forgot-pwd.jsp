<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    
<style>
*{
	margin: 0px;
	box-sizing: border-box;
	font-size:15px;
}

.content{
	margin-top: 100px;
	margin-bottom: 20px;
}

.content h1{
	margin-top: 180px;
	margin-bottom: 10px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.content p{
	margin-bottom: 30px;
	text-align: center;
	font-size: 15px;
}

.content input{
	font-size: 15px;
    border: 1px solid black;
    border-radius: 3px;
    line-height: 30px;
    padding-left: 10px;
    padding-right: 10px;
    width: 280px;
}

.content div {
    padding-top: 3px;
    padding-bottom: 8px;
}

.content label{
	font-weight: bold;
	margin-left: 750px;
}

.btnSearch {
    text-align: center;	
    justify-content: space-between; 
    margin-bottom: 100px;
}

.btnSearch button[type="submit"]{
  	width: 180px;
 	height: 50px;
	font-weight: bold;	
	color: white;
}

.btnSearch button[type="button"]{
	width: 180px;
 	height: 50px;
	font-weight: bold;	
	color: white;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.tab {
    display: flex;
    justify-content: center;
    margin-top: 30px;
    margin-bottom: 20px;
}

.tab-button {
    cursor: pointer;
    padding: 15px 50px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 5px 5px 0 0;
    font-size: 18px;
}

.tab-button.active {
    background-color: darkorange;
    border-bottom: none;
}

.tab-content {
    display: none;
    width: 100%;
    padding: 20px;
}

.tab-content.active {
    display: block;
}
</style>

<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    $(function() {          
        $('#btnCancel').click(function(){
            var confirmed = confirm("메인 화면으로 돌아가시겠습니까?");
            if (confirmed) {
                window.location.href = '<c:url value="/main/index"/>';
            }
        }); 
        
        $("#sendEmailBtn").click(function(){
        	var userid=$('#id').val();
			var email=$('#email').val();
			
        	if(userid.length < 1){
				//alert("아이디를 입력해주세요.");
				$('#alertModalBody').html('아이디를 입력해주세요.');
				$('#alertModalBtn').trigger('click');
				$("#id").focus;
				return false;
	      	}  
        	
        	if(email.length < 1){
				//alert("이메일을 입력해주세요.");
				$('#alertModalBody').html('이메일을 입력해주세요.');
				$('#alertModalBtn').trigger('click');				
				$("#email").focus;
				return false;
	      	} 
   	
        	$.ajax({
        		url : "<c:url value='/main/member/ajaxsendEmail'/>",
        		type : 'post',
        		data : {
        				userid : userid,
        				email : email
        		},
        		dateType:'json',
        		success : function(result){
        			if(result==1){
      					//alert("임시 비밀번호 발송 완료!! 이메일을 확인해주세요");
						$('#alertModalBody').html('임시 비밀번호 발송 완료!! 이메일을 확인해주세요');
						$('#alertModal').modal('show');	 
						
						$('#alertModal').on("hidden.bs.modal",function(){
	      					location.href="<c:url value='/main/member/findPwdResult'/>";       				
							
						});
        			}else if(result==0){
      					//alert("임시 비밀번호 발송 실패!!");
						$('#alertModalBody').html('임시 비밀번호 발송 실패!! 아이디와 이메일을 다시확인해주세요');
						$('#alertModalBtn').trigger('click');
        			}
        			
        		},
	            error:function(xhr,status,error){
  	                alert(status+" : "+error);
	            }    
        	});//ajax
        });//
    });
</script>

<div class="content">
<h1>비밀번호 찾기</h1>	
		<p>회원가입 시 입력한 이메일 주소로 임시 비밀번호를 전송해드립니다.</p>	
			<div class="findEmail-id">
				<label>*&nbsp;아이디 : &nbsp;&nbsp;&nbsp;</label>
					<input type="text" name="userid" id="id" placeholder="아이디를 입력하세요">	
			</div><br>		
		
			<div class="findEmail-email">
				<label>*&nbsp;E-mail : &nbsp;&nbsp;&nbsp;</label>
					<input type="text" name="email" id="email" placeholder="이메일을 입력하세요">		
			</div><br>
												
			<div class="btnSearch"><br>
				<button class="btn btn-primary" type="submit" name="submit" id="sendEmailBtn">전송</button>	
				<button class="btn btn-info" type="button" id="btnCancel">취소</button>					
			</div>
</div>				
  <button type="button" style="display: none" id="alertModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#alertModal"></button>
    
    <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="alertModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="alertModalBody"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn bg-orange-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <button type="button" style="display: none" id="confirmModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmModal"></button>
    
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="confirmModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="confirmModalBody"></p>
	      </div>
	      <div class="modal-footer">
	      	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn bg-orange-primary" id="confirmOk" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div> 
<%@ include file="../inc/bottom.jsp" %>   

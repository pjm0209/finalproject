<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 결과 페이지</title>
</head>
<body>
    <div class="text-center">                                                               
        <h1 class="h4 text-gray-900 mb-2">Please check your ID</h1><br><br>                 
        <c:choose>                                                                          
            <c:when test="${empty membervo}">                                                 
                <p class="mb-4">조회결과가 없습니다.</p>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <p class="mb-4">${searchVO.me_id}</p>                                              
            </c:otherwise>                                                                    
        </c:choose>                                                                         
    </div> 

</body>
</html>
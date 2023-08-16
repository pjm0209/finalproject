<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	
</style>
<title>통계자세히보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$(this).parent().fadeOut();
		$('button').click(function(){
			self.close();
		});
		
		
	});
</script>
</head>
<body>


<div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title">매출정보 <span id="date">(2023년 8월 16일)</span></h5>
               </div>
               <div class="modal-body">
                   <table class="resp_table">
                       <colgroup>
                           <col style="width:50%"><col style="width:50%">
            </colgroup>
            <tbody>
                <tr>
                    <th>상품 결제금액</th>
                    <td><span id="orderProductPriceTotal">0</span><span class="unit">원</span></td>
                </tr>
                <tr>
                    <th>배송비 결제금액</th>
                    <td><span id="orderShippingTotal">0</span><span class="unit">원</span></td>
                </tr>
                <tr>
                    <th>상품 환불금액</th>
                    <td><span id="orderProductRefundPriceTotal">0</span><span class="unit">원</span></td>
                </tr>
                <tr>
                    <th>매출액</th>
                    <td><span id="takings">0</span><span class="unit">원</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-primary btnProcClaimRequest" data-dismiss="modal">확인</button>
    </div>
</div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
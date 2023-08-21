<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<link href="<c:url value='/admin-css-js/css/book-order.css'/>" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>


<div class="head-div">
	<h2 class="text-gray-800">주문 관리</h2>
</div>

<!--  -->
	<div class="wrap shadow-sm p-3 mb-5 bg-body rounded" style="margin: 15px 15px;background: white;">
		<div class="x_panel">
		<div class="x_title">
			
		</div>
		<div class="x_content">

			<form action="ordermainup" class="form-horizontal" id="frm" name="frm" method="post">
		


				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<h2><b>주문상품정보</b></h2>
						<div class="table-responsive">
							<table class="table ">
								<thead>
									<tr style="background-color: #f1f1f1">
										<th style="text-align: center;">상품이미지</th>
										<th style="text-align: center;">상품명<br>옵션</th>
										<th style="text-align: center;">상품코드</th>
										<th style="text-align: center;">판매가</th>
										<th style="text-align: center;">주문수량</th>
										<th style="text-align: center;">판매가합</th>
									</tr>
								</thead>
								<tbody>
									
										<tr>
											<td style="text-align: center;vertical-align: middle;">
												<a href="/productsub/fo/4900/10/productview.sd" target="_blank"><img src="/data/img/pr/thumb/1ac164f334004f06872b8584fc5298dd.jpg"></a>
											</td>
											<td style="text-align: center;vertical-align: middle;">
												가슴에 다는 장미
											</td>
											<td style="text-align: center;vertical-align: middle;">SD-0000000010</td>
											<td style="text-align: center;vertical-align: middle;">
												30,000원
											</td>
											<td style="text-align: center;vertical-align: middle;">
												
												1
											</td>
											<td style="text-align: center;vertical-align: middle;">
												30,000원
											</td>
										</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<h2><b>결제정보</b></h2>
						<div class="table-responsive">
							<table class="table ">
								<colgroup>
									<col style="background-color: #f1f1f1;text-align: center" width="20%">
									<col width="80%">
								</colgroup>

								<tbody><tr>
									<th style="text-align: center;">주문번호</th>
									<td>SD_1521596762750</td>
								</tr>
								<tr>
									<th style="text-align: center;">결제타입</th>
									<td>
										
											무통장입금
											
											
											
										
									</td>
								</tr>
								
								<tr>
									<th style="text-align: center;">배송비</th>
									<td>
										3,000원
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">결제금액</th>
									<td>
										33,000원
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">주문상태</th>
									<td>
										취소신청
									</td>
								</tr>
							</tbody></table>
						</div>
					</div>
				</div>
				
<!-- 										<div class="row form-inline"> -->
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<h2><b>배송정보</b></h2>
						<div class="table-responsive">
							<table class="table ">
								<colgroup>
									<col style="background-color: #f1f1f1;" width="20%">
									<col width="80%">
								</colgroup>
								<tbody><tr>
									<th style="text-align: center;vertical-align: middle;">받으시는 분</th>
									<td>
										<input class="form-control" id="odma_name" name="odma_name" type="text" value="멤버5">															
									</td>
								</tr>
								<tr>
									<th style="text-align: center;vertical-align: middle;">휴대전화</th>
									<td>
										<input class="form-control" id="odma_phone" name="odma_phone" type="text" value="011-1234-1233">
									</td>
								</tr>
								<tr>
									<th style="text-align: center;vertical-align: middle;">유선전화</th>
									<td>
										<input class="form-control" id="odma_tel" name="odma_tel" type="text" value="02-1234-1228">
									</td>
								</tr>
								<tr>
									<th style="text-align: center;vertical-align: middle;">배송지</th>
									<td>
										<input type="button" class="form-control btn btn-primary zip" onclick="getZipcode();" value="우편번호 검색"><br>
										<input type="text" class="form-control" placeholder="우편번호" name="odma_zipcode" id="odma_zipcode" value="06271" readonly="readonly">
										<input type="text" class="form-control" placeholder="기본주소" name="odma_addr1" id="odma_addr1" value="서울 강남구 강남대로 242" readonly="readonly" style="margin-top: 5px;">
										<input type="text" class="form-control" placeholder="상세주소" name="odma_addr2" value="5" style="margin-top: 5px;">
									</td>
								</tr>
								<tr>
									<th style="text-align: center;vertical-align: middle;">배송업체</th>
									<td>
										<select class="form-control" id="odm_pccseq" name="odm_pccseq">
											<option value="">선택</option>
											
												<option value="1">우체국</option>
											
												<option value="2">CJ대한통운</option>
											
												<option value="3">한진택배</option>
											
												<option value="4">로젠택배</option>
											
												<option value="6">KG옐로우캡택배</option>
											
												<option value="7">우체국EMS</option>
											
												<option value="8">디에이치엘</option>
											
												<option value="9">페덱스</option>
											
												<option value="10">유피에스</option>
											
												<option value="11">하나로택배</option>
											
										</select>
									</td>
								</tr>
								<tr>
									<th style="text-align: center;vertical-align: middle;">송장번호</th>
									<td class="form-inline">
										<input class="form-control" id="odm_delinum" name="odm_delinum" type="text" value="" style="margin-left: 18px;">
										
									</td>
								</tr>
							</tbody></table>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<h2><b>주문메모</b></h2>
						<div class="table-responsive">
							<table class="table ">
								<colgroup>
									<col style="background-color: #f1f1f1;" width="20%">
									<col width="80%">
								</colgroup>
								<tbody><tr>
									<th style="text-align: center;vertical-align: middle;">주문메모</th>
									<td>
										<textarea class="form-control" id="odm_memo" name="odm_memo" rows="5" style="width: 100%;"></textarea>															
									</td>
								</tr>
							</tbody></table>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class=" text-right">
						<button style="margin: 0px 5px;" type="button" class="btn btn-success" onclick=""><i class="fas fa-save"></i> 저장</button>
						<button style="margin: 0px 5px;" type="button" class="btn btn-primary" onclick="location.href=orderList.jsp"><i class="fas fa-list-ul"></i> 리스트</button>
					<div class=" text-right">
						<button type="button" class="btn btn-success btn-sm">결제완료</button>
						<button type="button" class="btn btn-danger btn-sm">주문취소</button>
					</div>
					</div>
				</div>
				
			</form>
		</div>
	</div>
</div>
<!--  -->


</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
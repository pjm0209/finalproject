<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<link href="<c:url value='/admin-css-js/css/book-order.css'/>" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>


<div class="head-div">
	<h2 class="text-gray-800">판매 상품 등록</h2>
</div>

<form name="frmBookRegister" method="post" action="/admin/book/bookRegister">
<!--  -->
	<div class="wrap shadow-sm p-3 mb-5 bg-body rounded" style="margin: 15px 15px;background: white;">
		<div class="x_title">
			<h2>상품등록</h2>
		</div>
		
		<div class="bookContent">
	
			<div class="category red">
				<label class="" for="select1">상품카테고리</label>
				<div class="flex">
				
				<div class="c1">
					<select class="form-select red" aria-label="Default select example" id="select1">
						<option selected>Open this select menu</option>
				 		<option value="1">One</option>
				  		<option value="2">Two</option>
				  		<option value="3">Three</option>
					</select>
				</div>
				<div class="c2">
					<select class="form-select red" aria-label="Default select example" id="select1">
						<option selected>Open this select menu</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>
						</div>									
			</div>
	
			
			<div class="bookCode red">
				<label class="" for="inputCode">상품코드</label>
				<div class="flex">
					<div class="">
						<input class="form-control red flex_1" id="inputCode" name="bookNo" placeholder="상품코드" type="text" >
					</div>
					<div class="chkBookNo">
						<button id="btnChkBookNo" class=" flex_1" type="button" title="증복확인">증복확인</button>
					</div>
				</div>
			</div>
													
			<div class="bookTitle red">
				<label class="" for="bookTitle">상품명</label>
				<div class="inputTitle">
					<input class="form-control" id="bookTitle" name="bookTitle" placeholder="상품명" type="text">
				</div>
			</div>
	
			<div class="bookExplains">
				<label class="" for="bookExplains">상품간단설명</label>
				<div class="inputBookExplains">
					<input class="form-control" id="bookExplains" name="bookExplains" placeholder="상품간단설명(최대 400자까지 입력가능합니다)" type="text" value="">
				</div>
			</div>
			
			<div class="bookPrice">
				<label class="" for="bookPrice">판매가</label>
				<div class="inputBookPrice">
					<input class="form-control" id="bookPrice" name="bookPrice" placeholder="판매가 예) 12000" type="number" value="0">
				</div>
			</div>
	
			<div class="bookImage">
				<label class="" for="bookImage">상품이미지1(900x1080)</label>
				<div class="inputBookImage">
					<input class="form-control" id="bookImage" name="bookImage" placeholder="상품이미지1(900x1080)" type="file" value="" accept="image/*">
				</div>
				<c:if test="${!empty param.bookNo}">
					<label class="" for="bookImage">현재이미지</label>
					<div class="inputBookImage">
						<%-- <img src="<c:url value='/book/images/${vo.imageURL}'/>"> --%>
						<img src="<c:url value='/images/다운로드.jpg'/>">
					</div>
				</c:if>
			</div>
			
			<div class="bookWriter">
				<label class="" for="bookWriter">저 자</label>
				<div class="inputBookWriter">
					<input class="form-control" id="bookWriter" name="bookWriter" placeholder="저 자" type="text" value="">
				</div>
			</div>
			
			<div class="bookPublisher red">
				<label class="" for="bookPublisher">제조사</label>
				<div class="inputBookPublisher">
					<input class="form-control red" id="bookPublisher" name="bookPublisher" placeholder="제조사" type="text" value="">
				</div>
			</div>
			
	
			<div class="bookQTY">
				<label class="" for="INTOSTOCK_QTY">재고</label>
				<div class="inputBookQTY">
					<input class="form-control" id="INTOSTOCK_QTY" name="INTOSTOCK_QTY" placeholder="재고" type="number" value="0">
				</div>
			</div>
	
			<div class="bookRegate">
				<label class="" for="bookRegate">제조일</label>
				<div class="inputBookRegdate">
					<input class="form-control" id="bookRegate" name="bookRegate" placeholder="제조일" type="date" value="">
				</div>
			</div>
	
			
			<div class="contents">
				<label class="" for="contents">내용</label>
				<div class="inputContents">
					<textarea rows="" cols="" name="contents" id="contents">
					</textarea>
					<script>
						$(function () {
							CKEDITOR.replace('contents', {
								filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do'
							});
						});
					</script>
				</div>
			</div>
	
			<div class="bookFlag red">
				<label class="" for="inputBookFlag">사용여부</label>
				<div class="inputBookFlag">
					<label class="radio-inline">
						<input name="bookFlag" placeholder="사용여부" type="radio" value="Y" checked="checked">YES
					</label>
					<label class="radio-inline">
						<input name="bookFlag" placeholder="사용여부" type="radio" value="N">NO
					</label>
				</div>
			</div>
	
			<div class="divBtn">
					<button class="btn btn-success btn-sm" title="저장" type="submit"><i class="fas fa-save"></i> 저장</button>
					<button class="btn btn-primary btn-sm" onclick="location.href='bookList'" title="리스트" type="button" ><i class="fas fa-list-ul"></i> 리스트</button>
			</div>
	
		</div>
</div>
<!--  -->

</form>


</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
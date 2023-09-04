<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<link href="<c:url value='/admin-css-js/css/book-order.css'/>" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/admin-css-js/js/book.js"></script>
<script src="${pageContext.request.contextPath}/admin-css-js/js/bookFunc.js"></script>
<script type="text/javascript">
	//이미지 정보들을 담을ㄴ배열
	var sel_files = [];
	
	$(function(){
		$("#upfile").on("change", handleImgFileSelect);
		$('#imgLb').text("");
	});
	
	function fileUploadAction(){
		cosole.log("fileUploadAction");
		$("#upfile").trigger('click');
	}
	
	function handleImgFileSelect(e){
		//이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_warp").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		$('#imgLb').text("미리보기");
		var index = 0;
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장지만 가능합니다.");
				return;
			}
			
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e){
				var html = 
					"<div id=\"img_id_"+index+"\"><a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" title='이 파일 삭제하기'>" + "< "	+ (index+1) + ". " + files.item(index).name	+ " ><i class=\"bi bi-trash3-fill\"></i></a>" + "<img class=\"shadow-sm bg-body rounded\" style=\"width: 1350px;margin-bottom:3px;\" src=\""+e.target.result+"\" data-file='"+f.name+"' class='selProductFile'></div>";
				$(".imgs_wrap").append(html);
				index++;
			}
			reader.readAsDataURL(f);
		});
	}
function deleteImageAction(index){
		
		console.log("index = " + index);
		sel_files.splice(index, 1);
		
		var img_id = "#img_id_"+index;
		$(img_id).remove();
		
		console.log(sel_files);
		
		if(index == -1){
			$('.imgs_wrap').html("");
		}
	}
	

	
</script>
<div class="head-div">
	<h2 class="text-gray-800">
		<c:if test="${empty param.bookNo}">
			판매 상품 등록
		</c:if>
		<c:if test="${!empty param.bookNo}">
			판매 상품 수정
		</c:if>
	</h2>
</div>
<c:if test="${!empty param.bookNo}">
		<input type="text" name="bookNo" id="bookNo" value="${param.bookNo}">
	 </c:if>
<form id="frmBookRegister" name="frmBookRegister" method="post" enctype="multipart/form-data"
	<c:if test="${empty param.bookNo}">
		action="<c:url value='/admin/book/bookRegister'/>"
	</c:if>
	<c:if test="${!empty param.bookNo}">
		action="<c:url value='/admin/book/bookEdit'/>"
	</c:if>
 >
	<!--  -->
	<div class="wrap shadow-sm p-3 mb-5 bg-body rounded" style="margin: 15px 15px;background: white;">
		<div class="x_title">
			<h2>
				<c:if test="${empty param.bookNo}">
					상품 등록
				</c:if>
				<c:if test="${!empty param.bookNo}">
					상품 수정
				</c:if>
			</h2>
		</div>
		
		<div class="bookContent">
			<div class="category red">
				<label class="" for="select1">상품카테고리</label>
				<div class="flex">
					<div class="c1">
						<select class="form-select red" aria-label="Default select example" id="select1"
						name="bookCategory">
							<option value=""
								<c:if test="${vo.bookCategory == null and vo.bookCategory == ''}">
									selected="selected"
								</c:if>
							>선택하기</option>
					 		<option value="검사자료"
								<c:if test="${vo.bookCategory == '검사자료'}">
									selected="selected"
								</c:if>
							>검사자료</option>
							<option value="도서"
								<c:if test="${vo.bookCategory == '도서'}">
									selected="selected"
								</c:if>
							>도서</option>
							<option value="기타"
								<c:if test="${vo.bookCategory == '기타'}">
									selected="selected"
								</c:if>
							>기타</option>
						</select>
					</div>
					<<!-- div class="c2">
						<select class="form-select red" aria-label="Default select example" id="select1">
							<option selected>Open this select menu</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div> -->
				</div>									
			</div>
			<div class="bookTitle">
				<label class="" for="bookExplains">상품 이름</label>
				<div class="inputBookTitle">
					<input class="form-control" id="bookTitle" name="bookTitle" placeholder="책 이름" type="text" value="${vo.bookTitle}">
				</div>
			</div>
			<div class="bookExplains">
				<label class="" for="bookExplains">상품간단설명</label>
				<div class="inputBookExplains">
					<input class="form-control" id="bookExplains" name="bookExplains" placeholder="상품간단설명(최대 60자까지 입력가능합니다)"
					 type="text" value="${vo.bookExplains}" maxlength="125">
				</div>
			</div>
			
			<div class="bookPrice">
				<label class="" for="bookPrice">판매가</label>
				<div class="inputBookPrice">
					<input class="form-control" id="bookPrice" name="bookPrice" placeholder="판매가 예) 12000"
					 type="number" value="${vo.bookPrice}">
				</div>
			</div>
	
			<div class="bookImage">
				<label class="" for="bookImage">상품이미지</label>
				<div class="inputBookImage" style="margin-bottom: -60px;">
					<!-- <input class="form-control" id="bookImage" name="bookImage" placeholder="5MB이하" type="file" value="" accept="image/*" multiple="multiple"> -->
					<!-- <input id="myfiles" multiple type="file" />
					<p id="output"></p> -->
					<!-- <input id="myfiles" type="file" style="margin-bottom: 1em;" multiple="multiple" onchange="readURL(this);"> -->
					<!-- <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일업로드</a> -->
					<input class="form-control" type="file" id="upfile" name="upfile" multiple="multiple" onclick="deleteImageAction(-1)">
					<p id="output"></p>
					<div class="imgs_wrap">
						<label id="imgLb" class="" for="preview" style="margin-left: -240px">
						<img id="img" width="1000px;">
					</div>
				</div>
				<c:if test="${!empty param.bookNo}">
					<label class="" for="bookImage">현재이미지</label>
					<div class="inputBookImage">
						<img src="<c:url value='/images/bookProduct/upload_img/${vo.bookImgName}'/>" 
							alt = "${vo.bookImgOriginalname}이미지" id="preview" width="300px;">
						<input type="text" name="bookImgName" value="${vo.bookImgName}">
					</div>
				</c:if>
			</div>
			<br>
			<div class="bookWriter" style="margin-top: 35px;">
				<label class="" for="bookWriter">저 자</label>
				<div class="inputBookWriter">
					<input class="form-control" id="bookWriter" name="bookWriter"
					 placeholder="저 자" type="text" value="${vo.bookWriter}">
				</div>
			</div>
			
			<div class="bookPublisher red">
				<label class="" for="bookPublisher">제조사</label>
				<div class="inputBookPublisher">
					<input class="form-control red" id="bookPublisher" name="bookPublisher"
					 placeholder="제조사" type="text" value="${vo.bookPublisher}">
				</div>
			</div>
			
	
			<div class="bookQTY">
				<label class="" for="INTOSTOCK_QTY">재고</label>
				<div class="inputBookQTY">
					<input class="form-control" id="INTOSTOCK_QTY" name="INTOSTOCK_QTY" placeholder="재고"
					 type="number" value="${vo.stockQty}">
				</div>
			</div>
	
			<div class="bookRegate">
				<label class="" for="bookRegate">등록일</label>
				<div class="inputBookRegdate">
					<input class="form-control" id="bookRegate" name="bookRegate" placeholder="출간일"
					 type="date" value="${vo.bookRegdate}">
				</div>
			</div>
	
			
			<div class="contents">
				<label class="" for="contents">내용</label>
				<div class="inputContents">
					<textarea rows="" cols="" name="bookDetails" id="contents">
					${vo.bookDetails}
					</textarea>
					<script>
						$(function () {
							CKEDITOR.replace('contents', {
								uploadUrl: "/mbti/bookImageUpload",	//드래그 앤 드롭	
								filebrowserUploadUrl : '/mbti/bookImageUpload',
								height : 500
							});
						});
					</script>
				</div>
			</div>
	
			<div class="bookFlag red">
				<label class="" for="inputBookFlag">사용여부</label>
				<div class="inputBookFlag">
					<label class="radio-inline">
						<input name="bookUseflag" placeholder="사용여부" type="radio" value="Y"
						<c:if test="${vo.bookUseflag == 'Y'}">
						 	checked="checked"
						 </c:if>
						 >YES
					</label>
					<label class="radio-inline">
						<input name="bookUseflag" placeholder="사용여부" type="radio" value="N"
							<c:if test="${vo.bookUseflag == 'N'}">
						 		checked="checked"
						 	</c:if>
						>NO
					</label>
				</div>
			</div>
	
			<div class="divBtn">
				<button id="submitBtn" class="btn btn-success btn-sm" type="submit"><i class="fas fa-save"></i>
					<c:if test="${empty param.bookNo}">
						 저 장
					</c:if>
					<c:if test="${!empty param.bookNo}">
						 수 정
					</c:if>
				</button>
				<button class="btn btn-primary btn-sm" onclick="location.href='bookList?bookFlag=bookList'" title="리스트" type="button" ><i class="fas fa-list-ul"></i> 리 스 트</button>
			</div>
	
		</div>
	</div>
</form>
</div>

<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
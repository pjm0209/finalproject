<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/admin-css-js/js/book.js'/>"></script>
<script type="text/javascript">
	$(function(){
		
		$('#perRecord').change(function(){
			$('input[name=perRecord]').val($('#perRecord').val());
		});
		
		$('#searchByKeywordBtn').click(function(){
			//alert($('form[name=serach]').serializeArray()); // [object Object],[object Object]
			//alert($.param($('form[name=serach]').serializeArray()));
			//alert($(this).serialize());
			
			var bf = $('#searchBookFlag').val();
			if(bf === 'bookListByKeyword'){
				$("#frmPageIdBookFlag").val(bf);
			} else if(bf === 'InventoryByKeyword'){
				$("#frmPageIdBookFlag").val(bf);
			}
			
			$('input[name=currentPage]').val("1");
			ajaxFunc(); // ajax 함수
			
			//기본 이벤트 제거
			/* event.preventDefault(); */
			
		});
		
		$('#toggleBtn').click(function(){
			var a = $('#toggleBtn').text()
		 	var b = '검색창 열기';
			var c = '검색창 닫기';
			if(a === b){
				$('#toggleBtn').text(c);
			} else if(a === c){
				$('#toggleBtn').text(b);
			} 
		});
		
		$("#searchByKeywordBtn").trigger('click');
		
	});
	
	function checkAll(evt){
		
		var checked=$(evt).prop("checked");
		$('input[type=checkbox]').prop("checked",checked);
		
	}
	
	function ajaxFunc (){
		var result='';
		var result2='';
		var result3='';
		var result4='';
		
		var x = $('#searchBookFlag').val();
		
		$.ajax({
			url:"<c:url value='/admin/book/bookAjaxList?bookFlag=" + x + "'/>",
			type:"post",
			dataType:"json",
			data: $('form[name=serach]').serializeArray(), // 입력 양식의 내용을 객체로 만든다
			success:function(res){
	 //{"searchCondition":"","searchKeyword":"","searchUseYn":"","currentPage":1,"blockSize":0,"firstRecordIndex":1,"lastRecordIndex":1,"recordCountPerPage":0,"bookNo":30023,"bookTitle":"16가지 성격유형 도표","bookPrice":8500,"bookPublisher":"어세스타","bookRegdate":"2023-08-22 01:09:25","bookImgName":null,"bookImgSize":0,"bookImgOriginalname":null,"bookCategory":"기타","bookWriter":"어세스타","bookUseflag":"Y","bookExplains":"A1사이즈로 코팅된 종이로 그룹의 결과 유형 분포표를 한 눈에 보기 쉽게 확인할 수 있는 자료입니다","bookDetails":"A1사이즈로 코팅된 종이로 그룹의 결과 유형 분포표를 한 눈에 보기 쉽게 확인할 수 있는 자료입니다","stockQty":100,"orderBy":null,"bookFlag":null,"perRecord":0,"keywordCategory":null,"keywordNo":null,"keywordTitle":null,"keywordPublisher":null,"keywordUseflag":null,"keywordRegdate":null,"keywordRegdate2":null} */
				 if(res.list.length > 0){
						var result=makeListJson(res.list);
						$('#bookTbody').html(result);
						
						result=makePage(res.pagingInfo);
						$("#bookPaging").html(result);
						
						$("#captionBook").text("TOTAL " + res.pagingInfo.totalRecord + " ROWS");
						
				} else {
					var str = "<tr>";
					str += "<th colspan='10' style='color:gray;'>해당 상품은 존재하지 않습니다.</th>";
					str += "</tr>";
					$("#bookTbody").html(str);
					$("#bookPaging").html("");
				} 
			},
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});//ajax
	}
	function deleteEach(originalBookNo){
		if (confirm("상품번호 : " + originalBookNo+"을 삭제할까요?")) {
			/* $('form[name=frmList]').submit(); */
			$.ajax({
			url:"<c:url value='/admin/book/bookAjaxDelete'/>",
			type:"post",
			data:{
				bookNo: originalBookNo
			},
			success:function(cnt){
				if(cnt > 0){
					alert("상품번호 : " + originalBookNo + " 삭제 성공했습니다.");
					ajaxFunc();
				} else {
					alert("상품번호 : " + originalBookNo + " 삭제 실패입니다. 다시 시도해주세요.");
				} 
			},
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		});//ajax
		}
	}

	function updateQtyEach(oBookNo, oQty, idx){
		var uQty = $(idx).parent().parent().find("td[name=qtyTd]").find("input").val();
		console.log(oBookNo + ", " + oQty + ", " + uQty);
		if(oQty == uQty){
			$('#alertModalBody').html("동일한 값입니다. 변경할 재고수를 다시 입력하세요.");
			$('#alertModalBtn').trigger('click');
			return false;
		}
		$('#confirmModalBody').html("기존 " + oQty +" → " + uQty + "(으)로 변경할까요?");
		$('#confirmOk').attr("onclick","ajaxUpdateQty("+oBookNo +", "+ oQty+ ", "+ uQty+")");
		$('#confirmModalBtn').trigger('click');
	}
	
	function ajaxUpdateQty(oBookNo, oQty, uQty){
		$.ajax({		
			url:"<c:url value='/admin/book/bookAjaxUpdateQty'/>",
			type:'POST',
			data:{
				bookNo: oBookNo,
				stockQty: uQty 
			},
			success:function(cnt){
				if(cnt > 0){
					alert(oQty + " → " + uQty + " 수정 성공했습니다.");
					ajaxFunc();
				} else {
					alert("재고량 수정 실패했습니다...");
				} 
			},
			error:function(xhr, status, error){
				alert(status + " : " + error);
			}
		})
	}
	
	function openEdit(bookNo){
		location.href="bookEdit?bookNo=" + bookNo;
	}
	function makeListJson(list){
		var htmlStr = "";
		
		$.each(list,function(idx,items){
			
			var num = this.bookPrice;
			var bookPrice = num.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			var num = this.bookRegdate;
			var bookRegdate = num.substring(0, 10);
			htmlStr += "<tr>";
			htmlStr += "<td scope='row'>";
			htmlStr += "<input type='checkbox' name='stockBookItems["+idx+"].bookNo' class='book-checkbox' value='"+this.bookNo+"'>";
			htmlStr += "</td>";
			htmlStr += "<td>" + this.bookNo + "</td>";
			htmlStr += "<td style='vertical-align: middle'>" + this.bookTitle + "</td>";
			htmlStr += "<td>";
			htmlStr += "<img class='shadow-sm rounded' width='100px' height='150px' src=\"<c:url value='/images/bookProduct/upload_img/" + this.bookImgName + "'/>\" alt=\"" + this.bookTitle + "\">";
			htmlStr += "</td>";
			htmlStr += "<input name='stockBookItems["+idx+"].bookImgName' id='bookImgName2' type='hidden' value='"+this.bookImgName+"'>";
			htmlStr += "<input name='stockBookItems["+idx+"].stockQty' id='stockQty2' type='hidden' value='"+this.stockQty+"'>";
			htmlStr += "<td>";
			htmlStr += this.bookCategory;
			htmlStr += "</td>";
			htmlStr += "<td>";
			htmlStr += bookPrice + "원";
			htmlStr += "</td>";
			htmlStr += "<c:if test='${param.bookFlag != \"Inventory\" or param.bookFlag == \"bookListByKeyword\"}'>";
			htmlStr += "<td>";
			htmlStr += "판매수";
			htmlStr += "</td>";						
			htmlStr += "</c:if>";
	        htmlStr += "<c:if test='${param.bookFlag == \"Inventory\" or param.bookFlag == \"InventoryByKeyword\"}'>";
			htmlStr += "<td name='qtyTd'>";
			htmlStr += "<input id='InputQty["+idx+"]' class='form-control' name='stockQty' type='number' value='" + this.stockQty + "'>";
			htmlStr += "</td>";	
			htmlStr += "</c:if>";
			htmlStr += "<td>";
			htmlStr += this.bookUseflag;
			htmlStr += "</td>";
			htmlStr += "<td>";
			htmlStr += bookRegdate;
			htmlStr += "</td>";
			htmlStr += "<c:if test='${param.bookFlag == \"Inventory\" or param.bookFlag == \"InventoryByKeyword\"}'>";
			htmlStr += "<td>";
			/* htmlStr += "<button class=\"btn btn-success btn-xs blue\" onclick=\"location.href='bookUpdate?bookNo='\"" + this.bookNo + " type='button' title='재고저장' id='editQty'><i class='fas fa-save'></i></button>"; */
			htmlStr += "<button class=\"btn btn-success btn-xs blue editQty\" type='button' title='재고저장' onclick='updateQtyEach("+this.bookNo+","+this.stockQty+", this)'><i class='fas fa-save'></i></button>";
			htmlStr += "</td>";
			htmlStr += "</c:if>";
			htmlStr += "<c:if test='${param.bookFlag == \"bookList\" or param.bookFlag == \"bookListByKeyword\"}'>";
			htmlStr += "<td id='tdLast'>";
			htmlStr += "<a class='btn btn-info btn-xs' target='_blank' title='상품보기' href='/mbti/main/book/bookDetail?bookNo="+this.bookNo+"'><i class='fas fa-eye'></i></a>";
			htmlStr += "<button class='btn btn-success btn-xs' onclick=\"location.href='bookCopyPaste?bookNo='\"" + this.bookNo + " type='button' title='복사'><i class='fas fa-copy'></i></button>";
			htmlStr += "<button class='btn btn-warning btn-xs' onclick=\"openEdit(" +this.bookNo+ ")\" type='button' title='수정'><i class='fas fa-edit'></i></button>";
			htmlStr += "<button class='btn btn-danger btn-xs' id='delBtn' type='button' title='삭제' onclick='deleteEach("+this.bookNo+")'><i class='fas fa-trash'></i></button>";
			htmlStr += "</td>";
			htmlStr += "</c:if>";
		});
		return htmlStr;
	}
	
	function makePage(pageInfo){
		var pageHtmlStr = "";
		pageHtmlStr += "<ul class='pagination pagination-lg justify-content-center'>";
		if(pageInfo.firstPage > 1){
			pageHtmlStr += "<li class='page-item'>";
			pageHtmlStr += "<a class='page-link' href='javascript:void(0);' onclick='bookListPage((" + f(-1) + "))' aria-label='Previous'>";
			pageHtmlStr += "<span aria-hidden='true'>&laquo;</span>";
			pageHtmlStr += "</a>";
			pageHtmlStr += "</li>";
		}
		var f = pageInfo.firstPage;
		var l = pageInfo.lastPage;
		for(var i=f; i <= l; i++){
			if(i==pageInfo.currentPage){
				pageHtmlStr += "<li class='page-item active'>";
				pageHtmlStr += "<a class='page-link' href='javascript:void(0);'>" + i + "</a></li>"; 
			}
			if(i !== pageInfo.currentPage){
				pageHtmlStr += "<li class='page-item'>";
				pageHtmlStr += "<a class='page-link' href='javascript:void(0);' onclick='bookListPage(" + i + ")'>" + i + "</a></li>";
		    }
		}
		
		if((pageInfo.lastPage < pageInfo.totalPage)){
			pageHtmlStr += "<li class='page-item'>";
			pageHtmlStr += "<a class='page-link' href='javascript:void(0);' aria-label='Next' onclick='bookListPage(" + (l + 1) + "'>";
			pageHtmlStr += "<span aria-hidden='true'>&raquo;</span>";
			pageHtmlStr += "</a>";
			pageHtmlStr += "</li>";
		}
		pageHtmlStr += "</ul>";
		
		return pageHtmlStr;
	}
	
	function bookListPage(curPage){
		$("#check-All").prop("checked", false);
		$('input[name=currentPage]').val(curPage);
		$('input[name=perRecord]').val($('#perRecord').val());
		ajaxFunc();
		/* $('form[id=frmPageId]').submit(); */
	}
	
</script>

<!-- Begin Page Content -->
<!-- 
<form id="frmPageId" name="frmPage" method="post"
		>
	frmPageId<input id="frmPageIdBookFlag" type="text" name="bookFlag">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="perRecord" value="5">
	<input type="hidden" name="keywordNo" value="${param.keywordNo}">
	<input type="hidden" name="keywordTitle" value="${param.keywordTitle}">
	<input type="hidden" name="keywordPublisher" value="${param.keywordPublisher}">
	<input type="hidden" name="keywordUseflag" value="${param.keywordUseflag}">
	<input type="hidden" name="keywordRegdate" value="${param.keywordRegdate}">
	<input type="hidden" name="keywordRegdate2" value="${param.keywordRegdate2}">
	<input type="hidden" name="keywordCategory" value="${param.keywordCategory}">
</form>-->
<!-- Page Heading -->

<div class="head-div">
	<h2 class="text-gray-800">판매 상품 관리</h2>
</div>

<!--  -->
<%-- <%@ include file="../book/bookSideBody.jsp"%> --%>
<!--  -->

<div class="board-body">

	<div id="board-title">
		<c:if test="${param.bookFlag != 'Inventory'}">
			<h5>상품 리스트</h5>
			<button class="btn btn-warning bg-gradient-secondary book-button"
				 id="bookRegisterBtn" onclick="location.href='bookRegister'">새 상품 등록</button>
			<button class="btn btn-warning bg-gradient-secondary book-button"  
				 id="bookDeleteBtn" >상품 삭제</button>
			
		</c:if>
		<button id="toggleBtn" class="btn btn-warning bg-gradient-secondary book-button"
			 type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample"
			  aria-expanded="false" aria-controls="collapseExample">검색창 열기</button>
		<c:if test="${param.bookFlag == 'Inventory' or param.bookFlag == 'InventoryByKeyword'}">
			<h5>상품 재고 관리</h5>
			<button class="btn btn-warning bg-gradient-secondary book-button"  
			 id="bookQtyBatchInit" onclick="qtyUpdate()" data-bs-toggle="modal" data-bs-target="#exampleModal">재고 일괄 초기화</button>
			
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">상품 재고 일괄 수정하기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form>
			          <div class="mb-3">
			            <label for="recipient-name" class="col-form-label">일괄 모두 수정하시겠습니까?</label>
			          </div>
			          <div class="mb-3">
			            <input type="number" class="form-control" id="message-text" placeholder="수량 입력...">
			          </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-primary">수정 하기</button>
			      </div>
			    </div>
			  </div>
			</div>
		</c:if>
			
	</div>
	<!--  -->
	<div>
		<div class="collapse" id="collapseExample">
				<%@ include file="../book/bookSearch.jsp"%>
		</div>
		
		<!--  -->
		<div id="eventQty" class="board shadow-sm p-3 mb-5 bg-body rounded" style="margin: 10px 0px;background: white;margin-right: 15px">
			<table class="table">
				<caption id="captionBook" class="captionBook"></caption> <!-- TOTAL &nbsp;${res.pagingInfo.totalRecord}&nbsp; ROWS -->
				<colgroup>
					<col style="width:5%;" />
					<col style="width:10%;" />
					<col style="width:15%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />
					<col style="width:10%;" />	
					<c:if test="${param.bookFlag != 'Inventory' or param.bookFlag == 'bookListByKeyword'	}">
						<col style="width:5%;" />
					</c:if>
					<c:if test="${param.bookFlag == 'Inventory' or param.bookFlag == 'InventoryByKeyword'}">
						<col style="width:10%;" />
					</c:if>
					<col style="width:10%;" />
					<col style="width:10%;" />	
					<col style="width:15%;" />				
				</colgroup>
				<thead>
					<tr class="book-table-colum">
						<th scope="col"><input type="checkbox" id="check-All" class="book-checkbox" onclick="checkAll(this)"></th>
						<th scope="col" class="bookNo">상품코드</th>
						<th scope="col" class="bookTitle">상품명</th>
						<th scope="col" class="bookImage">상품이미지</th>
						<th scope="col" class="bookCategory">카테고리</th>
						<th scope="col" class="bookPrice">판매가</th>
						<c:if test="${param.bookFlag == 'bookList' or param.bookFlag == 'bookListByKeyword'}">
							<th scope="col" class="bookSellCount">판매수</th>
						</c:if>
						<c:if test="${param.bookFlag == 'Inventory' or param.bookFlag == 'InventoryByKeyword'}">
							<th scope="col" class="bookSellCount">재고수</th>
						</c:if>
						<th scope="col" class="bookUseflag">사용여부</th>
						<th scope="col" class="bookRegdate">등록일</th>
						<th scope="col" class="bookManage">관리</th>
					</tr>
				</thead>
				
					 
				<tbody id="bookTbody">
				</tbody>
				
				
			</table>
			<form id="frmDeleteMulti" name="frmDeleteMulti" method="post"  action="<c:url value='/admin/book/deleteMulti'/>">
			<form id="frmUpdateQtyMulti" name="frmUpdateQtyMulti" method="post"  action="<c:url value='/admin/book/updateMulti'/>">
			</form>
			<!-- 페이지 번호 추가 -->	
				<nav id="bookPaging" class="bookPaging" aria-label="Page navigation example">
				 <%--  <ul class="pagination pagination-lg justify-content-center">
				  	<c:if test="${pagingInfo.firstPage > 1 }">
					    <li class="page-item">
					      <a class="page-link" href="#" onclick="bookListPage(${pagingInfo.fistPage - 1})" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    <c:forEach var="i" begin="${pagingInfo.firstPage }" end="${pagingInfo.lastPage }">
				    	<c:if test="${i == pagingInfo.currentPage }">
						    <li class="page-item active"><a class="page-link" href="#">${i }</a></li>		    
				    	</c:if>
				    	<c:if test="${i != pagingInfo.currentPage }">
						    <li class="page-item"><a class="page-link" href="#" onclick="bookListPage(${i})">${i }</a></li>		    
				    	</c:if>
				    </c:forEach>
				    <c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
					    <li class="page-item">
					      <a class="page-link" href="#" aria-label="Next" onclick="bookListPage(${pagingInfo.lastPage + 1})">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				  </ul> --%>
				</nav>
			<!--  페이지 번호 끝 -->
		</div>
	</div>
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
	        <button type="button" id="mbti-modal-close" onclick="opener.window.close()" class="btn bg-orange-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</div>

<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
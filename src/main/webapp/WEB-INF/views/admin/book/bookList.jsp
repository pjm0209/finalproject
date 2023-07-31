<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<!-- Begin Page Content -->
<div class="container-fluid">
	<h2>책 재고 관리하기</h2>
	<!-- Page Heading -->
</div>
<%@include file="bookNav.jsp"%>
<!-- /.container-fluid -->
<div class="x_panel">
	<div class="x_title">
		<h2>상품수정</h2>
		<ul class="nav navbar-right panel_toolbox">
			<li><a class="collapse-link"><i class="fas fa-chevron-up"></i></a></li>
			<li><a class="close-link"><i class="fas fa-close"></i></a></li>
		</ul>
		<div class="clearfix"></div>
	</div>
	<div class="x_content">

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="prc_gnum1">상품카테고리</label>
			<div class="col-sm-2 col-xs-12">
				<select class="form-control" id="prc_gnum1" name="prc_gnum1"
					onchange="getCategory(this, 2);">
					<option value="">선택</option>

					<option value="2">패션</option>

					<option value="3">잡화/뷰티</option>

					<option value="4">출산/육아</option>

					<option value="5">도서/음반</option>

					<option value="6">자동차</option>

					<option value="7">컴퓨터</option>

					<option value="10">문구/사무용품</option>

					<option value="11">스포츠/건강</option>

					<option value="12">가구/인테리어</option>

					<option value="48">디지털</option>

					<option value="3656">식품</option>

				</select>
			</div>
			<div class="col-sm-2 col-xs-12">
				<select class="form-control" id="prc_gnum2" name="prc_gnum2"
					onchange="getCategory(this, 3);">
					<option value="">선택</option>
				</select>
			</div>
			<div class="col-sm-2 col-xs-12">
				<select class="form-control" id="prc_gnum3" name="prc_gnum3"
					onchange="getCategory(this, 4);">
					<option value="">선택</option>
				</select>
			</div>
			<div class="col-sm-2 col-xs-12">
				<select class="form-control" id="prc_gnum4" name="prc_gnum4">
					<option value="">선택</option>
				</select>
			</div>
			<div class="col-sm-2 col-xs-12">
				<button class="btn btn-block btn-info" type="button"
					onclick="categoryAdd();">카테고리 추가</button>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="prcseqadd">등록
				카테고리</label>
			<div class="col-sm-10 col-xs-12" id="prcseqadd">








				<div class="row">
					<div class="col-sm-6 col-xs-12">
						<input class="form-control" name="categoryname" placeholder="카테고리"
							type="text" value="잡화/뷰티>화장품/향수>립케어/블러셔" readonly="readonly">
						<input name="prcm_prcseq" type="hidden" value="846">
					</div>
					<div class="col-sm-6 col-xs-12">
						<button class="btn btn-block btn-warning" type="button"
							onclick="categoryDel(this)">삭제</button>
					</div>
				</div>

			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_code">상품코드</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_code" name="pr_code"
					placeholder="상품코드" type="text" value="liladd-000007"
					readonly="readonly">
			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_name">상품명</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_name" name="pr_name"
					placeholder="상품명" type="text" value="라일라드 라스트 스테이지 틴트 벨벳 루체">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_description">상품간단설명</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_description"
					name="pr_description" placeholder="상품간단설명(최대 400자까지 입력가능합니다)"
					type="text" value="">
			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_price2">원가</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_price2" name="pr_price2"
					placeholder="원가 예) 10000" type="number" value="4800">
			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_price3">소비자가</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_price3" name="pr_price3"
					placeholder="소비자가 예) 15000" type="number" value="16000">
			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_price1">판매가</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_price1" name="pr_price1"
					placeholder="판매가 예) 12000" type="number" value="16000">
			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="file_pr_image1">상품이미지1(900x1080)</label>
			<div class="col-sm-4 col-xs-12">
				<input class="form-control" id="file_pr_image1"
					name="file_pr_image1" placeholder="상품이미지1(900x1080)" type="file"
					value="" accept="image/*">
			</div>
			<label class="col-sm-2 col-xs-12 control-label">현재 상품이미지</label>
			<div class="col-sm-4 col-xs-12">

				<img src="/data/img/pr/small2/2c3632f5a8084a22b1871dcabee9757f.jpg">

			</div>
		</div>

		<div class="form-group ">
			<label class="col-sm-2 col-xs-12 control-label" for="file_pr_image2">상품이미지2(900x1080)</label>
			<div class="col-sm-4 col-xs-12">
				<input class="form-control" id="file_pr_image2"
					name="file_pr_image2" placeholder="상품이미지1(900x1080)" type="file"
					value="" accept="image/*">
			</div>
			<label class="col-sm-2 col-xs-12 control-label">현재 상품이미지</label>
			<div class="col-sm-4 col-xs-12">

				<img src="/data/img/pr/small2/9d5dcda25eba4c459f3fb2fd0bf03652.jpg">

			</div>
		</div>

		<div class="form-group ">
			<label class="col-sm-2 col-xs-12 control-label" for="file_pr_image3">상품이미지3(900x1080)</label>
			<div class="col-sm-4 col-xs-12">
				<input class="form-control" id="file_pr_image3"
					name="file_pr_image3" placeholder="상품이미지1(900x1080)" type="file"
					value="" accept="image/*">
			</div>
			<label class="col-sm-2 col-xs-12 control-label">현재 상품이미지</label>
			<div class="col-sm-4 col-xs-12">

				<img src="/data/img/pr/small2/abaad6c264174a62bf5dee330ca24ae3.jpg">

			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="file_pr_image4">상품이미지4(900x1080)</label>
			<div class="col-sm-4 col-xs-12">
				<input class="form-control" id="file_pr_image4"
					name="file_pr_image4" placeholder="상품이미지2(900x1080)" type="file"
					value="" accept="image/*">
			</div>
			<label class="col-sm-2 col-xs-12 control-label">현재 상품이미지</label>
			<div class="col-sm-4 col-xs-12"></div>
		</div>

		<!-- 										<div class="form-group"> -->
		<!-- 											<label class="col-sm-2 col-xs-12 control-label" for="pr_savemoney">적립금</label> -->
		<!-- 											<div class="col-sm-10 col-xs-12"> -->

		<!-- 											</div> -->
		<!-- 										</div> -->

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_standard">규격</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_standard" name="pr_standard"
					placeholder="규격" type="text" value="">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_brand">브랜드명</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_brand" name="pr_brand"
					placeholder="브랜드명" type="text" value="">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_model">모델</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_model" name="pr_model"
					placeholder="모델" type="text" value="">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_unit">단위</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_unit" name="pr_unit"
					placeholder="단위" type="text" value="">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_manufacture">제조사</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_manufacture"
					name="pr_manufacture" placeholder="제조사" type="text" value="">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_country">원산지</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_country" name="pr_country"
					placeholder="원산지" type="text" value="">
			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_stock">재고</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_stock" name="pr_stock"
					placeholder="재고" type="number" value="1">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_weight">무게</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control" id="pr_weight" name="pr_weight"
					placeholder="무게" type="text" value="">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label"
				for="pr_manufacturingdate">제조일</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control hasDatepicker" id="pr_manufacturingdate"
					name="pr_manufacturingdate" placeholder="제조일" type="text" value="">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label"
				for="pr_expirationdate">유통기한</label>
			<div class="col-sm-10 col-xs-12">
				<input class="form-control hasDatepicker" id="pr_expirationdate"
					name="pr_expirationdate" placeholder="유통기한" type="text" value="">
			</div>
		</div>


		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pro_gname">상품옵션</label>
			<div class="col-sm-5 col-xs-12">
				<input class="form-control" name="pro_gname" id="pro_gname"
					placeholder="옵션그룹명 예)색상" type="text" value="">
			</div>
			<div class="col-sm-5 col-xs-12">
				<button class="btn btn-block btn-info" type="button"
					onclick="proAdd();" data-toggle="tooltip">옵션항목추가</button>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="proadd"></label>
			<div class="col-sm-10 col-xs-12" id="proadd"></div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_content">내용</label>
			<div class="col-sm-10 col-xs-12">
								<input class="form-control" id="pr_content" name="pr_content"
					placeholder="내용" type="hidden" value="">
			</div>
		</div>

		<div class="form-group has-error">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_status">상품상태(Y=정상D=삭제)</label>
			<div class="col-sm-10 col-xs-12">
				<label class="radio-inline"> <input name="pr_status"
					placeholder="상품상태(Y=정상D=삭제)" type="radio" value="Y"
					checked="checked">정상
				</label> <label class="radio-inline"> <input name="pr_status"
					placeholder="상품상태(Y=정상D=삭제)" type="radio" value="D">삭제
				</label>
			</div>
		</div>
		<textarea id="p_content"></textarea>
		<script type="text/javascript">
			 CKEDITOR.replace('p_content'
			                , {height: 500                                                  
			                 }, {
			             		filebrowserUploadUrl : "<c:url value='/admin/book/ckImageUpload'/>"
			             	}); 
		</script>


		<div class="form-group">
			<label class="col-sm-2 col-xs-12 control-label" for="pr_use">사용여부</label>
			<div class="col-sm-10 col-xs-12">
				<label class="radio-inline"> <input name="pr_use"
					placeholder="사용여부" type="radio" value="Y" checked="checked">YES
				</label> <label class="radio-inline"> <input name="pr_use"
					placeholder="사용여부" type="radio" value="N">NO
				</label>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10 col-xs-12">
				<button class="btn btn-success btn-sm" onclick="dataUp()"
					type="button" title="저장">
					<i class="fas fa-save"></i> 저장
				</button>
				<button class="btn btn-primary btn-sm" onclick="dataList()"
					type="button" title="리스트">
					<i class="fas fa-list-ul"></i> 리스트
				</button>
			</div>
		</div>

	</div>
</div>
</div>
<!-- End of Main Content -->
<%@ include file="../inc/bottom.jsp"%>
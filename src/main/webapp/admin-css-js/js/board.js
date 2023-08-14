var fileIndex = 0;

$(function(){
	var contextPath = "/mbti";
	
	$('.board-side-icon').click(function(){
		const boardFormNo = $(this).prev().find('input[type=hidden]').val();
		location.href = contextPath + "/admin/board/boardEdit?boardFormNo=" + boardFormNo;
	});
	
	 CKEDITOR.replace("p_content", {
						uploadUrl: contextPath + "/imageUpload",	//드래그 앤 드롭					
						filebrowserUploadUrl:  contextPath + "/imageUpload", //파일은 이 경로로 업로드
						height : 500
					});		
	
	CKEDITOR.editorConfig=function( config ){ config.resize_enabled=false;};								
     
     $('.checkbox_group > .use_off').on("click", function(){
		$(this).nextAll('input[type=hidden]').val('N');
		$(this).next().attr('class', 'use_on');
		$(this).attr('class', 'use_off on');
	});
	
	$('.checkbox_group > .use_on').on("click", function(){
		$(this).nextAll('input[type=hidden]').val('Y');
		$(this).prev().attr('class', 'use_off');
		$(this).attr('class', 'use_on on');
	});	
	
	$(".checkbox_group").each(function(){
		var boardEditSet = $(this).find('.boardVal').val();
		console.log(boardEditSet);
		
		if(boardEditSet == "Y") {
			$(this).find('.boardSet').val('Y');
			$(this).find('span.use_off').prop('class', 'use_off');
			$(this).find('span.use_on').prop('class', 'use_on on');
		} else {
			$(this).find('.boardSet').val('N');
			$(this).find('span.use_off').prop('class', 'use_off on');
			$(this).find('span.use_on').prop('class', 'use_on');
		}
	});
	
	/*게시글 목록 전체선택 체크박스*/
	$('#check-All').click(function(){
		$('.board-checkbox').prop('checked', this.checked);
	});
	
	/*게시글 상세보기 첨부파일 슬라이드 효과*/
	$('.file-list').hide();
	
	$('.boardFile button').click(function(){
		$('.file-list').slideToggle(500);
	});
	
	/*파일수정 첨부파일 삭제*/
	$('.btns.del_btn.edit').click(function() {
			var fileName = $(this).prev('div.file_input').find('.fileName').val();
			var fileNo = $(this).prev('div.file_input').find('.fileNo').val();
			
			if($(this).prev().find('.fileIdx').val() == '0') {
				$(this).prev().find('.fileOriginName').val('');
			} else {
				$(this).parent('div').remove();				
			}
			
			$.ajax({
				url:"/mbti/admin/board/fileDel",
				data:{fileName: fileName,
					  fileNo: fileNo},
				type:"GET",				
				success:function(result) {
					console.log("result: " + result);					
				},
				error:function(xhr, status, error) {
					alert(status + ": " + error);
				}
			});
		});
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
});

function pageFunc(curPage) {
	$('input[name="currentPage"]').val(curPage);
	$('form[name="paginForm"]').submit();
}

/*글쓰기 첨부파일 함수*/

// 파일 선택
function selectFile(element) {

    const file = element.files[0];
    const filename = element.closest('.file_input').firstElementChild;

    // 1. 파일 선택 창에서 취소 버튼이 클릭된 경우
    if ( !file ) {
        filename.value = '';
        return false;
    }

    // 2. 파일 크기가 20MB를 초과하는 경우
    const fileSize = Math.floor(file.size / 1024 / 1024);
    if (fileSize > 20) {
        alert('20MB 이하의 파일로 업로드해 주세요.');
        filename.value = '';
        element.value = '';
        return false;
    }

    // 3. 파일명 지정
    filename.value = file.name;
}


// 파일 추가
function addFile() {
    const fileDiv = document.createElement('div');
    fileDiv.innerHTML =`
        <div class="file_input">
            <input type="text" readonly />
            <label> 첨부파일` +
                '<input type="file" name="files' + ++fileIndex + '"onchange="selectFile(this);" />' +
             `</label>
        </div>
        <button type="button" onclick="removeFile(this);" class="btns del_btn"><span>삭제</span></button>
    `;
    document.querySelector('.file_list').appendChild(fileDiv);
}


// 파일 삭제
function removeFile(element) {
    const fileAddBtn = element.nextElementSibling;
    if (fileAddBtn) {
        const inputs = element.previousElementSibling.querySelectorAll('input');
        inputs.forEach(input => input.value = '')
        return false;
    }
    element.parentElement.remove();
}

/*const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));*/
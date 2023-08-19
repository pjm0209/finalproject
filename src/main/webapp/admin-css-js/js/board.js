var fileIndex = 0;
var contextPath = "/mbti";

$(function(){
	
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
	
	/*게시글 상세보기 페이지 댓글로딩*/
	if($('.board_comment_flag').val() == 'Y') {
		commentsList($('input[name=boardNo]').val());
	}
	
	/*게시글 상세보기 댓글등록*/	
	$('#comment-submit').click(function() {
		alert("댓글");
		/*$.ajax({
			url:contextPath + "/comments/write",
			data:$('form[name=commentFrm]').serialize(),
			type:"POST",
			success:function(res) {
				console.log(res);
				commentsList($('input[name=boardNo]').val());
				$('#comment-area').val('');
			},
			error:function(xhr, status, error) {
				alert(status + ": " + error);
			}
		});*/
	});
			
	$('#commentReply-submit').click(function() {
		alert("댓글답변");
		//commentReplyWrite($('input[name=boardNo]').val());
		$.ajax({
			url:comtexcontextPath + "/comments/commentsReply",
			data:$('form[name=commentFrm]').serialize(),
			type:"POST",
			success:function(result) {
				console.log(result);
				commentsList($('input[name=boardNo]').val());
				$('#comment-area').val('');
				commentFormMove();
			},
			error:function(xhr, status, error) {
				alert(status + ": " + error);
			}
		});
	});
	
	/*파일수정 첨부파일 삭제*/
	$('.btns.del_btn.edit').click(function() {
		var fileName = $(this).nextAll('.fileName').val();
		var fileNo = $(this).nextAll('.fileNo').val();
		
		$.ajax({
			url:contextPath + "/admin/board/fileDel",
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
	
	//게시글상세보기면 좋아요숫자, 좋아요 체크유무 검색
	if($('#boardDetail').val() == 'boardDetail') {
		likeCountSelect();
		likeSelect();
	}
	
	//좋아요 클릭이벤트
	$('div.board-like').click(function() {
		if($('.u_icon').is('.like') === true) {
			likeDel();
		} else {
			likeIns();
		}
	});
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
});

function commentMore(element) {
	$(element).click(function() {
		$(element).next('.editDel').toggle();
	});
}

function pageFunc(curPage) {
	$('input[name="currentPage"]').val(curPage);
	$('form[name="paginForm"]').submit();
}

//댓글삭제함수
function commentDel(commentsNo, commentsStep, commentsGroupNo, boardNo) {
	alert(commentsNo + ", " + commentsStep + "," + commentsGroupNo + "," + boardNo);
	$.ajax({
		url:contextPath + '/comments/delete',
		type:"POST",
		data:{commentsNo:commentsNo,
			  commentsStep:commentsStep,
			  commentsGroupNo:commentsGroupNo},
		success:function(result) {
			console.log(result);
			commentsList(boardNo);
		},
		error:function(xhr, status, error) {
			alert(status + ": " + error);
		}
	});
}

//좋아요 처리함수
function likeIns() {
	var boardNo = $('input[name=boardNo').val();
	var adminNo = $('input[name=adminNo]').val();
	
	$.ajax({
		url:contextPath + '/boardLike/likeIns',
		type:'POST',
		data:{boardNo:boardNo,
			  adminNo:adminNo},
		success:function(result) {			
			$('.u_icon').addClass('like');
			likeCountSelect();
		},
		error:function(xhr, status, error) {
			alert(status + ": " + error);
		}
	});
}

//좋아요 취소
function likeDel() {
	var boardNo = $('input[name=boardNo').val();
	var adminNo = $('input[name=adminNo]').val();
	
	$.ajax({
		url:contextPath + '/boardLike/likeDel',
		type:'POST',
		data:{boardNo:boardNo,
			  adminNo:adminNo},
		success:function(result) {			
			$('.u_icon').removeClass('like');
			likeCountSelect();
		},
		error:function(xhr, status, error) {
			alert(status + ": " + error);
		}
	});
}

/*좋아요 개수 검색함수*/
function likeCountSelect() {
	var boardNo = $('input[name=boardNo]').val();
	$.ajax({
		url:contextPath + '/boardLike/count',
		type:'GET',
		data:{boardNo:boardNo},
		success:function(result) {
			$('.u_cnt').html(result);
		},
		error:function(xhr, status, error) {
			alert(status + ": " + error);
		}
	});
}

/*좋아요 선택유무*/
function likeSelect() {
	var boardNo = $('input[name=boardNo]').val();
	var adminNo = $('input[name=adminNo]').val();
	
	$.ajax({
		url:contextPath + '/boardLike/like',
		type:'POST',
		data:{boardNo:boardNo,
			  adminNo:adminNo},
		success:function(result) {
			if(result > 0) {
				$('.u_icon').addClass('like');				
			}
		},
		error:function(xhr, status, error) {
			alert(status + ": " + error);
		}
	});
}

/*댓글리스트 불러오기 함수*/
function commentsList(boardNo) {
	$.ajax({
		url:contextPath + '/comments/list',
		type:'GET',
		data:{boardNo:boardNo},
		datatype:'json',
		success:function(result) {
			comments(result);
			$('.editDel').hide();		
		},
		error:function(xhr, status, error) {
			alert(status + ": " + error);
		}
	});
}

//댓글 폼 이동함수
function commentFormMove() {
	$('.commentList').after($('form[name=commentFrm]'));
	$('.comment-item').each(function() {
		$(this).removeClass('commentReply');
	});
	$('.comment-reply').html('답글쓰기');
	
	$('#commentReply-submit').attr('id', 'comment-submit');
	$('input[name=commentsGroupNo]').val('');
	$('#comment-area').next().prop('name', '');
}

//댓글 답글쓰기 폼 함수
function commentReply(element) {
	var commentsNo = $(element).next().val();
	
	if($(element).html() === '답글취소') {
		commentFormMove();
	} else {
		$('.comment-item').each(function() {
			$(this).removeClass('commentReply');
			$(this).find('.comment-reply').html('답글쓰기');
		});
		$(element).parent().parent().after($('form[name=commentFrm]'));
		$(element).parent().parent().addClass('commentReply');
		$(element).html('답글취소');
		
		$('#comment-submit').attr('id', 'commentReply-submit');
		$('#comment-area').next().prop('name', 'commentsGroupNo');
		$('input[name=commentsGroupNo]').val(commentsNo);
	}
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
    $(element).parent().prev('.fileName').html(file.name + "&nbsp&nbsp");
    
    if($(element).parent().prev('.fileName').html().length > 0) {
		$(element).parent().prev('.fileName').after('<span class="bi bi-x-lg" onclick="removeFile(this);" class="btns del_btn"></span>');
	}
}

// 파일 추가
function addFile() {
    const fileDiv = document.createElement('div');
    fileDiv.innerHTML =`
        <div class="file_input">            
            <span class="fileName"></span>
	        
            <label> <i class="bi bi-folder-plus"></i>` +
                '<input type="file" name="files' + ++fileIndex + '"onchange="selectFile(this);" />' +
             `</label>
        </div>
    `;
    document.querySelector('.file_list').appendChild(fileDiv);
}

// 파일 삭제
function removeFile(element) {
    const fileName = $(element).next().find('input[type=file]').attr('name');    
    if (fileName == 'files') {
		$(element).parent().find('input').val('');
        $(element).prev().html('');
        $(element).remove();
        
        return false;
    }
    element.parentElement.remove();
}
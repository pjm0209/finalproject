var contextPath = "/mbti";

$(function(){
	CKEDITOR.replace("p_content", {
						uploadUrl: contextPath + "/imageUpload",	//드래그 앤 드롭					
						filebrowserUploadUrl:  contextPath + "/imageUpload", //파일은 이 경로로 업로드
						height : 500
					});		
	
	CKEDITOR.editorConfig=function( config ){ 
		config.removePlugins = 'resize';
  		config.resize_enabled = false;
	};
	
	/*게시판화면 자동스크롤*/
	var offset = $('.boardContent').offset();  
	window.scrollTo(0, 300);
	
	/*비로그인 글쓰기 버튼클릭시 알림창*/
	$('.boardWriteBtn').click(function(){		
		if($('input[name=user]').val().length < 1) { //비로그인 클릭시
			$('#confirmModalBody').html('글쓰기는 로그인 해야만 이용가능합니다.<br> 로그인하시겠습니까?');
			$('#confirmOk').attr('onclick', 'location.href=\"' + contextPath + '/main/member/memberLogin\"');
			$('#confirmModalBtn').trigger('click');	
		} else { //로그인상태로 클릭시
			var boardFormNo = $('input[name=boardFormNo]').val();
		
			location.href= contextPath + "/main/board/boardWrite?boardFormNo=" + boardFormNo + "&boardWriteType=write";
		}
	});
	
	/*게시글 상세보기 첨부파일 슬라이드 효과*/
	$('.file-list').hide();
	
	$('.boardFile button').click(function(){
		$('.file-list').slideToggle(500);
	});	
		
	/*게시글 상세보기 페이지 댓글, 좋아요 로딩*/
	if($('.board_comment_flag').val() == 'Y') {
		commentsList($('.boardNo').val());
		
		likeCountSelect();
		
		if($('.session-userId').val().length > 0) {
			likeSelect();	
		}		
	}
	
	//좋아요 클릭이벤트
	$('div.board-like').click(function() {
		if($('.session-userId').val().length > 0) {		
			if($('.u_icon').is('.like') === true) {
				likeDel();
			} else {
				likeIns();
			}
		} else {
			$('#confirmModalBody').html('좋아요는 로그인 해야만 이용가능합니다.<br> 로그인하시겠습니까?');
			$('#confirmOk').attr('onclick', 'location.href=\"' + contextPath + '/main/member/memberLogin\"');
			$('#confirmModalBtn').trigger('click');	
		}
	});
	
	$('.boardSubmitBtn').click(function(){
		$('form[name=boardWriteForm]').submit();
	});
	
	if($('.session-userId').val() === $('.member-userId').val()) {
		var boardNo = $('.boardNo').val();
		var str = "";
		
		str += '<input type="button" class="bg-orange-primary" onclick="location.href=\"/main/board/boardEdit?boardNo=' + boardNo + '\" value="수정">';
		str += '<input type="button" class="bg-orange-primary" value="삭제">';
		
		$('.boardListBtn').after().html(str);
	}
	
	//게시글리스트 검색
	$('.bi.bi-search').click(function(){
		$('form[name=searchForm]').submit();
	});
	
	//MBTI게시판 MBTI종류 선택시 검색		
	$('select[name=mbtiNo]').change(function(){
		$('form[name=searchForm]').submit();
	});
	
	//게시글 글쓰기 게시판 선택시 MBTI종류 보이기 유무
	$('#board-write-button').click(function(){
		var mbtiNo = $('select[name=mbtiNo]').val();
		var boardFormNo = $('input[name=boardFormNo]').val();
		
		if(mbtiNo != null) {
			location.href = contextPath + '/main/board/boardWrite?boardFormNo=' + boardFormNo + '&mbtiNo=' + mbtiNo + '&boardWriteType=write';
		} else {
			location.href = contextPath + '/main/board/boardWrite?boardFormNo=' + boardFormNo + '&boardWriteType=write';
		}
	});
	
	//게시글 글쓰기 게시판선택시 mbti셀렉트 보이기여부
	$('#select_board').click(function(){
		var board = $(this).val();
		
		if(board != 5) {
			$('select[name=mbtiNo]').hide();
		} else {
			$('select[name=mbtiNo]').show();
		}
	});
	
	//파일삭제 모달창세팅 이벤트
	$('.bi.bi-x-lg.btns.del_btn.edit').click(function() {
		var id = $(this).attr('id');
		$('#confirmModalBody').html('파일을 삭제하시겠습니까?');
		$('#confirmOk').attr('onclick', 'fileDel('+ id + ')');
		$('#confirmModalBtn').trigger('click');
	});
	
	//게시글 상세보기 게시글삭제 
	$('.btn.boardDelBtn').click(function(){
		var boardNo = $('input[name=boardNo]').val();
		var boardGroupNo = $('input[name=boardGroupNo]').val();
		var boardStep = $('input[name=boardStep]').val();
		
		$('#confirmModalBody').html('게시글을 삭제하시겠습니까?');
		$('#confirmOk').attr('onclick', 'location.href=\"' + contextPath + '/main/board/boardDel?boardNo=' + boardNo + '&boardGroupNo=' + boardGroupNo + '&boardStep=' + boardStep + '\"');
		$('#confirmModalBtn').trigger('click');
	});
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
});

//파일삭제 함수
function fileDel(element){		
	var fileName = $(element).nextAll('.fileName').val();
	var fileNo = $(element).nextAll('.fileNo').val();
	
	$.ajax({
		url:contextPath + "/main/board/fileDel",
		data:{fileName: fileName,
			  fileNo: fileNo},
		type:"GET",				
		success:function(result) {
			console.log("result: " + result);
			removeFile(element);					
		},
		error:function(xhr, status, error) {
			alert(status + ": " + error);
		}
	});
}

//게시글목록 페이징 함수
function pageFunc(curPage) {
	$('input[name="currentPage"]').val(curPage);
	$('form[name="paginForm"]').submit();
}

//게시글목록 페이징 함수
function pageFunc(curPage) {
	$('input[name="currentPage"]').val(curPage);
	$('form[name="paginForm"]').submit();
}

//댓글 수정,삭제박스 열기함수
function commentMore(element) {	
	$(element).next('.editDel').toggle();
}

//좋아요 처리함수
function likeIns() {
	var boardNo = $('input[name=boardNo').val();
	var no = $('input[name=no]').val();
	
	$.ajax({
		url:contextPath + '/boardLike/likeIns',
		type:'POST',
		data:{boardNo:boardNo,
			  no:no},
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
	var no = $('input[name=no]').val();
	
	$.ajax({
		url:contextPath + '/boardLike/like',
		type:'POST',
		data:{boardNo:boardNo,
			  no:no},
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

//댓글리스트 세팅 함수
function comments(comment) {		
		var str = "";
		var boardWriter = "";
		var commentDelCount = 0;
		var commentCount = 0;
		var accordianNo = 0;
		
		if($('.member-userId').val().length < 1) {
			boardWriter = $('.admin-adminId').val();
		} else {
			boardWriter = $('.member-userId').val();			
		}
		
		str += "<div class='accordion' id='accordionExample'>";
		
		for(var i = 0; i < comment.length; i++) {
			var vo = comment[i];			
			var date = new Date(vo.commentsRegdate);
			var user = $('.session-userId').val();
			const regdate = new Date(date.getTime()).toISOString().split('T')[0] + " " + date.toTimeString().split(' ')[0];
			
			if(commentCount % 10 == 0 && comment.length - commentCount >= 10) {
				str += "<div class='accordion-item'>";
				str += "<h2 class='accordion-header'>";
				str += "<button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#collapse" + accordianNo + "' aria-expanded='false' aria-controls='collapse" + accordianNo + "'>";
				str += (commentCount + 1) + " ~ " + (commentCount + 10) + "번째까지 댓글";
				str += "</button></h2>";
				str += "<div id='collapse" + accordianNo + "' class='accordion-collapse collapse' data-bs-parent='#accordionExample'>";
				str += "<div class='accordion-body'>";
				accordianNo = accordianNo + 1;
			}
			
			if(vo.commentsStep < 1) {
				str += "<div class='comment-item'>";
			} else {
				str += "<div class='comment-item reply'>";
			}	
					
			if(vo.commentsDelFlag === 'N') {
				if (vo.adminId != null) {
					str += "<p class='comment-writer'>" + vo.adminId;
				} else {
					str += "<p class='comment-writer'>" + vo.name;
				}
				
				if(boardWriter === vo.name) {
					str += "<span class='boardWriter-commentWrite'>작성자</span>"; 
				} else if(boardWriter === vo.adminId) {
					str += "<span class='boardWriter-commentWrite'>작성자</span>";
				}
				
				str += "<span class='comment-write-regdate'>(" + regdate + ")</span>";
				
				if(vo.commentsStep < 1) {
					str += "<a class='comment-reply' onclick='commentReply(this)'>답글쓰기</a>";
				}
				
				str += "<input type='hidden' name='commentsNo' class='commentsNo' value='" + vo.commentsNo + "'>";
				str += "<div class='commentEditOrDel'>";
				str += "<span onclick='commentMore(this)' class='comment-more'>"; 
				str += "<i class='bi bi-three-dots-vertical'></i></span>";
				
				if(user == vo.userId) {	
					str += "<div class='editDel'>";
					str += "<a class='commentEdit' onclick='commentEdit(this)'>수정</a>";
					str += "<a class='commentDel' onclick='commentDelModal(" + vo.commentsNo + ", " + vo.commentsStep + ", " + vo.commentsGroupNo + ", " + vo.boardNo + ")'>삭제</a></div>";
				}
				
				str += "</div>";
				str += "<p class='comment-body'>" + vo.commentsBody + "</p>";				
			} else {
				str += "<span>삭제된 글입니다.</span>"
				commentDelCount = commentDelCount + 1;
			}
			
			str += "</div>";
			
			if(commentCount % 10 == 9 || commentCount == comment.length - 1) {
				str += "</div></div></div>";
			}
			
			if(vo.commentsDelFlag === 'N') {
				commentCount = commentCount + 1;
			}
		} //for
		
		str += "</div>";
		
		$('div.commentList').html(str);
		$('p.board-comment-count').html("<i class='bi bi-chat-square-dots'>&nbsp</i> 댓글" + (comment.length - commentDelCount));
	}

//댓글 폼 이동함수
function commentFormMove() {
	$('.commentList').after($('form[name=commentFrm]'));
	$('.comment-item').each(function() {
		$(this).removeClass('commentReply');
	});
	$('.comment-reply').html('답글쓰기');
	
	$('#commentReply-submit').attr('onclick', 'commentWrite()');
	$('#commentReply-submit').attr('id', 'comment-submit');
	$('input[name=commentsGroupNo]').val('');
	$('#comment-area').next().prop('name', '');
}

//댓글 답글쓰기 폼 함수
function commentReply(element) {
	var commentsNo = $(element).next().val();
	
	if($('.session-userId').val().length > 1) {
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
			$('#commentReply-submit').attr('onclick', 'commentReplyWrite()');
			$('#comment-area').next().prop('name', 'commentsGroupNo');
			$('input[name=commentsGroupNo]').val(commentsNo);
		}
	} else {
		$('#confirmModalBody').html('답글은 로그인 해야만 이용가능합니다.<br> 로그인하시겠습니까?');
		$('#confirmOk').attr('onclick', 'location.href=\"' + contextPath + '/main/member/memberLogin\"');
		$('#confirmModalBtn').trigger('click');	
	}
}

//댓글쓰기 처리함수
function commentWrite() {
	if($('#comment-area').val().length < 1) {
		$('#alertModalBody').html('내용을 입력해주세요');		
		$('#alertModalBtn').trigger('click');
		$('#comment-area').focus();
		return false;
	}
	
	$.ajax({
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
	});
}

//댓글 답글쓰기 처리 함수
function commentReplyWrite() {
	if($('#comment-area').val().length < 1) {
		$('#alertModalBody').html('내용을 입력해주세요');		
		$('#alertModalBtn').trigger('click');
		$('#comment-area').focus();
		return false;
	}
	
	$.ajax({
		url:contextPath + "/comments/commentsReply",
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
}

//댓글 수정처리 함수
function commentWriteEdit() {
	if($('#comment-area').val().length < 1) {
		$('#alertModalBody').html('내용을 입력해주세요');		
		$('#alertModalBtn').trigger('click');
		$('#comment-area').focus();
		return false;
	}
	
	$.ajax({
		url:contextPath + "/comments/commentsWriteEdit",
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
	})
}

//댓글수정함수
function commentEdit(element) {
	$('.comment-item').each(function() {
		$(this).removeClass('commentReply');
		$(this).find('.comment-reply').html('답글쓰기');
	});
	
	var commentBody = $(element).parents('.commentEditOrDel').next().html();
	
	$(element).parents('.commentEditOrDel').next().hide();
	$(element).parents('.commentEditOrDel').after($('form[name=commentFrm]'));
	$('#comment-submit').attr('onclick', 'commentWriteEdit()');
	$('.editDel').hide();
	$('.board-comment-user').hide();
	$('#comment-area').val(commentBody);
	$('#comment-area').next().attr('name', 'commentsNo');
	$('#comment-area').next().val($(element).parents('.commentEditOrDel').prev().find('input[name=commentsNo]').val());
	
	$(element).attr('onclick', 'commentEditCancel(this)');
	$(element).html('수정취소');
}

//댓글수정취소 함수
function commentEditCancel(element) {
	$('.commentList').after($('form[name=commentFrm]'));
	$(element).parents('.commentEditOrDel').next().show();
	$('.editDel').hide();
	$('.board-comment-user').show();
	$('#comment-area').val('');
	$(element).html('수정');
}

//댓글삭제처리 모달함수
function commentDelModal(commentsNo, commentsStep, commentsGroupNo, boardNo) {
	$('#confirmModalBody').html('정말로 삭제하시겠습니까?');
	$('#confirmOk').attr('onclick', 'commentDel(' + commentsNo + ',' + commentsStep + ',' + commentsGroupNo + ',' + boardNo + ');');
	$('#confirmModalBtn').trigger('click');	
}

//댓글삭제함수
function commentDel(commentsNo, commentsStep, commentsGroupNo, boardNo) {	
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

/*글쓰기 첨부파일 함수*/

var fileIndex = 0;

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
        $('#alertModalBody').html('20MB 이하의 파일로 업로드해 주세요.');		
		$('#alertModalBtn').trigger('click');
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
	        
            <label><i class="bi bi-folder-plus"></i>` +
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
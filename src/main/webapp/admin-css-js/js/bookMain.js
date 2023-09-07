/**
 * book관련 main페이지 js파일
 */

/*bookMain.jsp의 사진 슬라이드 부분*/
$(function(){
	
	$(window).scroll(function(){
		var sc = $(this).scrollTop();
		
		if( sc >= 500){
			$('.sideBarBestBook').css({position:'fixed', top:200,})
			if(sc>=1700)
				$('.sideBarBestBook').css({position:'relative',top:-673, left:1740})
		}else{
			$('.sideBarBestBook').css({position:'absolute', top:700,})
		} 
		
		if( sc >= 600){
			$('.sideBarBestBook3').css({position:'fixed', top:200,})
			if(sc>=1400)
				$('.sideBarBestBook3').css({position:'relative',top:-735, left:1740})
		}else{
			$('.sideBarBestBook3').css({position:'absolute', top:825,})
		} 
	});
	
	function slideImg(){
		$('.gallery').animate({left:'-100%'},1000,function(){
			$('.gallery li:first').appendTo('.gallery');
			$('.gallery').css({left:'0%'});
		});
	}
	setInterval(slideImg,3000);
	
});
/**/

/*bookDetail.jsp*/
$(function(){

	$(window).scroll(function(){
		var sc = $(this).scrollTop();
		
		
		if( sc >= $('#detail').offset().top){
			$("#q").show();
			$('#detail_ul').hide();
		}
		
		if( sc >= $('#notice').offset().top - 5 ){
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(0), #q .tab_menu ul li:eq(2)").addClass('off');
			$("#q .tab_menu ul li:eq(1)").addClass('on');
			$('#notice_ul').hide();
		} else{
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(1), #q .tab_menu ul li:eq(2)").addClass('off');
			$("#q .tab_menu ul li:eq(0)").addClass('on');
			$('#notice_ul').show();
			$('#rule_ul').show();
		}
		
		if( sc >= $('#rule').offset().top - 5 ){
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(0), #q .tab_menu ul li:eq(1)").addClass('off');
			$("#q .tab_menu ul li:eq(2)").addClass('on');
			$('#rule_ul').hide();
		}else {
			$('#rule_ul').show();
		}
		if( sc < $('#detail').offset().top ){
			$("#q").hide();
			$('#detail_ul').show();
			$('#notice_ul').show();
			$('#rule_ul').show();
		}
	});
});
/**/

/*bookList1.jsp*/
$(function(){
	 if($("#frmPageCategory").val() == '검사자료'){
			$("#sbl1 a").css("background-color","silver");
		}
		if($("#frmPageCategory").val() == '도서'){
			$("#sbl2 a").css("background-color","silver");
		}
	    if($("#frmPageCategory").val() == '기타'){
	    	$("#sbl3 a").css("background-color","silver");
	    }
});
/**/
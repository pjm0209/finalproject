/**
 * book관련 main페이지 js파일
 */

/*bookMain.jsp의 사진 슬라이드 부분*/
$(function(){
	
	$(window).scroll(function(){
		var sc = $(this).scrollTop();
		
		if( sc > 500){
			$('.sideBarBestBook').css({position:'fixed', top:200,})
		} else{
			$('.sideBarBestBook').css({position:'absolute', top:760,})
		} 
	});
	
	function slideImg(){
		$('.gallery').animate({left:'-100%'},1500,function(){
			$('.gallery li:first').appendTo('.gallery');
			$('.gallery').css({left:'0%'});
		});
		
		
	}
	setInterval(slideImg,5000);
	
});
/**/

/*bookDetail.jsp의 사진 슬라이드 부분*/
$(function(){

	$(window).scroll(function(){
		var sc = $(this).scrollTop();
		
		
		if( sc >= $('#detail').offset().top ){
			$("#q").show();
		}
		if( sc >= $('#notice').offset().top -5 ){
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(0), #q .tab_menu ul li:eq(2)").addClass('off');
			$("#q .tab_menu ul li:eq(1)").addClass('on');
		} else{
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(1), #q .tab_menu ul li:eq(2)").addClass('off');
			$("#q .tab_menu ul li:eq(0)").addClass('on');
		}
		if( sc >= $('#rule').offset().top - 5 ){
			$("#q .tab_menu ul li").removeClass();
			$("#q .tab_menu ul li:eq(0), #q .tab_menu ul li:eq(1)").addClass('off');
			$("#q .tab_menu ul li:eq(2)").addClass('on');
		}
		if( sc < $('#detail').offset().top ){
			$("#q").hide();
		}
	});
});
/**/

/*bookList1.jsp*/
/*$(function(){
	function slideImg(){
		$('.gallery').animate({left:'-100%'},1500,function(){
			$('.gallery li:first').appendTo('.gallery');
			$('.gallery').css({left:'0%'});
		});
	}
	setInterval(slideImg,10000);
});*/
/**/
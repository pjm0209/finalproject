/**
 * calendar.js
 */
function openModal(info) {
	 
	$('#calendar a').attr("href", "#ex1");
	$('#calendar a').attr("rel", "modal:open");
	/*$('#calendar a').parent().parent().click(function(event){
		$(this).modal();
	});*/
}

$(function(){
	if($(".fc-button-primary").attr("aria-pressed") == "true") {
   		$(".fc-button-primary").css("background", "#ff9800");
   		$(".fc-button-primary").css("border-color", "#ff9800");
   		$(".fc-button-primary").css({"background": "#ff9800", "border-color": "ff9800"});
	}
});

/*
$.setDate = function(date) {
	//endDay 기준으로 7일을 빼거나 1개월이나 3개월을 빼서 startDay에 셋팅
	//var d = new Date(년, 월, 일);
	//endDay를 Date형식으로 변환
	//endDay(String)를 Date형식으로 변환
	var str = date.split('-');

	$('#startDay').val($.findDate(d));

}

$.findDate = function(date) {
	return date.getFullYear()
		+ "-" + $.formatDate((date.getMonth() + 1)) + "-" + $.formatDate(date.getDate());
}
$.formatDate = function(d) {
	//(date.getMonth()+1) : 월
	//date.getDate() : 일
	if (d < 10) { // 10월 미만, 10일 미만
		d = "0" + d;
	}

	return d;
}

$.formatDate2 = function(date) {
	return date.getFullYear() + "-"
			+ ( (date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1) )
			+ "-" + ( date.getDate() < 10 ? "0" + date.getDate() : date.getDate());
}*/








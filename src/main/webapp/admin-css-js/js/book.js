$(function() {

	$('#delBtn').click(function() {
		var cnt = $("table input[type='checkbox']:checked").length;

		//유효성 검사
		if (cnt < 1) {
			alert("삭제할 상품을 선택해주세요.");
			return false;
		} else {
			/* $('form[name=frmList]').prop('action', "<c:url value='/admin/product/deleteMulti'/>"); */
			if (confirm("삭제할까요?, " + cnt)) {
				$('form[name=frmList]').submit();
			}
		}
	});

	$('#bookDeleteBtn').click(function() {
		var cnt = $("table input[type='checkbox']:checked").length;

		//유효성 검사
		if (cnt < 1) {
			alert("삭제할 상품을 선택해주세요.");
			return false;
		} else {
			/* $('form[name=frmList]').prop('action', "<c:url value='/admin/product/deleteMulti'/>"); */
			if ($('#check-All').is(':checked')) {
				cnt = cnt - 1;
			}
			if (confirm("삭제할까요?, " + cnt)) {
				$('form[name=frmList]').submit();
			}
		}
	});


	var chkAll = $('#check-All');
	var checkBox = $('tbody input[type=checkbox]');

	chkAll.click(function() {
		checkBox.prop('checked', this.checked);
	});

	checkBox.click(function() {
		var perSrch = $(".table input[type='checkbox']").length - 1;
		console.log(perSrch);

		if ($("tbody input[type='checkbox']:checked").length == perSrch) {
			chkAll.prop('checked', true);
		} else {
			chkAll.prop('checked', false);
		}
	});

	$("#btEventMulti").click(function() {
		var cnt = $("table input[type='checkbox']:checked").length;
		if (cnt < 1) {
			alert("상품을 선택해주세요.");
			return false;
		} else if ($("select[name='eventSel']").val() == "") {
			alert("이벤트 이름을 선택해주세요.");
			$("select[name='eventSel']").focus();
			return false;
		} else {
			$('form[name=frmList]').prop('action', "<c:url value='/admin/product/eventMulti'/>");
			if (confirm($("select[name='eventSel'] option:selected").text() + " 상품을 등록할까요?, " + cnt)) {
				$('form[name=frmList]').submit();
			}
		}
	});
});



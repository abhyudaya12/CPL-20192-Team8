<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="format-detection" content="telephone=no">
	<title>M CALL</title>


	<script>

		$(document).ready(function () {

			// IE9 이하 버전 업그레이드 경고창
			if ($.browser.msie == true && $.browser.version <= 9) {
				alert('IE10 버전 이상으로 업데이트해주세요.');
			}

		});

		// 특정영역인쇄[공통]
		function AREA_PRINT(selector) {
			$(selector).printThis({
				debug: false,               // show the iframe for debugging
				importCSS: true,            // import page CSS
				importStyle: false,         // import style tags
				printContainer: true,       // grab outer container as well as the contents of the selector
				loadCSS: ["/css/common.css", "/css/mcall.css"],  // path to additional css file - use an array [] for multiple
				pageTitle: "",              // add title to print page
				removeInline: false,        // remove all inline styles from print elements
				printDelay: 333,            // variable print delay; depending on complexity a higher value may be necessary
				header: null,               // prefix to html
				footer: null,               // postfix to html
				base: false,               // preserve the BASE tag, or accept a string for the URL
				formValues: true,           // preserve input/form values
				canvas: false,              // copy canvas elements (experimental)
				doctypeString: "...",       // enter a different doctype for older markup
				removeScripts: false        // remove script tags from print content
			});
		}

		$(document).ready(function () {
			// 달력 플러그인
			$('#cal_1').datepicker({
				changeYear: false,
				changeMonth: false,
				minDate: '<?=date("Y-m-d")?>',
				maxDate: '<?=date("Y-m-d", strtotime("36 month"))?>',
				numberOfMonths: 1,
				showOn: "button",
				buttonImage: "/images/icon_calendar.png",
				buttonImageOnly: true
			});
			$('#cal_2').datepicker({
				changeYear: false,
				changeMonth: false,
				minDate: '<?=date("Y-m-d", strtotime("-36 month"))?>',
				maxDate: '<?=date("Y-m-d")?>',
				numberOfMonths: 1,
				showOn: "button",
				buttonImage: "/images/icon_calendar.png",
				buttonImageOnly: true
			});

			// 리스트 드롭다운 버튼
			$(".item_in_phone_tp").click(function () {
				$(".sel_in_phone_tp").toggle();
			});

			$('.th_sel').css({ display: 'none' });
			// 리스트 드롭다운 버튼
		});

		// 검색
		function doSearch(type, value) {
			if (type == 'A.IN_PHONE_TP') {		//리스트 상태 검색
				$('#search_list1').val(value);
			}

			$('#frmSearch').submit();
		}

		// 정렬
		function doOrder(cont) {
			var order_asc = $('#order_asc').val();
			var order_cont = $('#order_cont').val();

			if (cont == order_cont) {
				if (order_asc == 'DESC') order_asc = 'ASC';
				else if (order_asc == 'ASC') order_asc = 'DESC';
			}
			else {
				order_asc = 'DESC';
			}

			$('#order_cont').val(cont);
			$('#order_asc').val(order_asc);
			$('#frmSearch').submit();
		}

		// 엔터키이벤트
		function doEnter() {
			if (event.keyCode == 13) {
				doSearch();
			}
		}

		// 체크박스[전체체크]
		function doChkall() {
			if ($('#chkall').is(':checked') == true) {
				$('input[name="chkitem"]').attr('checked', true);
			}
			else {
				$('input[name="chkitem"]').attr('checked', false);
			}
		}

		// 인쇄
		function doPrint() {
			AREA_PRINT(".content");
		}

		// 엑셀저장
		function doExcel() {
			alert("준비중입니다");
			//location.href = "record_excel.php?<?=$gStr?>";
		}

		// 보유처이동 팝업열기
		function showHaveMovePopup() {
			if ($('input[name="chkitem"]').is(':checked') == '') { alert("체크박스를 체크해 주세요"); return false; }

			var arrChk = new Array();
			$('input[name="chkitem"]:checked').each(function () {
				arrChk.push($(this).val());
			});

			$('#seq').val(arrChk);

			var url = "stock_have_move_ajax.php";
			var param = $('#frmProc').serialize();

			$.ajax({
				type: "POST",
				dataType: 'html',
				url: url,
				data: param,
				async: false,
				success: function (obj) {
					//console.log(obj.data);
					$('#have_move_ajax').html(obj);
					OPEN_LAYER_POPUP('#pop_stock_stock_have_move');
				},
				error: function (request, status, error) {
					alert('Find Error -> ' + status);
					return false;
					//console.log(request);
					//console.log(status);
					//console.log(error);
				}
			});
		}

		// 보유처이동 팝업닫기
		function hideHaveMovePopup() {
			CLOSE_LAYER_POPUP('#pop_stock_stock_have_move');
		}

		// 재고수정 팝업열기
		function showGoodsModifyPopup() {
			var cnt = 0;
			$('input[name="chkitem"]:checked').each(function () {
				cnt++;
			});

			if (cnt != 1) { alert("재고수정은 하나만 가능합니다.\n하나의 체크박스를 선택해 주세요"); return false; }

			$('#seq').val($('input[name="chkitem"]:checked').val());

			var url = "stock_goods_modify_ajax.php";
			var param = $('#frmProc').serialize();

			$.ajax({
				type: "POST",
				dataType: 'html',
				url: url,
				data: param,
				async: false,
				success: function (obj) {
					//console.log(obj.data);
					$('#goods_modify_ajax').html(obj);
					OPEN_LAYER_POPUP('#pop_stock_stock_goods_modify');
				},
				error: function (request, status, error) {
					alert('Find Error -> ' + status);
					return false;
					//console.log(request);
					//console.log(status);
					//console.log(error);
				}
			});
		}

		// 재고수정팝업 저장
		function doSaveModify() {
			if ($('#goods_proc_tp').val() == 'GD_OT' || $('#goods_proc_tp').val() == 'GD_RT') { alert("출고, 반품상태인 재고는 수정이 불가능합니다"); return false; }
			if ($('#goods_phone_seq').val() == '' || $('#modify_color').val() == '') { alert("모델 및 색상정보를 입력해 주세요"); return false; }

			$('input[name="pageaction"]').val('modify');

			var url = "stock_proc.php";
			var param = $('#frmModify').serialize();

			$.ajax({
				type: "POST",
				dataType: 'json',
				url: url,
				data: param,
				async: false,
				success: function (obj) {
					//console.log(obj);
					alert(obj.msg);
					if (obj.msg) location.reload();
				},
				error: function (request, status, error) {
					alert('Find Error -> ' + status);
					return false;
					//console.log(request);
					//console.log(status);
					//console.log(error);
				}
			});
		}

		// 재고수정 팝업닫기
		function hideGoodsModifyPopup() {
			CLOSE_LAYER_POPUP('#pop_stock_stock_goods_modify');
		}

		// 이력 팝업열기
		function showGoodsHistoryPopup() {
			if ($('input[name="chkitem"]').is(':checked') == '') { alert("체크박스를 체크해 주세요"); return false; }

			var arrChk = new Array();
			$('input[name="chkitem"]:checked').each(function () {
				arrChk.push($(this).val());
			});

			$('#seq').val(arrChk);

			var url = "stock_goods_history_ajax.php";
			var param = $('#frmProc').serialize();

			$.ajax({
				type: "POST",
				dataType: 'html',
				url: url,
				data: param,
				async: false,
				success: function (obj) {
					//console.log(obj.data);
					$('#goods_history_ajax').html(obj);
					OPEN_LAYER_POPUP('#pop_stock_stock_history');
				},
				error: function (request, status, error) {
					alert('Find Error -> ' + status);
					return false;
					//console.log(request);
					//console.log(status);
					//console.log(error);
				}
			});
		}

		// 이력 팝업닫기
		function hideGoodsHistoryPopup() {
			CLOSE_LAYER_POPUP('#pop_stock_stock_history');
		}

		// 삭제
		function doDeleteGoods() {
			if ($('input[name="chkitem"]').is(':checked') == '') { alert("체크박스를 체크해 주세요"); return false; }

			if (confirm("선택한 항목을 삭제하시겠습니까?")) {
				var arrChk = new Array();
				$('input[name="chkitem"]:checked').each(function () {
					arrChk.push($(this).val());
				});

				$('input[name="pageaction"]').val('delete');
				$('#seq').val(arrChk);

				var url = "stock_proc.php";
				var param = $('#frmProc').serialize();

				$.ajax({
					type: "POST",
					dataType: 'json',
					url: url,
					data: param,
					async: false,
					success: function (obj) {
						//console.log(obj.data);
						alert(obj.msg);
						if (obj.msg) location.reload();
					},
					error: function (request, status, error) {
						alert('Find Error -> ' + status);
						return false;
						//console.log(request);
						//console.log(status);
						//console.log(error);
					}
				});
			}
		}

		// 출고 입력
		function enterInput(serial_no) {
			OPEN_LAYER_POPUP('#pop_stock_enter_input');
			$('#detail_serial_no').val(serial_no);

			//getDetailList();
		}//

		function enterUsimInput(serial_no) {
			OPEN_LAYER_POPUP('#pop_stock_enter_Usiminput');
			$('#detail_serial_no').val(serial_no);

			//getDetailList();
		}
		
		// 상세팝업 일련번호 검색
		function getDetailList() {
			if ($('#detail_serial_no').val() == '') { alert("일련번호를 입력해 주세요"); return false; }

			//var url = "out_input_ajax";
			var param = {
				serial_no: $('#detail_serial_no').val()
			};

			$.ajax({
				type: "POST",
				dataType: 'json',
				url: url,
				data: param,
				async: false,
				success: function (obj) {
					//console.log(obj.data);
					var data = obj.data;

					$('#detail_sch_result em').html(data.length);

					var strHtml = "";
					for (var i = 0; i < data.length; i++) {
						strHtml += "<li><a href=\"javascript:getDetailInfo('" + data[i].SEQ + "');\"><span>" + data[i].SERIAL_NO + "</span> (" + data[i].MODEL + ")</a></li>";
					}

					$('#detail_sch_result ul').html(strHtml);
				},
				error: function (request, status, error) {
					alert('Find Error -> ' + status);
					return false;
					//console.log(request);
					//console.log(status);
					//console.log(error);
				}
			});
		}

		// 상세팝업 상세정보 검색
		function getDetailInfo(seq) {
			var url = "stock_detail_info_ajax.php";
			var param = {
				seq: seq
			};

			$.ajax({
				type: "POST",
				dataType: 'html',
				url: url,
				data: param,
				async: false,
				success: function (obj) {
					console.log(obj);
					$('#detail_info').html(obj);
				},
				error: function (request, status, error) {
					alert('Find Error -> ' + status);
					return false;
					//console.log(request);
					//console.log(status);
					//console.log(error);
				}
			});
		}

		// 일련번호클릭시 상세팝업 닫기
		function hideDetailPopup() {
			CLOSE_LAYER_POPUP('#pop_stock_enter_input');
			$('#detail_info').html('');
		}
		function hideDetailUPopup() {
			CLOSE_LAYER_POPUP('#pop_stock_enter_Usiminput');
			$('#detail_info').html('');
		}
	</script>

	<!--[if lt IE 9]>
<script type="text/javascript" src="/js/html5.js"></script>
<![endif]-->

	<!--[if lt IE 8]>
<style type="text/css">
#ie67{display:block !important}
</style>
<![endif]-->

</head>
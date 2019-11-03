<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no">
<title>M CALL</title>
<link rel="stylesheet" href="/resources/css/jquery-ui-1.10.3.css">
<link rel="stylesheet" href="/resources/css/font.css">
<link rel="stylesheet" href="/resources/css/common.css?<?=$strRenew?>">
<link rel="stylesheet" href="/resources/css/mcall.css?<?=$strRenew?>">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.animate.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-1.10.3.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-datepicker-ko.js"></script>
<script type="text/javascript" src="/resources/js/jquery.bpopup.js"></script>
<script type="text/javascript" src="/resources/js/printThis.js"></script>
<script type="text/javascript" src="/resources/js/global.js?<?=$strRenew?>"></script>
<script>
	//h.tml
	$(document).ready(function(){

		// IE9 이하 버전 업그레이드 경고창
		if( $.browser.msie == true && $.browser.version <= 9){
			alert('IE10 버전 이상으로 업데이트해주세요.');
		}

	});

	// 특정영역인쇄[공통]
	function AREA_PRINT(selector){
		$(selector).printThis({
			debug: false,               // show the iframe for debugging
			importCSS: true,            // import page CSS
			importStyle: false,         // import style tags
			printContainer: true,       // grab outer container as well as the contents of the selector
			loadCSS: ["/css/common.css","/css/mcall.css"],  // path to additional css file - use an array [] for multiple
			pageTitle: "",              // add title to print page
			removeInline: false,        // remove all inline styles from print elements
			printDelay: 333,            // variable print delay; depending on complexity a higher value may be necessary
			header: null,               // prefix to html
			footer: null,               // postfix to html
			base: false ,               // preserve the BASE tag, or accept a string for the URL
			formValues: true,           // preserve input/form values
			canvas: false,              // copy canvas elements (experimental)
			doctypeString: "...",       // enter a different doctype for older markup
			removeScripts: false        // remove script tags from print content
		});
	}
	//h.html

	var YMD = GET_DATE_YMD();
	var S_SHOP_TP = '<?=$S_SHOP_TP?>';

	$(document).ready(function() {
		getCalendar(YMD);
		$('#div_'+ S_SHOP_TP).show();
	});

	/* 달력영역 */
	// 달력 불러오기
	function getCalendar(date){
		console.log(date);
		var year = date.substring(0, 4);
		var month = date.substring(4, 6);

		var url = "main_calendar_ajax.php";
		var param = {
			year: year
			, month: month
		};

		$.ajax({
			type:"POST",
			dataType : 'html',
			url: url,
			data: param,
			async: false,
			success: function(obj){
				//console.log(obj.data);
				$('.tb_mcal').remove();
				$('#year_month').html(year +'.'+ month);
				$('.m_cal').append(obj);
			},
			error: function(request, status, error){
				//alert('Find Error -> '+ status);
				return false;
				//console.log(request);
				//console.log(status);
				//console.log(error);
			}
		});
	}

	// 이전월 이동
	function goPrevMonth(){
		YMD = GET_MOVE_DATE(YMD, 'month', -1);
		getCalendar(YMD);
	}

	// 다음월 이동
	function goNextMonth(){
		YMD = GET_MOVE_DATE(YMD, 'month', 1);
		getCalendar(YMD);
	}
	/* 달력영역 */

	// 공지사항 상세이동
	function goNoticeDetail(board_seq){
		alert('준비중입니다');
		//location.href = "";
	}
</script>
</head>

<body>



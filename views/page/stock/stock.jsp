<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp"%>
<%@ include file="/common_inc/stock_func_inc.jsp"%>
<%@ include file="/common_inc/enter_func_inc.jsp"%>
<%@ include file="/common_inc/return_func_inc.jsp"%>
<%@ include file="/common_inc/out_func_inc.jsp"%>
<%@ include file="/common_inc/lose_func_inc.jsp"%>
<%@ page import="kr.co.mcall.main.controller.DBUtil"%>
<%@ page import="kr.co.mcall.stock.dao.stockDO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>

<%
	String company_type = null;

	company_type = (String) session.getAttribute("company_type");

	if (company_type == null) {
		out.println("<script>");
		out.println("alert('[경고] 로그인을 해야 접근 가능한 페이지입니다.')");
		out.println("location.href='/'");
		out.println("</script>");
	}
	// company_type = 1이면 대리점, 2면 판매점
%>

<body>
	<div id='wrap'>
		<div id='lnb'>
			<h1>
				<a href='/main'><img src='/images/common/logo.png' /></a>
			</h1>
			<h2>재고관리</h2>
			<ul class='sub'>

				<%
					if (company_type.equals("1")) {
				%>
				<li class='sel'><a href='/page/stock/stock'>재고 관리</a></li>
				<!-- 현재 페이지에서  메뉴 활성 -->
				<li class=''><a href='/page/stock/enter'>입고 관리</a></li>
				<li class=''><a href='/page/stock/out'>출고 관리</a></li>
				<li class=''><a href='/page/stock/lose'>분실 관리</a></li>
				<li class=''><a href='/page/stock/return'>반품 관리</a></li>

				<%
					}
				%>

				<%
					if (company_type.equals("2")) {
				%>
				<li class='sel'><a href='/page/stock/stock'>재고 관리</a></li>
				<!-- 현재 페이지에서  메뉴 활성 -->
				<!-- <li class=''><a href='/page/stock/enter'>입고 관리</a></li> <! 판매점은 입고 메뉴 없앰 -->
				<li class=''><a href='/page/stock/out'>출고 관리</a></li>
				<li class=''><a href='/page/stock/lose'>분실 관리</a></li>
				<li class=''><a href='/page/stock/return'>반품 관리</a></li>

				<%
					}
				%>

			</ul>
		</div>

		<div id='contain'>

			<!-- menu GNB -->

			<!-- 상단메뉴 [START] -->
			<%@ include file="/common_inc/top_menu_inc.jsp"%>
			<!-- 상단메뉴 [END] -->

			<!--// menu GNB -->

			<!-- 전체 100% CONTENTS -->
			<div id='content_wrap'>
				<!-- 100%의 전체 컨텐츠 영역-->

				<!-- 가입신청 현황 -->
				<script>
					$(document).ready(function() {
						getNowDatetime();
						setInterval("getNowDatetime()", 1000);
					});

					function getNowDatetime() {
						var date = new Date();

						var month = date.getMonth() + 1;
						var day = date.getDate();
						var hour = date.getHours();
						var minute = date.getMinutes();
						var sec = date.getSeconds();

						var arrWeek = new Array('일', '월', '화', '수', '목', '금',
								'토');
						var week = date.getDay();

						$('.now_time').html(
								month + '월 ' + day + '일 (' + arrWeek[week]
										+ ') ' + hour + '시 ' + minute + '분 '
										+ sec + '초');
					}
				</script>

				<div class='now_bx'>
					<dl>
						<dt>
							<!-- ><?=date('Y-m')?> -->
							2019-11
						</dt>
						<dd>
							<ul>
								<li><span>입고 <em class='current_num m5'> <!-- <?=number_format($DS_GOODS_STAT['GD_IN'])?> -->0
									</em>
								</span> <span class='pl15'>단말기 <em class='current_num m5'>
											<!-- <?=number_format($DS_GOODS_STAT['PHONE'])?> -->5
									</em></span> <span class='pl15'>유심 <em class='current_num m5'>
											<!-- <?=number_format($DS_GOODS_STAT['USIM'])?> -->0
									</em></span> <span class='pl15'>개통 <em class='current_num m5'>
											<!-- <?=number_format($DS_GOODS_STAT['GD_OP'])?> -->0
									</em></span>
									<p class='now_time'>
										<!-- getNowDatetime() -->
									</p></li>
								<!--
<li>
<span class='pay'>퀵 잔액 : <em><?=number_format($DS_USER['AMT'])?>원</em></span>
<a href='/page/point/point.php' class='btn_charge'>충전하기</a>
<a href='/page/point/point_record.php' class='btn_his'>내역보기</a>
</li>
-->
							</ul>
						</dd>
					</dl>
				</div>
				<!--// 가입신청 현황 -->

				<!-- content -->
				<div class="content">
					<!-- 원하는 컨텐츠 넓이를 추가 w960 클래스는 width:960px란 의미 -->
					<h2>재고 관리</h2>

					<form method="get" name="frmSearch" id="frmSearch"
						action="/page/stock/stock.html">
						<input type="hidden" name="search_list1" id="search_list1"
							value=""> <input type="hidden" name="order_cont"
							id="order_cont" value="A.SEQ"> <input type="hidden"
							name="order_asc" id="order_asc" value="DESC">
						<div class="srch_bx">
							<input name="cal_1" id="cal_1" type="text"
								class="w100 hasDatepicker" value="2016-09-28" readonly=""><img
								class="ui-datepicker-trigger"
								src="/images/common/icon_calendar.png" alt="..." title="...">
							~ <input name="cal_2" id="cal_2" type="text"
								class="w100 hasDatepicker" value="2019-09-28" readonly=""><img
								class="ui-datepicker-trigger"
								src="/images/common/icon_calendar.png" alt="..." title="...">
							<select name="search_type" id="search_type">
								<option value="">항목</option>
								<option value="A.MODEL">모델명</option>
								<option value="A.SERIAL_NO">일련번호</option>
								<!--
<option value="A.COLOR" >색상</option>
<option value="A.IN_PLACE_NM" >입고처</option>
<option value="B.SHOP_NM" >보유처</option>
<option value="D.STAFF_NM" >처리자</option>
-->
							</select> <input name="search_text" id="search_text" type="text"
								class="w100" value="" onkeypress="javascript:doEnter();">
							<input type="button" name="btn_search" id="btn_search" value="조회"
								class="btn_01 w80" onclick="javascript:doSearch();">
						</div>
					</form>

					<p class="num_txt mt20">
						<span class="mr10"> <input type="button" value="보유처 이동"
							class="btn_t2 w90" onclick="javascript:showHaveMovePopup();">
							<input type="button" value="수정" class="btn_t w50"
							onclick="javascript:showGoodsModifyPopup();"> <input
							type="button" value="이력" class="btn_t w50"
							onclick="javascript:showGoodsHistoryPopup();"> <input
							type="button" value="삭제" class="btn_t w50"
							onclick="javascript:doDeleteGoods();">
						</span> <span>단말기 <em>5</em></span> <span class="pl10">유심 <em>0</em></span>
						<span class="pl10">기타 <em class="zero">0</em></span> <span
							class="fr"> <input type="button" value="인쇄"
							class="btn_print w70" onclick="javascript:doPrint();"> <input
							type="button" value="엑셀저장" class="btn_excel w90"
							onclick="javascript:doExcel();">
						</span>
					</p>


					<table class="tb_01 mt10" width="100%" cellspacing="0"
						cellpadding="0" border="0">
						<colgroup>
							<col width="3%">
							<col width="4%">
							<col width="6%">
							<col width="8%">
							<col width="5%">
							<col width="6%">
							<col width="8%">
							<col width="7%">
							<col width="6%">
							<col width="6%">
							<col width="6%">
							<col width="8%">
							<col width="6%">
							<col width="6%">
							<col width="9%">
						</colgroup>
						<tbody id="stock_table">
							<tr>
								<th scope="col"><input name="chkall" id="chkall"
									type="checkbox" value="" onclick="javascript:doChkall();"></th>
								<th scope="col">NO</th>
								<th scope="col">통신사</th>
								<th scope="col">입고일 <a
									href="javascript:doOrder('A.IN_DT');">▼</a></th>
								<th scope="col">일수 <a href="javascript:doOrder('DAYS');">▼</a></th>
								<th scope="col">입고유형 <a href="javascript:;"
									class="btn_arrow item_in_phone_tp"></a>
									<div class="sel_in_phone_tp th_sel" style="display: none;">
										<ul>
											<li><a href="javascript:doSearch('A.IN_PHONE_TP', '');">전체</a></li>
											<li><a
												href="javascript:doSearch('A.IN_PHONE_TP', 'IN_OK');">정상</a></li>
											<li><a
												href="javascript:doSearch('A.IN_PHONE_TP', 'IN_TR');">교품</a></li>
											<li><a
												href="javascript:doSearch('A.IN_PHONE_TP', 'IN_US');">중고</a></li>
											<li><a
												href="javascript:doSearch('A.IN_PHONE_TP', 'IN_RT');">회수</a></li>
											<li><a
												href="javascript:doSearch('A.IN_PHONE_TP', 'IN_ET');">기타</a></li>
										</ul>
									</div>
								</th>
								<th scope="col">모델명</th>
								<th scope="col">일련번호</th>
								<th scope="col">색상</th>
								<th scope="col">입고처</th>
								<th scope="col">보유처</th>
								<th scope="col">이동일 <a
									href="javascript:doOrder('A.MOVE_DT');">▼</a></th>
								<th scope="col">처리자</th>
								<th scope="col">이력</th>
								<th scope="col">메모</th>
								<th scope="col">QR코드</th>
							</tr>

							<!-- /////////// DB로부터 재고 정보를 불러오는 부분 ///////// -->
							<script type="text/javascript">
								stockShowing2();
							</script>
							<!-- /////////// DB로부터 재고 정보를 불러오는 부분 ///////// -->
						</tbody>
					</table>

					<!-- paging -->
					<div id="pagenate">
						<div class="page">
							<strong>1</strong>
						</div>
					</div>
					<!-- //paging -->

				</div>
				<!--// content -->

			</div>
			<!--// 전체 100% CONTENTS	 -->

		</div>
		<!--//contain-->

	</div>
	<!--//wrap-->

	<!-- popup -->

	<div id="pop_stock_stock_have_move" class="dialog-popup"
		style="width: 900px;">
		<div id='pop'>
			<div class='title'>
				<h2>보유처이동</h2>
				<a href="javascript:;" class='pop_close'
					onclick="javascript:hideHaveMovePopup();">닫기</a>
			</div>

			<br>
			<div class='row_bx'>
				<div class='sch_reslt' id="detail_sch_result">
					<p>총 N개</p>
					<br>
					<table border="1" style="border: 2px solid black;">
						<th>통신사</th>
						<th>모델명</th>
						<th>일련번호</th>
						<th>색상</th>
						<th>이력</th>
						<th>현 보유처</th>
					</table>
					<ul>
						<!-- ajax loading : getDetailList() -->
						<li>aaaa</li>
						<li>bbbb</li>
						<li>cccc</li>
						<li>dddd</li>
					</ul>
				</div>
				<br>
				<p style="border: 2px solid black;">
				<form style="float: right;">
					<select name="보유처 선택">
						<option value="1">A</option>
						<option value="2">B</option>
						<option value="3">C</option>
						<option value="3" selected>보유처 선택</option>
					</select> <input name="" type="button" value='이동' class='s_button w50'
						onclick="javascript:;" />
				</form>
				</p>

				<div class='row_02' id="detail_info">
					<!-- ajax loading : getDetailInfo() -->
				</div>

				<div id="have_move_ajax"></div>
			</div>
		</div>

		<div id="pop_stock_stock_goods_modify" class="dialog-popup"
			style="width: 600px;">
			<div id='pop'>
				<div class='title'>
					<h2>재고수정</h2>
					<a href="javascript:;" class='pop_close'
						onclick="javascript:hideGoodsModifyPopup();">닫기</a>
				</div>

				<br>
				<div class='row_bx'>
					<table class="tb_01 mt10" width="100%" cellspacing="0"
						cellpadding="0" border="2">
						<tbody id="stock_table">
							<tr>
								<td width="120" class="bg_blue"><b>입고일 </b></td>
								<td><input name="" style="margin-right: 260px" type="text"
									value="2019-11-27" onclick="javascript:;" /></td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>입고처</b></td>
								<td><select name="입고처" style="margin-right: 341px">
										<option value="1" selected>방배대리점</option>
										<option value="2">청담</option>
										<option value="3">핸드폰나라</option>
								</select></td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>보유처</b></td>
								<td><select name="보유처" style="margin-right: 342px">
										<option value="1" selected>비전만촌</option>
										<option value="2">판매나라</option>
										<option value="3">핸드폰나라</option>
								</select></td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>일련번호</b></td>
								<td><input name="" style="margin-right: 259px" type="text"
									value="752134" onclick="javascript:;" /></td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>모델명</b></td>
								<td><select name="모델명" style="margin-right: 341px">
										<option value="SM-N970" selected>SM-N970</option>
										<option value="SM-G973N">SM-G973N</option>
										<option value="A2160">A2160</option>
										<option value="A2111">A2111</option>
								</select></td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>색상</b></td>
								<td>블랙</td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>입고유형</b></td>
								<td><select name="정상" style="margin-right: 375px">
										<option value="교품" selected>교품</option>
										<option value="중고">중고</option>
										<option value="회수">회수</option>
								</select></td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>입고가</b></td>
								<td><select name="입고가">
										<option value="여신" selected>여신</option>
								</select> <input name="" style="margin-right: 405px type="
									text" value="0" onclick="javascript:;" />원</td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>이력</b></td>
								<td><input name="" style="margin-right: 260px" type="text"
									value="" onclick="javascript:;" /></td>
							</tr>
							<tr>
								<td width="120" class="bg_blue"><b>메모</b></td>
								<td><input name="" style="margin-right: 260px" type="text"
									value="" onclick="javascript:;" /></td>
							</tr>
						</tbody>
					</table>

					</p>

					<div class='row_02' id="detail_info">
						<!-- ajax loading : getDetailInfo() -->
					</div>

					<div id="goods_modify_ajax"></div>

					<div class='center mt20'>
						<input type='button' value='저장' class='btnp_01 w100'
							onclick="javascript:doSaveModify();" />
					</div>
				</div>
			</div>
		</div>

		<div id="pop_stock_stock_history" class="dialog-popup"
			style="width: 900px;">
			<div id='pop'>
				<div class='title'>
					<h2>이력 수정</h2>
					<a href="javascript:;" class='pop_close'
						onclick="javascript:hideGoodsHistoryPopup();">닫기</a>
				</div>

				<br>
				<div class='row_bx'>
					<div class='sch_reslt' id="detail_sch_result">
						<p>총 N개</p>
						<br>
						<table border="1" style="border: 2px solid black;">
							<th>통신사</th>
							<th>모델명</th>
							<th>일련번호</th>
							<th>색상</th>
							<th>이력</th>
							<th>현 보유처</th>
						</table>
						<ul>
							<!-- ajax loading : getDetailList() -->
							<li>aaaa</li>
							<li>bbbb</li>
							<li>cccc</li>
							<li>dddd</li>
						</ul>
					</div>
					<br>
					<p style="border: 2px solid black;">
					<form style="float: right;">
						<select name="이력 선택">
							<option value="1">A</option>
							<option value="2">B</option>
							<option value="3">C</option>
							<option value="4" selected>이력 선택</option>
						</select> <input name="" type="text" onclick="javascript:;" /> <input
							name="" type="button" value='저장' onclick="javascript:;" />
					</form>
					</p>

					<div class='row_02' id="detail_info">
						<!-- ajax loading : getDetailInfo() -->
					</div>

					<div id="goods_history_ajax"></div>
				</div>
			</div>
		</div>

		<div id="pop_stock_stock_detail" class="dialog-popup"
			style="width: 900px;">
			<div id='pop'>
				<div class='title'>
					<h2>상세보기</h2>
					<a href="javascript:;" class='pop_close'
						onclick="javascript:hideDetailPopup();">닫기</a>
				</div>

				<div class='row_bx'>
					<div class='row_01'>
						<div class='sch_reslt_bx'>
							<p>
								<input name="detail_serial_no" id="detail_serial_no" type="text"
									class='w70p' /> <input name="" type="button" value='검색'
									class='s_button w50' onclick="javascript:getDetailList();" />
							</p>
							<div class='sch_reslt' id="detail_sch_result">
								<p>검색결과</p>
								<ul id=stockPOPlist>

									<!--  <script type="text/javascript">
										getDetailList();
									</script>-->
									<li><b>SM-N970(갤럭시노트10)</b></li>

									<!-- ajax loading : getDetailList() -->

								</ul>
							</div>
						</div>
					</div>

					<div class='row_02' id="detail_info">
						<!-- ajax loading : getDetailInfo() -->
						<table class="tb_01 mt10" width="100%" cellspacing="0"
							cellpadding="0" border="0">
							<tbody id="detail_popup">
								<tr>
									<th scope="col">NO</th>
									<th scope="col">상태</th>
									<th scope="col">매장</th>
									<th scope="col">처리자</th>
									<th scope="col">시간</th>
									<th scope="col">메모</th>
								</tr>
								<script type="text/javascript">
									getDetailInfo();
								</script>
							</tbody>
						</table>	
					</div>
				</div>
			</div>
		</div>
		<div id="QR_CODE" class="dialog-popup" style="width: 256px;">
			<div id="gcDiv" style="height: 200%;"></div>
		</div>
		<!-- //popup -->

		<form method="post" name="frmProc" id="frmProc" action="">
			<input type="hidden" name="pageaction" id="pageaction" value="">
			<input type="hidden" name="seq" id="seq" value="">
		</form>
		
		
	<script>
   jQuery("#gcDiv").qrcode({   //qrcode 시작
        render : "table",      //table, canvas 형식 두 종류가 있다. 
        width : 256,            //넓이 조절
        height : 256,           //높이 조절
        text   : "http://naver.com/"     //QR코드에 실릴 문자열
    });
   
   $("#gcDiv > img").css({"margin":"auto"});
   </script>
   
   <script type="text/javascript">
   function QRCODE(){
      OPEN_LAYER_POPUP('#QR_CODE');
   }
   </script>
</body>
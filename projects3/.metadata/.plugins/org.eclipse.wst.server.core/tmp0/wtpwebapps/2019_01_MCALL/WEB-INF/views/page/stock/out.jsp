<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp" %>
<%@ include file="/common_inc/stock_func_inc.jsp" %>

<body>
	<div id='wrap'>
		<div id='lnb'>
			<h1><a href='/'><img src='/images/common/logo.png' /></a></h1>
			<h2>재고관리</h2>
			<ul class='sub'>
				<li class=''><a href='/page/stock/stock'>재고 관리</a></li> <!-- 현재 페이지에서  메뉴 활성 -->
				<li class=''><a href='/page/stock/enter'>입고 관리</a></li>
				<li class='sel'><a href='/page/stock/out'>출고 관리</a></li>
				<li class=''><a href='/page/stock/lose'>분실 관리</a></li>
				<li class=''><a href='/page/stock/return'>반품 관리</a></li>
			</ul>
		</div>

		<div id='contain'>

			<!-- menu GNB -->

			<!-- 상단메뉴 [START] -->
			<%@ include file="/common_inc/top_menu_inc.jsp" %>
			<!-- 상단메뉴 [END] -->

			<!--// menu GNB -->

			<!-- 전체 100% CONTENTS -->
			<div id='content_wrap'>
				<!-- 100%의 전체 컨텐츠 영역-->

				<!-- 가입신청 현황 -->
				<script>
					$(document).ready(function () {
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

						var arrWeek = new Array('일', '월', '화', '수', '목', '금', '토');
						var week = date.getDay();

						$('.now_time').html(month + '월 ' + day + '일 (' + arrWeek[week] + ') ' + hour + '시 ' + minute + '분 ' + sec + '초');
					}
				</script>

				<div class='now_bx'>
					<dl>
						<dt>
							<!-- ><?=date('Y-m')?> --> 2019-09</dt>
						<dd>
							<ul>
								<li>
									<span>입고 <em class='current_num m5'>
											<!-- <?=number_format($DS_GOODS_STAT['GD_IN'])?> -->0</em> </span>
									<span class='pl15'>단말기 <em class='current_num m5'>
											<!-- <?=number_format($DS_GOODS_STAT['PHONE'])?> -->0</em></span>
									<span class='pl15'>유심 <em class='current_num m5'>
											<!-- <?=number_format($DS_GOODS_STAT['USIM'])?> -->0</em></span>
									<span class='pl15'>개통 <em class='current_num m5'>
											<!-- <?=number_format($DS_GOODS_STAT['GD_OP'])?> -->0</em></span>
									<p class='now_time'>
										<!-- getNowDatetime() -->
									</p>
								</li>
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
					<h2>출고 관리</h2>

					<form method="get" name="frmSearch" id="frmSearch" action="/page/stock/stock.html">
						<input type="hidden" name="search_list1" id="search_list1" value="">
						<input type="hidden" name="order_cont" id="order_cont" value="A.SEQ">
						<input type="hidden" name="order_asc" id="order_asc" value="DESC">
						<div class="srch_bx">
							<input name="cal_1" id="cal_1" type="text" class="w100 hasDatepicker" value="2016-09-28"
								readonly=""><img class="ui-datepicker-trigger" src="/images/common/icon_calendar.png"
								alt="..." title="..."> ~ <input name="cal_2" id="cal_2" type="text"
								class="w100 hasDatepicker" value="2019-09-28" readonly=""><img
								class="ui-datepicker-trigger" src="/images/common/icon_calendar.png" alt="..."
								title="...">
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
							</select>
							<input name="search_text" id="search_text" type="text" class="w100" value=""
								onkeypress="javascript:doEnter();">
							<input type="button" name="btn_search" id="btn_search" value="조회" class="btn_01 w80"
								onclick="javascript:doSearch();">
						</div>
					</form>

					<p class="num_txt mt20">
						<span class="mr10">
							<input type="button" value="보유처 이동" class="btn_t2 w90"
								onclick="javascript:showHaveMovePopup();">
							<input type="button" value="수정" class="btn_t w50"
								onclick="javascript:showGoodsModifyPopup();">
							<input type="button" value="이력" class="btn_t w50"
								onclick="javascript:showGoodsHistoryPopup();">
							<input type="button" value="삭제" class="btn_t w50" onclick="javascript:doDeleteGoods();">
						</span>

						<span>단말기 <em>1</em></span>
						<span class="pl10">유심 <em>0</em></span>
						<span class="pl10">기타 <em class="zero">0</em></span>

						<span class="fr">
							<input type="button" value="인쇄" class="btn_print w70" onclick="javascript:doPrint();">
							<input type="button" value="엑셀저장" class="btn_excel w90" onclick="javascript:doExcel();">
						</span>
					</p>


					<table class="tb_01 mt10" width="100%" cellspacing="0" cellpadding="0" border="0">
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
						<tbody>
							<tr>
								<th scope="col"><input name="chkall" id="chkall" type="checkbox" value=""
										onclick="javascript:doChkall();"></th>
								<th scope="col">NO</th>
								<th scope="col">통신사</th>
								<th scope="col">입고일 <a href="javascript:doOrder('A.IN_DT');">▼</a></th>
								<th scope="col">일수 <a href="javascript:doOrder('DAYS');">▼</a></th>
								<th scope="col">
									입고유형 <a href="javascript:;" class="btn_arrow item_in_phone_tp"></a>
									<div class="sel_in_phone_tp th_sel" style="display: none;">
										<ul>
											<li><a href="javascript:doSearch('A.IN_PHONE_TP', '');">전체</a></li>
											<li><a href="javascript:doSearch('A.IN_PHONE_TP', 'IN_OK');">정상</a></li>
											<li><a href="javascript:doSearch('A.IN_PHONE_TP', 'IN_TR');">교품</a></li>
											<li><a href="javascript:doSearch('A.IN_PHONE_TP', 'IN_US');">중고</a></li>
											<li><a href="javascript:doSearch('A.IN_PHONE_TP', 'IN_RT');">회수</a></li>
											<li><a href="javascript:doSearch('A.IN_PHONE_TP', 'IN_ET');">기타</a></li>
										</ul>
									</div>
								</th>
								<th scope="col">모델명</th>
								<th scope="col">일련번호</th>
								<th scope="col">색상</th>
								<th scope="col">입고처</th>
								<th scope="col">보유처</th>
								<th scope="col">이동일 <a href="javascript:doOrder('A.MOVE_DT');">▼</a></th>
								<th scope="col">처리자</th>
								<th scope="col">이력</th>
								<th scope="col">메모</th>
							</tr>
							<tr>
								<td><input name="chkitem" id="chkitem_73" type="checkbox" value="73"></td>
								<td>1</td>
								<td><img src="/_upload/telecom/201707/b7afce9daabba7d6ba62f235d20611f32c413da2.png">
								</td>
								<td class="bg_blue">2019-09-04<br>19:04:39</td>
								<td>24</td>
								<td>정상</td>
								<td>SM-N971NK</td>
								<td><a href="javascript:;" onclick="javascript:showDetailPopup('1234567');">1234567</a>
								</td>
								<td>아우라 블랙</td>
								<td>비전팩토리</td>
								<td>방배텔레콤</td>
								<td>2019-09-04<br>19:04:39</td>
								<td>방배메인</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>

					<!-- paging -->
					<div id="pagenate">
						<div class="page"><strong>1</strong></div>
					</div> <!-- //paging -->

				</div>
				<!--// content -->

			</div>
			<!--// 전체 100% CONTENTS	 -->

		</div>
		<!--//contain-->

	</div>
	<!--//wrap-->

	<!-- popup -->
	<div id="pop_stock_stock_have_move" class="dialog-popup" style="width:900px;">
		<div id='pop'>
			<div class='title'>
				<h2>보유처이동</h2>
				<a href="javascript:;" class='pop_close' onclick="javascript:hideHaveMovePopup();">닫기</a>
			</div>

			<div id="have_move_ajax"></div>
		</div>
	</div>

	<div id="pop_stock_stock_goods_modify" class="dialog-popup" style="width:600px;">
		<div id='pop'>
			<div class='title'>
				<h2>재고수정</h2>
				<a href="javascript:;" class='pop_close' onclick="javascript:hideGoodsModifyPopup();">닫기</a>
			</div>

			<div id="goods_modify_ajax"></div>

			<div class='center mt20'>
				<input type='button' value='저장' class='btnp_01 w100' onclick="javascript:doSaveModify();" />
			</div>
		</div>
	</div>

	<div id="pop_stock_stock_history" class="dialog-popup" style="width:900px;">
		<div id='pop'>
			<div class='title'>
				<h2>이력</h2>
				<a href="javascript:;" class='pop_close' onclick="javascript:hideGoodsHistoryPopup();">닫기</a>
			</div>

			<div id="goods_history_ajax"></div>
		</div>
	</div>

	<div id="pop_stock_stock_detail" class="dialog-popup" style="width:900px;">
		<div id='pop'>
			<div class='title'>
				<h2>상세보기</h2>
				<a href="javascript:;" class='pop_close' onclick="javascript:hideDetailPopup();">닫기</a>
			</div>

			<div class='row_bx'>
				<div class='row_01'>
					<div class='sch_reslt_bx'>
						<p>
							<input name="detail_serial_no" id="detail_serial_no" type="text" class='w70p' />
							<input name="" type="button" value='검색' class='s_button w50'
								onclick="javascript:getDetailList();" />
						</p>
						<div class='sch_reslt' id="detail_sch_result">
							<p>검색결과 (<em>1</em>)</p>
							<ul>
								<!-- ajax loading : getDetailList() -->
							</ul>
						</div>
					</div>
				</div>

				<div class='row_02' id="detail_info">
					<!-- ajax loading : getDetailInfo() -->
				</div>
			</div>
		</div>
	</div>
	<!-- //popup -->

	<form method="post" name="frmProc" id="frmProc" action="">
		<input type="hidden" name="pageaction" id="pageaction" value="">
		<input type="hidden" name="seq" id="seq" value="">
	</form>
</body>
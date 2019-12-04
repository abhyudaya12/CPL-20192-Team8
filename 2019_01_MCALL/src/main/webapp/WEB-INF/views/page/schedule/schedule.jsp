<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp" %>

<div id='wrap'>
	<div id='lnb'>
		<h1><a href='/'><img src='/images/common/logo.png' /></a></h1>
		<h2>퀵 서비스</h2>
		<ul class='sub'>

			<!-- if($DS_USER['SHOP_TP'] == 'SH_AG') -->
			<li class='sel'><a href='/page/schedule/schedule'>일정관리</a></li>
			<li class=''><a href='/page/schedule/A'>예약관리</a></li>	
			<li class=''><a href='/page/schedule/B'>캘린더</a></li>
			
		</ul>
	</div>

	<div id='contain'>

		<!-- 상단메뉴 [START] -->
		<%@ include file="/common_inc/top_menu_inc.jsp" %>
		<!-- 상단메뉴 [END] -->

		<div id='content_wrap'>
			<!-- 100%의 전체 컨텐츠 영역-->
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

			<div class='content'>
				<!-- 원하는 컨텐츠 넓이를 추가 w960 클래스는 width:960px란 의미 -->
				<h2>퀵 요청하기</h2>

				<ul class='tab_01 mt20'>
					<li class="viewAddArea sel" data-type="direct"><a href='javascript:;'>직접 입력</a></li>
					<li class="viewAddArea" data-type="recent"><a href='javascript:;'>최근 요청</a></li>
				</ul>

				<!-- 직접입력 -->
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class='tb_01_non mt20' id="table_direct">
					<colgroup>
						<col width='10%' />
						<col width='15%' />
						<col width='15%' />
						<col width='10%' />
						<col width='15%' />
						<col width='15%' />
						<col width='20%' />
					</colgroup>
					<tr>
						<th scope="col">통신사</th>
						<th scope="col">모델명</th>
						<th scope="col">색상</th>
						<th scope="col">유심필요</th>
						<th scope="col">비고</th>
						<th scope="col">출발지 선택 </th>
						<th scope="col">출발지 정보</th>
					</tr>
					<tr>
						<td>
							<input name='rc_telecom' id='rc_telecom_SKT' type='radio' value='1'
								onclick='javascript:selTelecom();'
								data-icon='/_upload/telecom/201707/83b0719b855216e218d0bbfb6862f4737fd708cb.png' />
							SKT<span class='ml5'>
								<input name='rc_telecom' id='rc_telecom_KT' type='radio' value='2'
									onclick='javascript:selTelecom();'
									data-icon='/_upload/telecom/201707/b7afce9daabba7d6ba62f235d20611f32c413da2.png' />
								KT</span><span class='ml5'>
								<input name='rc_telecom' id='rc_telecom_LGT' type='radio' value='3'
									onclick='javascript:selTelecom();'
									data-icon='/_upload/telecom/201708/cb55fe5a549bf4275123c067f9563746221e1ff9.png' />
								LGT</span>
						</td>
						<td>
							<div class='bx1'>
								<input name="model" id="model" type="text"
									onkeyup="javascript:doAutoCompleteModel();" />
								<ul id="autocomplete" class="bx_area1">
									<!-- ajax : doAutoCompleteModel()
<li><a href="#">회사명</a></li>
<li><a href="#">케이스업체</a></li>
<li><a href="#">보호필름업체</a></li>
-->
								</ul>
							</div>
						</td>
						<td>
							<select name="color" id="color" class='w90p' onchange="javascript:getStartShop();">
								<option value="">선택하세요</option>
							</select>
						</td>
						<td>
							<input name="usim_yn" name="usim_y" type="radio" value="Y" checked /> 유
							<span class='ml5'><input name="usim_yn" name="usim_n" type="radio" value="N" /> 무</span>
						</td>
						<td>
							<input name="etc" id="etc" type="text" class='w90p' />
						</td>
						<td>
							<select name="start_shop" id="start_shop" class='w90p' onchange="javascript:selShopInfo();">
								<option value="">선택하세요</option>
							</select>
						</td>
						<td id="start_info_td"></td>
					</tr>
					<input type="hidden" name="phone_seq" id="phone_seq" value="">
					<input type="hidden" name="start" id="start" value="">
					<input type="hidden" name="start_hp" id="start_hp" value="">
					<input type="hidden" name="start_post_no" id="start_post_no" value="">
					<input type="hidden" name="start_addr" id="start_addr" value="">
					<input type="hidden" name="start_addr_detail" id="start_addr_detail" value="">
				</table>

				<!-- 최근요청 -->
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class='tb_01_non mt20' id="table_recent"
					style="display:none;">
					<colgroup>
						<col width='5%' />
						<col width='10%' />
						<col width='15%' />
						<col width='10%' />
						<col width='10%' />
						<col width='15%' />
						<col width='15%' />
						<col width='20%' />
					</colgroup>
					<tr>
						<th scope="col">&nbsp;</th>
						<th scope="col">통신사</th>
						<th scope="col">모델명</th>
						<th scope="col">색상</th>
						<th scope="col">유심필요</th>
						<th scope="col">비고</th>
						<th scope="col">출발지</th>
						<th scope="col">출발지 정보</th>
					</tr>

				</table>
				<div class='center mt20'><input name="btnAdd" type="button" value='추가' class='btn_01 w200'
						onclick="javascript:addGoods();" /></div>

				<div class='num_txt mt30'>요청개수 <em>0</em></div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class='tb_01 mt10' id="main_table">
					<colgroup>
						<col width='10%' />
						<col width='18%' />
						<col width='18%' />
						<col width='10%' />
						<col width='18%' />
						<col width='16%' />
						<col width='10%' />
					</colgroup>
					<tr>
						<th scope="col">통신사</th>
						<th scope="col">모델명</th>
						<th scope="col">색상</th>
						<th scope="col">유심필요</th>
						<th scope="col">비고</th>
						<th scope="col">출발지</th>
						<th scope="col">취소</th>
					</tr>
					<!-- ajax loading: addGoods() -->
				</table>

				<div class='mt20'>
					<select name="finish_shop_seq" id="finish_shop_seq" class='w10p'
						onchange="javascript:selFinishInfo();">
						<option value="">도착지 선택</option>
					</select>
					<input name="end_hp" id="end_hp" type="text" placeholder='도착지 이동번호' class='w30p' readonly
						maxlength="15" />
					<input name="end_info" id="end_info" type="text" placeholder='도착지 주소' class='w58p' readonly />
					<input name="end" id="end" type="hidden" />
					<input name="end_post_no" id="end_post_no" type="hidden" />
					<input name="end_addr" id="end_addr" type="hidden" />
					<input name="end_addr_detail" id="end_addr_detail" type="hidden" />
				</div>

				<div class='memo_bx mt20 center'>
					<span>메모</span>
					<input name="memo" id="memo" type="text" class='w50p mr10' value="" />
					<input name="pay_tp" id="pay_tp_ls" type="radio" value="QC_LS" data-str="착불" /> 착불 <span
						class='m30'><input name="pay_tp" id="pay_tp_fs" type="radio" value="QC_FS" data-str="차감"
							checked />
						차감</span>
					<input name="" type="button" value='퀵요청' class='btn_02 w80 ml10'
						onclick="javascript:openReqPopup();" />
				</div>

			</div>
			<!--// content -->

		</div>
		<!--// 전체 100% CONTENTS	 -->

	</div>
	<!--//contain-->

</div>
<!--//wrap-->


<!-- popup -->
<div id="pop_quick_stock_request" class="dialog-popup" style="width:900px;">
	<div id='pop'>
		<div class='title'>
			<h2>재고퀵요청</h2>
			<a href="javascript:CLOSE_LAYER_POPUP('#pop_quick_stock_request');" class='pop_close'>닫기</a>
		</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class='tb_01_non mt10'>
			<colgroup>
				<col width='20%' />
				<col width='30%' />
				<col width='20%' />
				<col width='30%' />
			</colgroup>
			<tr>
				<th scope="row">도착지</th>
				<td class='lf2' id="end_str">효목탑</td>
				<th>결제형태</th>
				<td class='lf2' id="pay_tp_str">차감</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class='tb_01' id="pop_req_table">
			<colgroup>
				<col width='10%' />
				<col width='10%' />
				<col width='10%' />
				<col width='10%' />
				<col width='10%' />
				<col width='10%' />
				<col width='15%' />
				<col width='25%' />
			</colgroup>
			<tr>
				<th scope="col">광역퀵</th>
				<th scope="col">출발지</th>
				<th scope="col">통신사</th>
				<th scope="col">모델명</th>
				<th scope="col">색상</th>
				<th scope="col">유심</th>
				<th scope="col">비고</th>
				<th scope="col">광역출발지퀵</th>
			</tr>
			<!-- script : addGoods() -->
		</table>

		<dl class='memo mt10'>
			<dt><span>메모</span></dt>
			<dd></dd>
		</dl>

		<div class='pop_txt'>
			<p>위 정보로 퀵 요청하시겠습니까?</p>
			<div class='bx3 w300'>
				<select name="quick_shop_seq1_sel" id="quick_shop_seq1_sel" class="w30p"
					onchange="javascript:selQuick1('');">
				</select>
				<input type="text" name="quick1" id="quick1" class="w60p" readonly>
				<input type="hidden" name="quick_shop_seq1" id="quick_shop_seq1" value="">
			</div>
			<input type='button' value='퀵요청' class='btnp_01 w120' onclick="javascript:doGoodsReq();" />
		</div>

	</div>
</div>

<div id="pop_quick_search" class="dialog-popup" style="width:600px;">
	<div id='pop'>
		<div class='title'>
			<h2>퀵업체검색</h2>
			<a href="javascript:CLOSE_LAYER_POPUP('#pop_quick_search');" class='pop_close'>닫기</a>
		</div>

		<div>
			<select name="pop_sch_type" id="pop_sch_type" class='w130'>
				<option value="SHOP_ADDR">지역</option>
				<option value="SHOP_NM">회사명</option>
				<option value="SHOP_ID">아이디</option>
			</select>
			<div class='bx3 w330'>
				<input name="pop_sch_text" id="pop_sch_text" type="text" />
			</div>
			<input type='button' value='검색' class='btnp_01 w100' onclick="javascript:getQuickShop();" />
		</div>

		<div id="pop_quick_search_ajax">
			<!-- ajax loading: showQuickSearch() -->
		</div>
	</div>
</div>

<%@ include file="/common_inc/html_footer_inc.jsp" %>
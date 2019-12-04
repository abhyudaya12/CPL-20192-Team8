<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common_inc/html_top_inc.jsp" %>

<div id='wrap'>
	<!-- 왼쪽메뉴 [START] -->
	<%@ include file="/common_inc/left_menu_inc.jsp" %>
	<!-- 왼쪽 메뉴 [ END ] -->
	<div id='contain'>
	
		<!-- 상단메뉴 [START] -->
		<%@ include file="/common_inc/top_menu_inc.jsp" %>
		<!-- 상단메뉴 [END] -->
	
		<div id='content_wrap'> <!-- 100%의 전체 컨텐츠 영역-->
	
			<script>
				$(document).ready(function(){
					getNowDatetime();
					setInterval("getNowDatetime()", 1000);
				});
				
				function getNowDatetime(){
					var date = new Date();
					
					var month = date.getMonth() + 1;
					var day = date.getDate();
					var hour = date.getHours();
					var minute = date.getMinutes();
					var sec = date.getSeconds();
					
					var arrWeek = new Array('일', '월', '화', '수', '목', '금', '토');
					var week = date.getDay();
					
					$('.now_time').html(month +'월 '+ day +'일 ('+ arrWeek[week] +') '+ hour +'시 '+ minute +'분 '+ sec +'초');
				}
			</script>
	
			<div class='now_bx'>
				<dl>
					<dt><!-- ><?=date('Y-m')?> --> 2019-11</dt>
					<dd>
						<ul>
							<li>
								<span>입고 <em class='current_num m5'><!-- <?=number_format($DS_GOODS_STAT['GD_IN'])?> -->0</em> </span>
								<span class='pl15'>단말기 <em class='current_num m5'><!-- <?=number_format($DS_GOODS_STAT['PHONE'])?> -->5</em></span>
								<span class='pl15'>유심 <em class='current_num m5'><!-- <?=number_format($DS_GOODS_STAT['USIM'])?> -->0</em></span>
								<span class='pl15'>개통 <em class='current_num m5'><!-- <?=number_format($DS_GOODS_STAT['GD_OP'])?> -->0</em></span>
								<p class='now_time'><!-- getNowDatetime() --></p>
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
	
	
			<div class='content'> <!-- 원하는 컨텐츠 넓이를 추가 w960 클래스는 width:960px란 의미 -->
	
				<div class='m_situ'>
	
					<div class='m_01'>
						<h2>퀵 서비스 <em><!-- <?=number_format($sumQuick)?> -->0</em></h2>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class='m_tb'>
							<colgroup>
								<col width='50%'>
								<col width='50%'>
							</colgroup>
							<tr>
								<th scope="row">요청중</th>
								<td><!-- ><?=number_format($dsTopStat1['REQUEST'])?> -->0</td>
							</tr>
							<tr>
								<th scope="row">배송중</th>
								<td><!-- <?=number_format($dsTopStat1['DELIVER'])?> -->0</td>
							</tr>
							<tr>
								<th scope="row">배송완료</th>
								<td><!-- <?=number_format($dsTopStat1['COMPLETE'])?> -->0</td>
							</tr>
						</table>
					</div>
	
					<!-- 도매대리점일 경우(현재 기준) -->
					<div class='m_02' id="div_SH_AG" style="display:block;">
						<div class="m_02_div">
							<h2>입고 <em><!-- <?=number_format($sumIn)?> -->7</em></h2>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class='m_tb'>
							<colgroup>
								<col width='50%'>
								<col width='50%'>
							</colgroup>
							<tr>
								<th scope="row">단말기</th>
								<td><!-- <?=number_format($dsTopStat2['IN_PHONE_CNT'])?> -->2</td>
							</tr>
							<tr>
								<th scope="row">유심</th>
								<td><!-- <?=number_format($dsTopStat2['IN_USIM_CNT'])?> -->5	</td>
							</tr>
							</table>
						</div>
	
						<div class="m_02_div">
							<h2>출고 <em><!-- <?=number_format($sumOut)?> -->8</em></h2>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class='m_tb'>
							<colgroup>
								<col width='50%'>
								<col width='50%'>
							</colgroup>
							<tr>
								<th scope="row">단말기</th>
								<td><!-- <?=number_format($dsTopStat2['OUT_PHONE_CNT'])?> -->3</td>
							</tr>
							<tr>
								<th scope="row">유심</th>
								<td><!-- <?=number_format($dsTopStat2['OUT_USIM_CNT'])?> -->5</td>
							</tr>
							</table>
						</div>
					</div>
					<!-- //도매대리점일 경우 -->
	
	
					<!-- 판매점일 경우 -->
					<div class='m_04' id="div_SH_SA" style="display:none;">
						<div>
							<h2>재고 <em><!-- <?=number_format($sumGoods)?> -->5</em></h2>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class='m_tb'>
							<colgroup>
								<col width='50%'>
								<col width='50%'>
							</colgroup>
							<tr>
								<th scope="row">단말기</th>
								<td><!-- <?=number_format($dsTopStat2['PHONE_CNT'])?> -->5</td>
							</tr>
							<tr>
								<th scope="row">유심</th>
								<td><!-- <?=number_format($dsTopStat2['USIM_CNT'])?> -->0</td>
							</tr>
							</table>
						</div>
					</div>
					<!--// 판매점일 경우 -->
	
					<!-- 개통현황 경우 -->
					<div class='m_03'>
						<h2><!-- <?=$nowMonth?> -->11월 개통현황 <em><!-- <?=$sumOpen?> -->15</em></h2>
						<table width="100%" border="0" cellspacing="0" cellpadding="0" class='m_tb'>
							<colgroup>
								<col width='50%'>
								<col width='50%'>
								<!--
								<col width='25%'>
								<col width='25%'>
								-->
							</colgroup>
							<tr>
								<th scope="row">신규</th>
								<td><!-- <?=number_format($dsTopStat3['OP_CNT'])?> -->10</td>
							</tr>
							<tr>
								<th scope="row">번호이동</th>
								<td><!-- <?=number_format($dsTopStat3['MV_CNT'])?> -->3</td>
							</tr>
							<tr>
								<th scope="row">재가입(기변)</th>
								<td><!-- <?=number_format($dsTopStat3['RE_CNT'])?> -->2</td>
							</tr>
						</table>
					</div>
					<!-- 개통현황 경우 -->
	
				</div>
	
				<div class='m_situ2'>
	
					<div class='m_cal'>
						<p>
							<a href='javascript:goPrevMonth();'><img src='/images/main/btn_calpre.png' /></a>
							<span id="year_month"></span>
							<a href='javascript:goNextMonth();'><img src='/images/main/btn_calnext.png' /></a>
						</p>
						<!-- calendar ajax load : main_calendar_ajax.php -->
					</div>
	
					<div class='m_noti'>
	
						<!-- 대리점일 경우 -->
						<div class='noti_bx'>
							<h2>공지사항</h2>
							<ul>
								<li><a href="javascript:goNoticeDetail('<?=$ds['SEQ']?>');"><!-- <?=$ds['TITLE']?> -->공지1</a> <span><!-- <?=substr($ds['REG_DT'], 2, 8)?> -->2019-09-28</span></li>
								<li><a href="javascript:goNoticeDetail('<?=$ds['SEQ']?>');"><!-- <?=$ds['TITLE']?> -->공지2</a> <span><!-- <?=substr($ds['REG_DT'], 2, 8)?> -->2019-10-25</span></li>
								<li><a href="javascript:goNoticeDetail('<?=$ds['SEQ']?>');"><!-- <?=$ds['TITLE']?> -->공지3</a> <span><!-- <?=substr($ds['REG_DT'], 2, 8)?> -->2019-10-31</span></li>
								<li><a href="javascript:goNoticeDetail('<?=$ds['SEQ']?>');"><!-- <?=$ds['TITLE']?> -->공지4</a> <span><!-- <?=substr($ds['REG_DT'], 2, 8)?> -->2019-11-01</span></li>
								<li><a href="javascript:goNoticeDetail('<?=$ds['SEQ']?>');"><!-- <?=$ds['TITLE']?> -->공지5</a> <span><!-- <?=substr($ds['REG_DT'], 2, 8)?> -->2019-11-02</span></li>
							</ul>
							<p><a href='#'><img src='/images/main/btn_more.png' /></a></p>
						</div>
						<!--// 대리점일 경우 -->
	
						<!-- 판매점일 경우 -->
						<div class='m_agency'>
							<h2>대리점 정책</h2>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class='m_tbag'>
								<colgroup>
									<col width='33.3333%' />
									<col width='33.3333%' />
									<col width='33.3333%' />
								</colgroup>
								<tr>
									<th scope="col">등록일</th>
									<th scope="col">적용일</th>
									<th scope="col">대리점</th>
								</tr>
	
								<tr>
									<td><?=substr($ds['REG_DT'], 0, 10)?>2019-09-28</td>
									<td><?=substr($ds['POLICY_DT'], 0, 10)?>2019-09-28</td>
									<td><?=$ds['SHOP_NM']?>대리점1</td>
								</tr>
								<tr>
									<td><?=substr($ds['REG_DT'], 0, 10)?>2019-10-28</td>
									<td><?=substr($ds['POLICY_DT'], 0, 10)?>2019-10-28</td>
									<td><?=$ds['SHOP_NM']?>대리점2</td>
								</tr>
								<tr>
									<td><?=substr($ds['REG_DT'], 0, 10)?>2019-11-28</td>
									<td><?=substr($ds['POLICY_DT'], 0, 10)?>2019-11-28</td>
									<td><?=$ds['SHOP_NM']?>대리점3</td>
								</tr>
							</table>
	
							<p><a href='/page/setting/agency.php'><img src='/images/main/btn_more.png' /></a></p>
						</div>
						<!--// 판매점일 경우 -->
					</div>
	
				</div>
	
	
	
			</div>
			<!--// content -->
	
		</div>
		<!--// 전체 100% CONTENTS	 -->
	
	</div>
	<!--//contain-->

</div>
<!--//wrap-->



<!-- 공지사항 팝업 -->
<div id="pop_quick_notice" class="dialog-popup" style="width:900px;">
	<div id='pop'>
		<div class='title'>
			<h2>공지사항 상세보기</h2>
			<a href="javascript:hideGoodsReqPopup();" class='pop_close'>닫기</a>
		</div>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" class='tb_02'>
			<colgroup>
				<col width='34%' />
				<col width='33%' />
				<col width='33%' />
			</colgroup>
			<tr>
				<th scope="col">요청점</th>
				<th scope="col">처리자</th>
				<th scope="col">상태</th>
			</tr>
			<tr id="goods_req_tr_top">
				<!-- ajax loading
				<td>효목탑</td>
				<td>마이콜</td>
				<td>부분완료</td>
				 -->
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" class='tb_01 mt20' id="goods_req_table_list">
			<!-- ajax loading
			<colgroup>
				<col width='16%' />
				<col width='20%' />
				<col width='16%' />
				<col width='16%' />
				<col width='22%' />
				<col width='10%' />
			</colgroup>
			<tr>
				<th scope="col">통신사</th>
				<th scope="col">모델명</th>
				<th scope="col">색상</th>
				<th scope="col">비고</th>
				<th scope="col">퀵요청</th>
				<th scope="col">취소</th>
			</tr>
			<tr>
				<td><img src='/images/common/icon_t.png' /></td>
				<td>SM-N930</td>
				<td>블랙</td>
				<td>&nbsp;</td>
				<td><a href='#' class='s_btn3 w80'>요청하기</a></td>
				<td><a href='#' class='s_btn2 w40'>취소</a></td>
			</tr>
			<tr>
				<td><img src='/images/common/icon_uplus.png' /></td>
				<td>SM-N930</td>
				<td>블랙</td>
				<td>&nbsp;</td>
				<td>N201610190001</td>
				<td>&nbsp;</td>
			</tr>
			 -->
		</table>
		<div class='memo_bx mt20 center'>
			<span>메모</span>
			<input name="goods_req_memo" id="goods_req_memo" type="text"  class='w87p' value="" />
			<input type="button" value='저장' class='btn_02 w60' onclick="javascript:doSaveGoodsReqMemo('#goods_req_memo');" />
		</div>
	</div>
</div>
<%@ include file="/common_inc/html_footer_inc.jsp" %>
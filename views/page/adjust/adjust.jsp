
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
			<h2>정산</h2>
			<ul class='sub'>
	
				<li class='sel'><a href='/page/stock/stock'>정산 내역</a></li>
				<!-- 현재 페이지에서  메뉴 활성 -->
				<li class=''><a href='/page/stock/enter'>정산서 관리</a></li>
				<li class=''><a href='/page/stock/out'>소급요청 관리</a></li>
				<li class=''><a href='/page/stock/lose'>환수 관리</a></li>

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
				<!-- content -->
				<div class="content">
					<!-- 원하는 컨텐츠 넓이를 추가 w960 클래스는 width:960px란 의미 -->
					<h2>정산</h2>

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
						 <span
							class="fr"> <input type="button" value="인쇄"
							class="btn_print w70" onclick="javascript:doPrint();"> <input
							type="button" value="엑셀저장" class="btn_excel w90"
							onclick="javascript:doExcel();">
						</span>
					</p>


					<table class="tb_01 mt10" width="100%" cellspacing="0"
						cellpadding="0" border="0">
						<tbody id="stock_table">
							<tr>
								<th scope="col">NO</th>
								<th scope="col">개통일</th>
								<th scope="col">약정/개월</th>
								<th scope="col">통신사</th>
								<th scope="col">모델명</th>
								<th scope="col">가입유형 </th>
								<th scope="col">판매처</th>
								<th scope="col">정산점</th>
								<th scope="col">개통점</th>
								<th scope="col">요금제</th>
								<th scope="col">부가서비스</th>
								<th scope="col">출고가</th>
								<th scope="col">공시지원금</th>
								<th scope="col">현금판매</th>
								<th scope="col">할부가</th>
								<th scope="col">할부개월</th>
								<th scope="col">약정할인</th>
								<th scope="col">고객명</th>
								<th scope="col">전 통신사</th>
								
							</tr>
							
							<tr>
								<td>1</td>
								<td>2019.10.13</td>
								<td>무약정 24</td>
								<td><img src="/images/common/icon_t.png"></td>
								<td>SM-N930</td>
								<td>신규</td>
								<td>청담</td>
								<td>방배대리점</td>
								<td>비전만촌</td>
								<td>(LTE)데이터 29.9</td>
								<td>.</td>
								<td>998,000</td>
								<td>235,000</td>
								<td>0</td>
								<td>763,000</td>
								<td>24</td>
								<td>.</td>
								<td>장성원</td>
								<td><img src="/images/common/icon_kt.png"></td>
							</tr>
							
							<tr>
								<td>1</td>
								<td>2019.11.21</td>
								<td>무약정 24</td>
								<td><img src="/images/common/icon_kt.png"></td>
								<td>A2160</td>
								<td>신규</td>
								<td>판매나라</td>
								<td>방배대리점</td>
								<td>비전만촌</td>
								<td>(LTE)데이터 39.9</td>
								<td>.</td>
								<td>990,000</td>
								<td>230,000</td>
								<td>100,000</td>
								<td>0</td>
								<td>0</td>
								<td>.</td>
								<td>박제영</td>
								<td><img src="/images/common/icon_uplus.png"></td>
							</tr>

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

		<form method="post" name="frmProc" id="frmProc" action="">
			<input type="hidden" name="pageaction" id="pageaction" value="">
			<input type="hidden" name="seq" id="seq" value="">
		</form>
</body>
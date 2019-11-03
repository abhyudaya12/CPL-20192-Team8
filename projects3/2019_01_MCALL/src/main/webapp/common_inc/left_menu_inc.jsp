<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id='lnb'>
	<h1><a href='/'><img src='/images/common/logo.png' /></a></h1>
	<dl class='member_info'>
		<dt><span>경북대<!--=$S_STAFF_ID--></span> 님의 정보</dt>
		<dd>
			<ul>
				<li>이름 : <span><!--=$S_STAFF_NM-->박제영</span></li>
				<li>아이디 타입 : <span><!--=$S_SHOPID_YN == 'Y' ? '업체' : '직원'-->직원</span></li>
				<li><!--=$S_SHOPID_YN == 'Y' ? '상호' : '소속'-->상호 : <span><!--=$S_SHOP_NM-->경북대 8조</span></li>
				<li>권한 : <span><!--=CODE_STAFF_GRADE($S_GRADE)--></span></li>
				<li>최종접속일시 : <p><!--=$S_LAST_ACC_DT-->2019-09-28 12:00:00</p></li>
			</ul>
		</dd>

		<dt>소속 계정 정보</dt>
		<dd>
			<ul>
				<li>타입 : <span><!--=CODE_SHOP_TP($S_SHOP_TP)-->대리점or판매점</span></li>
				<li>거래 대리점 : <span><!--=$dsDeal['AGENT_CNT']-->0 개</span></li>
				<li>소속 판매점 : <span><!--=$dsLow['CNT']-->0 개</span></li>
				<li>거래 판매점 : <span><!--=$dsDeal['SALE_CNT']-->0 개</span></li>
				<li>입고처 : <span><!--=$dsInplace['CNT']-->0 개</span></li>
				<li>직원 : <span><!--=$dsStaff['CNT']-->0 명</span></li>
			</ul>
		</dd>
	</dl>

	<ul class='m_down'>
		<li><a href='#'>공시지원금</a></li>
		<li><a href='#'>M CALL 앱</a></li>
	</ul>

	<dl class='m_cus'>
		<dt>고객센터</dt>
		<dd><a href='#'>데이터 대량등록</a></dd>
	</dl>
</div>
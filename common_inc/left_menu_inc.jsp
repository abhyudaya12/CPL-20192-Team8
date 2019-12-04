<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common_inc/time_func_inc.jsp"%>
<div id='lnb'>
	<h1>
		<a href='/main'><img src='/images/common/logo.png' /></a>
	</h1>
	<%
	String company_type = null;
	String id = null;
	String member_type = null;
	
		id = (String)session.getAttribute("id");
		member_type = (String)session.getAttribute("member_type");
		company_type = (String)session.getAttribute("company_type");
	
		if(company_type == null){
		out.println("<script>");
		out.println("alert('[경고] 로그인을 해야 접근 가능한 페이지입니다.')");
		out.println("location.href='/'");
		out.println("</script>");	
		}
		
		if(company_type != null){
			if(company_type.equals("1")) company_type="대리점";
			else company_type="판매점";	
		}
		
	%>
	<dl class='member_info'>
		<dt>
			<span>경북대<!--=$S_STAFF_ID--></span> 님의 정보
		</dt>
		<dd>
			<ul>
				<li>이름 : <span>
						<!--=$S_STAFF_NM--><%=id%> 님
				</span></li>
				<li>아이디 타입 : <span>
						<!--=$S_SHOPID_YN == 'Y' ? '업체' : '직원'--><%=member_type%></span></li>
				<li>
					<!--=$S_SHOPID_YN == 'Y' ? '상호' : '소속'-->상호 : <span>
						<!--=$S_SHOP_NM-->경북대 8조
				</span>
				</li>
				<li>권한 : <span>
						<!--=CODE_STAFF_GRADE($S_GRADE)-->
				</span></li>
				<li>최종접속일시 :
						<!--=$S_LAST_ACC_DT-->
						2019-11-28
				</li>
			</ul>
		</dd>

		<dt>소속 계정 정보</dt>
		<dd>
			<ul>
				<li>타입 : <span>
						<!--=CODE_SHOP_TP($S_SHOP_TP)--><%=company_type%></span></li>
				<li>거래 대리점 : <span>
						<!--=$dsDeal['AGENT_CNT']-->0 개
				</span></li>
				<li>소속 판매점 : <span>
						<!--=$dsLow['CNT']-->0 개
				</span></li>
				<li>거래 판매점 : <span>
						<!--=$dsDeal['SALE_CNT']-->0 개
				</span></li>
				<li>입고처 : <span>
						<!--=$dsInplace['CNT']-->0 개
				</span></li>
				<li>직원 : <span>
						<!--=$dsStaff['CNT']-->0 명
				</span></li>
			</ul>
		</dd>
	</dl>

	<ul class='m_down'>
		<li><a href='#'>공시지원금</a></li>
		<li><a href='#'>M CALL 앱</a></li>
	</ul>

	<dl class='m_cus'>
		<dt>고객센터</dt>
		<dd>
			<a href='#'>데이터 대량등록</a>
		</dd>
	</dl>
</div>
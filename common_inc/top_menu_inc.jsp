<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="gnb">
	<%
		 String logout = request.getParameter("logout");
		
		if(logout != null && logout.equals("yes")){
			session.removeAttribute("id");
			session.removeAttribute("login");
			session.removeAttribute("company_type");
			session.removeAttribute("member_type");
			out.println("<script>");
			out.println("location.href='/'");
			out.println("</script>");
		}
		
	%>
	<ul>
		<li class=''><a href=/page/quick/quick>퀵 서비스</a></li>
		<li class=''><a href=/page/stock/stock>재고관리</a></li>
		<li class=''><a href=/page/adjust/adjust>정산</a></li>
		<li class=''><a href=/page/customer/customer>고객관리</a></li>
		<li class=''><a href=/page/schedule/schedule>일정</a></li>
		<li class=''><a href=/page/setting/setting>설정</a></li>
	</ul>
	<!--  <a href='javascript:doLogout();'>로그아웃</a> -->
	<a href='?logout=yes'>로그아웃</a>
	<!-- <input type="button" value="로그아웃" onclick="location.href='main?logout=yes'"> -->
</div>
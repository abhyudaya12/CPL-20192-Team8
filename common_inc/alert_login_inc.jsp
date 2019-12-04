<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
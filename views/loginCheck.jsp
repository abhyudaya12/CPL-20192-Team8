<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.mcall.main.controller.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pw");
	
	Connection conn = DBUtil.getMySQLConnection();
	
	String sql = "select * from mcall.member where member_id = ?";
	String sql2 = "select member_type from mcall.member where member_id = ?";
	String company_num_sql = "select company_num from mcall.member where member_id = ? ";
	String company_type_sql = "select company_type from mcall.company where company_num = ? ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String password;
	rs.next();
	password = rs.getString("member_auth_key");
	
	// member type을 받아오기 위함
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	pstmt2.setString(1, id);
	ResultSet rs2 = pstmt2.executeQuery();
	String member_type;
	rs2.next();
	member_type = rs2.getString("member_type");
	
	// 로그인한 멤버의 company_num을 받아오기 위함
	PreparedStatement pstmt3 = conn.prepareStatement(company_num_sql);
	pstmt3.setString(1, id);
	ResultSet rs3 = pstmt3.executeQuery();
	String company_num;
	rs3.next();
	company_num = rs3.getString("company_num");
	
	// 로그인한 멤버 회사의 타입을 받아오기 위함
	PreparedStatement pstmt4 = conn.prepareStatement(company_type_sql);
	pstmt4.setString(1, company_num);
	ResultSet rs4 = pstmt4.executeQuery();
	String company_type=null;
	rs4.next();
	company_type = rs4.getString("company_type");
	
	DBUtil.close(rs);
	DBUtil.close(pstmt);
	DBUtil.close(conn);
	
	if(password.equals(pass)){
			
		// 코드 윗부분에서 sql문을 통해 받아온 값을 세션 어트리뷰트에 등록해준다.
		session.setAttribute("id",id);
		session.setAttribute("member_type",member_type);
		session.setAttribute("company_type",company_type);
		session.setAttribute("company_num",company_num);

		out.println("<script>");
		out.println("alert('[MCALL] 성공적으로 로그인 되었습니다!')");
		out.println("location.href='/main'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('정보가 틀렸습니다. 다시 확인해 주세요.')");
		out.println("location.href='/'");
		out.println("</script>");
	}
	
	
%>

</body>
</html>
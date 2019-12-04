<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.Connection" %>
<%@ page import="kr.co.mcall.main.controller.DBUtil" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>



<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>jsp 게시판 웹사이트</title>
	</head>
	<body>
		<%
			String id= request.getParameter("id");
			String pass=request.getParameter("pw");
			Connection conn = DBUtil.getMySQLConnection();
						
			String sql = "select * from mcall.member where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			String password;
			rs.next();
			password = rs.getString("member_auth_key");
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
			
			if(password.equals(pass)){
				out.println("<script>");
				out.println("alert('로그인 되었습니다!!')");
				out.println("location.href=main.jsp");
				System.out.println("접속성공!!!로그인ㅁ!!!");
			}else{
				out.println("<script>");
				out.println("alert('정보가 틀렸습니다!!')");
				out.println("location.href=main.jsp");
			}

			/*
			//로그인 성공
			if(result == 1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("<location.href = 'main.jsp'");
				script.println("</script>");
			}
			//로그인 실패
			else if(result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('아이디나 비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//아이디 없음
			else if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			//DB오류
			else if(result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('DB오류가 발생했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}	*/
		%>
	</body>
</html>
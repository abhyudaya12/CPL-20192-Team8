<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.mcall.main.controller.DBUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String joinID = request.getParameter("joinID");
		String joinPW = request.getParameter("joinPW");
		String joinNAME = request.getParameter("joinNAME");
		String joinCOMPANY = request.getParameter("joinCOMPANY");
		String member_type = request.getParameter("member_radio");
		int company_num;

		Connection conn = DBUtil.getMySQLConnection();

		//test check
		System.out.print(member_type);

		if (member_type.equals("company"))
			member_type = "company";
		else
			member_type = "employee";

		String company_num_sql = "select company_num from mcall.company where company_name = ? ";
		PreparedStatement pstmt0 = conn.prepareStatement(company_num_sql);

		pstmt0.setString(1, joinCOMPANY);
		ResultSet rs0 = pstmt0.executeQuery();
		String CUR_COMPANY = null;
		rs0.next();

		// [0] 등록되지 않은 회사 이름으로 멤버 타입을 직원으로 등록하려 할 경우
		try {
			CUR_COMPANY = rs0.getString("company_num");
		} catch (Exception e) {
			out.println("<script>");
			out.println("alert('[MCALL] 등록되지 않은 회사입니다.')");
			out.println("location.href='join'");
			out.println("</script>");
		} finally {
			// [1] 회사가 사전에 등록되어 있고, 멤버 타입을 직원으로 가입할 때
			if (CUR_COMPANY != null && member_type.equals("employee")) {
				company_num = Integer.parseInt(CUR_COMPANY);

				String sql = "insert into mcall.member(member_num,member_id,member_type,member_auth_key,member_name,company_num) values (?, ?, ?, ?, ?, ?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, null);
				pstmt.setString(2, joinID);
				pstmt.setString(3, member_type);
				pstmt.setString(4, joinPW);
				pstmt.setString(5, joinNAME);
				pstmt.setInt(6, company_num);

				// [1-1] id 중복체크 (id는 unique로 설정되어 있음)
				try {
					pstmt.executeUpdate();
				} catch (Exception idException) {
					out.println("<script>");
					out.println("alert('[MCALL] 중복된 ID입니다. 다른 ID로 가입해주세요.')");
					out.println("location.href='join'");
					out.println("</script>");
				}

				DBUtil.close(pstmt);
				DBUtil.close(conn);

				out.println("<script>");
				out.println("alert('[MCALL] 정상적으로 회원가입이 완료되었습니다.')");
				out.println("location.href='/'");
				out.println("</script>");

			}

			// [2] 회사가 사전에 등록되어 있고, 멤버 타입을 업체로 가입할 때는 단 하나만 있어야 한다.
			else if (CUR_COMPANY != null && member_type.equals("company")) {

				//String check_company_sql = "select company_num from mcall.member where member_type = ? ";
				String check_company_sql = "select c.company_num from (select company_num from mcall.member where member_type = ?) c where c.company_num="+CUR_COMPANY;
				PreparedStatement pstmt2 = conn.prepareStatement(check_company_sql);

				pstmt2.setString(1, "company");
				ResultSet rs2 = pstmt2.executeQuery();
				String CHECK_COMPANY = null;
				rs2.next();

				try {
					CHECK_COMPANY = rs2.getString("company_num");
				} catch (Exception e) {
					// CHECK_COMPANY가 null이면			
					if (CHECK_COMPANY == null) {
						company_num = Integer.parseInt(CUR_COMPANY);

						String sql = "insert into mcall.member(member_num,member_id,member_type,member_auth_key,member_name,company_num) values (?, ?, ?, ?, ?, ?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);

						pstmt.setString(1, null);
						pstmt.setString(2, joinID);
						pstmt.setString(3, member_type);
						pstmt.setString(4, joinPW);
						pstmt.setString(5, joinNAME);
						pstmt.setInt(6, company_num);
						pstmt.executeUpdate();

						DBUtil.close(pstmt);
						DBUtil.close(conn);

						out.println("<script>");
						out.println("alert('[MCALL] 정상적으로 회원가입이 완료되었습니다.')");
						out.println("location.href='/'");
						out.println("</script>");
					}
				} finally {
					if (CHECK_COMPANY != null) {
						out.println("<script>");
						out.println("alert('[MCALL] 이미 업체 계정이 등록되어 있습니다. 다시 확인해 주세요.')");
						out.println("location.href='/join'");
						out.println("</script>");
					}
				}
			}
		}
	%>

</body>
</html>
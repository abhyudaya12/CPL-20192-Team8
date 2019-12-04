<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="kr.co.mcall.stock.dao.stockDO" %>
<%@ page import="kr.co.mcall.main.controller.DBUtil" %>
<%@ page contentType="text/xml" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%
     request.setCharacterEncoding("utf-8");   

     DBUtil stock = new DBUtil();
     
     String company_num = null;
 	 company_num = (String)session.getAttribute("company_num");
     
     ArrayList<stockDO> stockList = new ArrayList<stockDO>(); 
     stockList = stock.stockPOPlistShowing(company_num);
     
     System.out.println("여기stockPOPlistshowing jsp야");
%>
    <contents>
<%    
    for(stockDO stk : (ArrayList<stockDO>)stockList) {
%>
        <stock>
            <idx><%=stk.getStock_idx() %></idx>
            <phone_model><%=stk.getPhone_model() %></phone_model>                 
        </stock>
<%		
    }
	
%>		
    </contents>
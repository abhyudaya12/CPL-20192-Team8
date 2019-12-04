<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="kr.co.mcall.stock.dao.stockDO" %>
<%@ page import="kr.co.mcall.main.controller.DBUtil" %>
<%@ page contentType="text/xml" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%
     request.setCharacterEncoding("utf-8");   

     DBUtil stock = new DBUtil();
     
     String seq = null;
 	 seq = (String)session.getAttribute("seq");
 	 System.out.println("test deatil : "+seq);
     
     ArrayList<stockDO> stockList = new ArrayList<stockDO>(); 
     stockList = stock.stockPOPDetailShowing("752134");
     
     System.out.println("여기stockPOPDetaillistshowing jsp야");
%>
    <contents>
<%    
    for(stockDO stk : (ArrayList<stockDO>)stockList) {
%>
        <stock>
            <idx><%=stk.getStock_idx() %></idx>
            <stat><%=stk.getStat() %></stat>
            <company_name><%=stk.getCompany_name() %></company_name>  
            <moving_date><%=stk.getMoving_date() %></moving_date>                   
        </stock>
<%		
    }
	
%>		
    </contents>
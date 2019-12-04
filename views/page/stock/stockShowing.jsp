<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="kr.co.mcall.stock.dao.stockDO" %>
<%@ page import="kr.co.mcall.main.controller.DBUtil" %>
<%@ page contentType="text/xml" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%
     request.setCharacterEncoding("utf-8");   

     DBUtil stock = new DBUtil();
     ArrayList<stockDO> stockList = new ArrayList<stockDO>(); 
     stockList = stock.stockShowing();
     System.out.println("여기stockshowing jsp야");
%>
    <contents>
<%    
    for(stockDO stk : (ArrayList<stockDO>)stockList) {
%>
        <stock>
            <idx><%=stk.getStock_idx() %></idx>
            <carrier><%=stk.getCarrier() %></carrier>
            <incoming_date><%=stk.getIncoming_date() %></incoming_date>
            <date_count><%=stk.getDate_count() %></date_count>
            <company_name><%=stk.getCompany_name() %></company_name>
            <phone_model><%=stk.getPhone_model() %></phone_model>
            <op_color><%=stk.getOp_color() %></op_color>
            <op_volume><%=stk.getOp_volume() %></op_volume>
            <serial><%=stk.getSerial()%></serial>
            <stat><%=stk.getStat() %></stat>
            <incoming><%=stk.getIncoming() %></incoming>
            <holding><%=stk.getHolding() %></holding>
            <moving_date><%=stk.getMoving_date() %></moving_date>
            
            <!-- <comp_num><%=stk.getComp_num() %></comp_num>
            <stock_model><%=stk.getStock_model() %></stock_model>
            <stock_status><%=stk.getStock_status() %></stock_status>
            <stock_info><%=stk.getStock_info() %></stock_info>
            <moving_date><%=stk.getMoving_date() %></moving_date>  -->
                      
        </stock>
<%		
    }
%>		
    </contents>
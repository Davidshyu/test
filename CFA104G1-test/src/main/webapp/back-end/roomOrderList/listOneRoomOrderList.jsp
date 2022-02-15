<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.roomOrderList.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  RoomOrderListVO roomOrderListVO = (RoomOrderListVO) request.getAttribute("roomOrderListVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>住宿單明細資料 - listOneRoomOrderList.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneEmp.jsp</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>住宿訂單明細編號</th>
		<th>房間編號</th>
		<th>住宿訂單編號</th>
		<th>人數</th>
		<th>住房日期</th>
		<th>退房日期</th>
		<th>特殊要求</th>
		<th>房間價格</th>
		<th>服務訂單編號</th>
		<th>房型編號</th>
	</tr>
	<tr>
		<td><%=roomOrderListVO.getRoom_order_list_id() %></td>
		<td><%=roomOrderListVO.getRoom_id() %></td>
		<td><%=roomOrderListVO.getRoom_order_id() %></td>
		<td><%=roomOrderListVO.getNumber_of_people() %></td>
		<td><%=roomOrderListVO.getArrival_date() %></td>
		<td><%=roomOrderListVO.getDeparture_date() %></td>
		<td><%=roomOrderListVO.getSpecial_req() %></td>
		<td><%=roomOrderListVO.getRoom_price() %></td>
		<td><%=roomOrderListVO.getService_order_id() %></td>
		<td><%=roomOrderListVO.getRoom_type_id() %></td>
	</tr>
</table>

</body>
</html>
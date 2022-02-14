<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.roomOrderList.model.*"%>

<%
RoomOrderListVO roomOrderListVO = (RoomOrderListVO) request.getAttribute("roomOrderListVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>住宿單明細修改 - update_roomOrderList_input.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>住宿單明細修改  - update_roomOrderList_input.jsp</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/roomOrderList/room_order_list.do" name="form1">
<table>
	<tr>
		<td>住宿訂單明細編號:<font color=red><b>*</b></font></td>
		<td><%=roomOrderListVO.getRoom_order_list_id()%></td>
	</tr>
	<tr>
		<td>房間編號:</td>
		<td><input type="TEXT" name="room_id" size="45" value="<%=roomOrderListVO.getRoom_id()%>" /></td>
	</tr>
	<tr>
		<td>住宿訂單編號:</td>
		<td><input type="TEXT" name="room_order_id" size="45"	value="<%=roomOrderListVO.getRoom_order_id() %>" /></td>
	</tr>
	<tr>
		<td>人數:</td>
		<td><input type="TEXT" name="number_of_people" size="45"  value="<%=roomOrderListVO.getNumber_of_people()%>" /></td>
	</tr>
	<tr>
		<td>住房日期:</td>
		<td><input name="arrival_date" id="arrival_date" type="text" ></td>
	</tr>
	<tr>
		<td>退房日期:</td>
		<td><input name="departure_date" id="departure_date" type="text" ></td>
	</tr>
	<tr>
		<td>特殊要求:</td>
		<td><input type="TEXT" name="special_req" size="45"	value="<%=roomOrderListVO.getSpecial_req()%>" /></td>
	</tr>
	<tr>
		<td>房間價格:</td>
		<td><input type="TEXT" name="room_price" size="45" value="<%=roomOrderListVO.getRoom_price()%>" /></td>
	</tr>
		<tr>
		<td>服務訂單編號:</td>
		<td><input type="TEXT" name="service_order_id" size="45" value="<%=roomOrderListVO.getService_order_id()%>" /></td>
	</tr>
	
	
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="room_order_list_id" value="<%=roomOrderListVO.getRoom_order_list_id()%>">
<input type="submit" value="送出修改"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#arrival_date').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('#departure_date').val()?$('#departure_date').val():false
	   })
	  },
	  timepicker:false,
	  value: '<%=roomOrderListVO.getArrival_date()%>',
	 });
	 
	 $('#departure_date').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#arrival_date').val()?$('#arrival_date').val():false
	   })
	  },
	  timepicker:false,
	  value: '<%=roomOrderListVO.getDeparture_date()%>',
	 });
});
</script>
</html>
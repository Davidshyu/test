<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.roomOrderList.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    RoomOrderListService roomOrderListSvc = new RoomOrderListService();
    List<RoomOrderListVO> list = roomOrderListSvc.getall();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>所有住宿單明細列表 - listAllRommOrderList.jsp</title>



</head>
<body bgcolor='white'>


<div class="container" style="background-color: #F5E19A ">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="select_page.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
        <span class="fs-4">所有住宿單明細列表 - listAllRommOrderList.jsp</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-item"><a href="select_page.jsp" class="nav-link"  style="color: black ">回首頁</a></li>
        <li class="nav-item"><a href="#" class="nav-link" style="color: black ">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link" style="color: black ">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link" style="color: black ">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link" style="color: black ">About</a></li>
      </ul>
    </header>
</div>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table class="table table-striped"  >
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
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="roomOrderListVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${roomOrderListVO.room_order_list_id}</td>
			<td>${roomOrderListVO.room_id}</td>
			<td>${roomOrderListVO.room_order_id}</td>
			<td>${roomOrderListVO.number_of_people}</td>
			<td>${roomOrderListVO.arrival_date}</td>
			<td>${roomOrderListVO.departure_date}</td> 
			<td>${roomOrderListVO.special_req}</td>
			<td>${roomOrderListVO.room_price}</td>
			<td>${roomOrderListVO.service_order_id}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/roomOrderList/room_order_list.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="room_order_list_id"  value="${roomOrderListVO.room_order_list_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			  </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/roomOrderList/room_order_list.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="room_order_list_id"  value="${roomOrderListVO.room_order_list_id}">
			     <input type="hidden" name="action" value="delete">
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


</body>
</html>
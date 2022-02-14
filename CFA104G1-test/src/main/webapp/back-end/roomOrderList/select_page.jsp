<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>住宿單明細: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>住宿單明細 Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for 住宿單明細: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllRoomOrderList.jsp'>List</a> all 住宿單明細.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/roomOrderList/room_order_list.do" >
        <b>輸入住宿訂單明細編號:</b>
        <input type="text" name="room_order_list_id">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="roomOrderListSvc" scope="page" class="com.roomOrderList.model.RoomOrderListService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/roomOrderList/room_order_list.do" >
       <b>選擇住宿訂單明細編號:</b>
       <select size="1" name="room_order_list_id">
         <c:forEach var="roomOrderListVO" items="${roomOrderListSvc.all}" > 
          <option value="${roomOrderListVO.room_order_list_id}">${roomOrderListVO.room_order_list_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/roomOrderList/room_order_list.do" >
       <b>選擇抵達時間:</b>
       <select size="1" name="room_order_list_id">
         <c:forEach var="roomOrderListVO" items="${roomOrderListSvc.all}" > 
          <option value="${roomOrderListVO.room_order_list_id}">${roomOrderListVO.arrival_date}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>


<h3>住宿單明細</h3>

<ul>
  <li><a href='addRoomOrderList.jsp'>新增</a>住宿單明細</li>
</ul>

</body>
</html>
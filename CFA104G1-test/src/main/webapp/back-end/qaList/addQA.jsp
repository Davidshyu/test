<%@page import="com.qalist.model.QAListVO"%>
<%@page import="com.room.model.RoomVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.room.model.*"%>

<%
QAListVO qaListVO = (QAListVO) request.getAttribute("qaListVO");
%>

<!-- 等另一遍DAO出來再用 -->
<%-- <%= empVO == null %>--${empVo.deptno}--  --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>QA新增 </title>

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
		<tr>
			<td>
				<h3>QA新增 </h3>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/qaList/qaList.do" name="form1">
		<table>
			<tr>
				<td>顯示順序:</td>
				<td><input type="TEXT" name="no" size="45"
					value="<%=(qaListVO == null) ? "5" : qaListVO.getNo()%>" /></td>
			</tr>
			<tr>
				<td>問題:</td>
				<td><input type="TEXT" name="question" size="45"
					value="<%=(qaListVO == null) ? "問題?" : qaListVO.getQuestion() %>" /></td>
			</tr>
			
			<tr>
				<td>答覆:</td>
				<td><input type="TEXT" name="answer" size="45"
					value="<%=(qaListVO == null) ? "答覆?" : qaListVO.getAnswer()%>" /></td>
			</tr>
			<tr>
				<td>狀態:</td>
				<td><input type="TEXT" name="status" size="45"
					value="<%=(qaListVO == null) ? "0" : qaListVO.getStatus()%>" /></td>
			</tr>

			

		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="送出新增">
	</FORM>
</body>
</html>
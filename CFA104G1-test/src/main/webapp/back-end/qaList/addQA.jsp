<%@page import="com.qalist.model.QAListVO"%>
<%@page import="com.room.model.RoomVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.room.model.*"%>

<%
QAListVO qaListVO = (QAListVO) request.getAttribute("qaListVO");
%>

<!-- ���t�@�MDAO�X�ӦA�� -->
<%-- <%= empVO == null %>--${empVo.deptno}--  --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>QA�s�W </title>

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
				<h3>QA�s�W </h3>
			</td>
		</tr>
	</table>

	<h3>��Ʒs�W:</h3>

	<%-- ���~���C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/qaList/qaList.do" name="form1">
		<table>
			<tr>
				<td>��ܶ���:</td>
				<td><input type="TEXT" name="no" size="45"
					value="<%=(qaListVO == null) ? "5" : qaListVO.getNo()%>" /></td>
			</tr>
			<tr>
				<td>���D:</td>
				<td><input type="TEXT" name="question" size="45"
					value="<%=(qaListVO == null) ? "���D?" : qaListVO.getQuestion() %>" /></td>
			</tr>
			
			<tr>
				<td>����:</td>
				<td><input type="TEXT" name="answer" size="45"
					value="<%=(qaListVO == null) ? "����?" : qaListVO.getAnswer()%>" /></td>
			</tr>
			<tr>
				<td>���A:</td>
				<td><input type="TEXT" name="status" size="45"
					value="<%=(qaListVO == null) ? "0" : qaListVO.getStatus()%>" /></td>
			</tr>

			

		</table>
		<br> 
		<input type="hidden" name="action" value="insert"> 
		<input type="submit" value="�e�X�s�W">
	</FORM>
</body>
</html>
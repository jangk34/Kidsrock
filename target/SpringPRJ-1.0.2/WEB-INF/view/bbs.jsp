<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>WEB!</title>
</head>
<body>
	<table style="height: 100%; width: 100%;">
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/top.jsp" %></td>
		</tr>
		<tr><td>
		<table border="1">
		<tr >
			<td >작성번호</td>
			<td>
			제목
			</td>
			<td>내용</td>
			<td>회원번호</td>
			<td>회원이름</td>
		</tr>
		</table>
		
		</td></tr>
	
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>
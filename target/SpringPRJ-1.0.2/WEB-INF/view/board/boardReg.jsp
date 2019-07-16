<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>WEB!</title>
</head>
<body>
	<table style="height: 100%; width: 100%">
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/top.jsp" %></td>
		</tr>
		<tr bgcolor="">
			<td>
				<form action="/board/boardRegProc.do" method="post">
				<div align="center">
				<table border="1">
					<tr style="text-align:center">
					<td style="width:50px">제목</td>
					<td style="width:500px">내용</td>
					<td style="width:50px">작성자</td>
					</tr>
					<tr style="height:300px; text-align:center">
					<td><textarea name="title" style="height:300px"></textarea></td>
					<td><textarea name="contents" style="height:300px; width:500px"></textarea></td>
					<td><textarea name="user_in" style="height:300px"></textarea></td>
					</tr>			
					<tr ><td colspan="3"><input type="submit" value="글쓰기" style="float:right; width:150px"/></td></tr>								
				</table>
				</div>
					
				</form>
			</td>
		</tr>
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>
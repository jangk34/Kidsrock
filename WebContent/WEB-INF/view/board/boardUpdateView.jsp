<%-- <%@page import="poly.dto.BoardDTO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
%>
<html>
<head>
<title>WEB!</title>
</head>
<body>
	<table style="height: 100%; width: 100%">
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/top.jsp" %></td>
		</tr>
		<tr>
			<td>
				<div align="center" style="width:100%;">
					<form action="/board/boardUpdateProc.do" method="post">
					<table border="1" style="text-align:center">
					<tr height="20px">
						<!-- 회원번호를 전송하기 위해 hidden 폼 사용 -->
						<input type="hidden" name="notice_seq" value="<%=bDTO.getNotice_seq() %>" /> <!-- db에서 찾아야하는 기본키이기때문에 존재해야함 --> 
						<td width="50px">작성번호</td>
						<td>제목</td> 
						<td>내용</td> 
						
						<td>작성자</td> 
						</tr>
						
						<tr height="200px">
						 <td><%=bDTO.getNotice_seq()%></td>
						 <td ><input type="text" name="title" value="<%=bDTO.getTitle()%>" style="height:300px"/></td>
						 <td ><input type="text" name="contents" value="<%=bDTO.getContents()%>" style="height:300px" /></td>
						 
						 
						 <td><%=bDTO.getUser_name()%></td>
						</tr>
					</table>
					<input type="submit" value="글수정하기" />	
					</form>			
				
				</div>	
					
			</td>
			
		</tr>
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>
 --%>
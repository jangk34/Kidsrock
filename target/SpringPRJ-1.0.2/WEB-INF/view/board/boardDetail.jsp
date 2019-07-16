<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("euc-kr");
	BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO");
%>


<script type="text/javascript">
	/* 회원삭제페이지를 불러오기 위한 함수작성 */
	function boardDelete(writer_In){ //회원번호가 인자 값
		location.href="/board/boardDelete.do?notice_seq=" + writer_In; 
		//Get방식으로 회원번호 값과 함께 Controller로 이동
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table style="height: 100%; width: 100%;">
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/top.jsp" %></td>
		</tr>
		<tr bgcolor="">
			<td>
				<!-- 상세화면 -->
				<div align="center">
				<table border="1" >
					<tr style="height:50px; text-align:center">
					<td>작성번호</td>
					<td>제목</td>
					<td>내용</td>
					<td>작성자번호</td>
					<td>이름</td>
					</tr>
					<tr style="height:300px; text-align:center" >
					<td><%=bDTO.getNotice_seq() %></td>
					<td><%=bDTO.getTitle() %></td>
					<td><%=bDTO.getContents() %></td>
					<td><%=bDTO.getUser_in() %></td>
					<td> <%=bDTO.getUser_name() %></td>
					</tr>
				</table>	
					<button onclick="boardDelete('<%=bDTO.getNotice_seq()%>');">글 삭제하기</button>
					
					<a href="boardUpdateView.do?notice_seq=<%=bDTO.getNotice_seq()%>">글 수정</a>
					
					</div>

</body>
</html>
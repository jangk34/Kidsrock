<%@page import="poly.dto.BoardDTO"%>        
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<BoardDTO> bList = (List<BoardDTO>)request.getAttribute("bList"); /* uList라는 변수를 가져옵니다. List<UserDTO>형식으로 캐스팅 후 저장합니다. */
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<table style="height: 100%; width: 100%">   
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/top.jsp" %></td>
		</tr>
		<tr bgcolor="">
			<td>
				<!-- 회원 목록 테이블  -->
				<div align="center" style="text-align:center;">
					 <table border="1" style="width:88%; ">
					 	<tr style="bgcolor:SlateBlue;">
					 		<td>작성번호 </td>
					 		<td>제목</td>
					 		<td>작성자번호</td>
					 		<td>작성자</td>
					 	</tr>
					 	<% for(int i = 0; i < bList.size(); i++) { %> <!-- 전달받은 변수의 사이즈에 맞게 반복문 실행 -->
					 	<tr> <!-- 아이디 클릭시 회원상세정보로 이동 -->
					 		<td>
					 			<%=i+1 %></td> <!-- getUser_no메소드를 이용해 값 출력  -->
					 		<td><a href="boardDetail.do?notice_seq=<%=bList.get(i).getNotice_seq()%>"><%=bList.get(i).getTitle() %></a></td> <!-- getId()메소드를 이용해 값 출력  -->
					 		
					 		<td><%=bList.get(i).getUser_in() %></td> <!-- getAge()메소드를 통해 나이 출력 -->
							<td><%=bList.get(i).getUser_name() %></td>
							 	
					 		</tr>
					 	<%} %>
					 	<tr>
					 	<td colspan="4"><a href="boardReg.do" style="float:right">글쓰기</a>
					 	</td>
					
					 	</tr>
					 </table>
				</div>
				<!-- 회원 목록 테이블 끝 -->
			</td>
		</tr>
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/bottom.jsp" %></td>
		</tr>
	</table>

</body>
</html>
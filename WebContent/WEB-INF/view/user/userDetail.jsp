<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.NoticeDTO" %>
<%@page import="poly.dto.UserDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("euc-kr");
	UserDTO uDTO = (UserDTO)request.getAttribute("uDTO");
	NoticeDTO nDTO = (NoticeDTO)request.getAttribute("nDTO");
%>

<script type="text/javascript">
	/* 회원삭제페이지를 불러오기 위한 함수작성 */
	function userDelete(userNo){ //회원번호가 인자 값
		location.href="/user/userDelete.do?userNo=" + userNo; 
		//Get방식으로 회원번호 값과 함께 Controller로 이동
	}
</script>

<html>
<head>
<title>WEB!</title>
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
					user_no: <%=uDTO.getUserNo() %> <br />
					id: <%=uDTO.getEmail() %> <br />
					password: <%=uDTO.getPassword() %><br />
					Name: <%=uDTO.getName() %><br />
					<!-- 회원삭제버튼 -->
					<button onclick="userDelete('<%=uDTO.getUserNo()%>');">삭제하기</button>
					<!-- userDelete함수를 호출, 인자 값으로 회원번호-->
					
					<!-- 회원 수정 버튼 -->
					<a href="userUpdateView.do?userNo=<%=uDTO.getUserNo()%>">회원 정보 수정</a>
					</div>
				
			</td>
		</tr>
		<tr height="7%" bgcolor="#00D8FF">
			<td><%@include file="/WEB-INF/view/bottom.jsp" %></td>
		</tr>
	</table>
</body>
</html>
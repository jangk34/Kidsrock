<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	String email = CmmUtil.nvl((String)session.getAttribute("email")); //세션에 저장된 id값을 새 변수에 저장
	String nick = CmmUtil.nvl((String)session.getAttribute("nick")); //세션에 저장된 name값을 새 변수에 저장
%> --%>
<script type="text/javascript">
	function logout() {
		location.href="/main.do";
	}
</script>



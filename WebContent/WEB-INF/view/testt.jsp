<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*,javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"&gt;
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Test</title>
</head>
<body>
<%
//	out.println("This is index.jsp of Test project with Eclipse, Tomcat5.5");
%>
<%
String url="jdbc:mysql://localhost/jangdb?useUnicode=true&characterEncoding=utf-8";
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection(url,"JangPro","admin");
Statement stmt=conn.createStatement();
String SQL = "Select no,name from testTbl";
ResultSet rs = stmt.executeQuery(SQL);
out.println( SQL+ "<BR><BR>");
while (rs.next()) {
out.println("NO   : "  + rs.getInt(1) + "<BR>");
out.println("NAME : "  + rs.getString(2));
}
stmt.close();
conn.close();
%>
</body>
</html>
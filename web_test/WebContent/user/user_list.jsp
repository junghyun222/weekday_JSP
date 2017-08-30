<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String url = "jdbc:mysql://localhost:3306/jsp_study";
String id = "root";
String pwd = "r1r2r3";
Connection con;
Statement st;
try {
	Class.forName("org.mariadb.jdbc.Driver");
	con = DriverManager.getConnection(url,id,pwd);
	System.out.println("연결 성공");
	st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from user");
	out.println("<table border='1'>");
	while(rs.next()) {
		out.println("<tr>");
		out.println("<td>");
		out.print(rs.getString("user_no"));
		out.println("</td>");
		out.println("<td>");
		out.print(rs.getString("id"));
		out.println("</td>");
		out.println("<td>");
		out.print(rs.getString("password"));
		out.println("</td>");
		out.println("<td>");
		out.println(rs.getString("name"));
		out.println("</td>");
		out.println("</tr>");
	}
	out.println("</table>");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
}
%>
</body>
</html>
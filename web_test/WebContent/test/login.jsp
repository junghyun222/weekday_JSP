<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- html주석 -->
<%
//java주석1
/*
java주석2
*/
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String addr = request.getParameter("addr");

out.println("입력하신 아이디는" + id + "입니다.<br>");
out.println("입력하신 비밀번호는" + pwd + "입니다.<br>");
out.println("입력하신 주소는" + addr + "입니다.<br>");

String clientIp = request.getRemoteAddr();
String method = request.getMethod();
%>
클라이언트 IP 는 <%=clientIp %>입니다.<br>
클라이언트 메소드 방식은 <%=method %>입니다.<br>
</body>
</html>
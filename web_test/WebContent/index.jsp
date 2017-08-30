<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("user")==null){
	response.sendRedirect("/user/login.jsp");
}else{
	Map<String, String> user = (Map)session.getAttribute("user");
	out.println(user.get("name") + "님 환영합니다.");
}

%>
</body>
</html>
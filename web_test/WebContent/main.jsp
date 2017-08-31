<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("user")!=null){
	Map<String, String> user=(Map)session.getAttribute("user");	
	String id = user.get("id");
	String name = user.get("name");
	String user_no = user.get("user_no");
	String hobby = user.get("hobby");
	String admin = user.get("admin");

%>
<%=user_no%>번째로 가입하신 <br>
<%=id %>님 반갑습니다<br>
<%=name %>이란 이름이 멋지군여<br>
<%=name %>의 취미는 <%=hobby %> 이군요

<form action="logout.user" method="post" id="btnForm">
<input type="button" value="로그아웃" data-url="/logout.user">
<input type="button" value="회원탈퇴" data-url="/delete.user">
<input type="button" value="회원정보수정" data-url="/modify.user">
<input type="button" value="게시판가기" data-url="/board/board_list.jsp">
<%
if(admin.equals("1")){
%>
<input type="button" value="회원리스트" data-url="/list.jsp">
<input type="button" value="회원리스트(옛방식)" data-url="/list.user">
<%
}
%>
<input type="hidden" name="command" id="command" value="logout">
</form>
<script>
$("input").click(function(){
	var url=this.getAttribute("data-url");
	if(url.split(".")[1]=="user"){
		$("#command").val(url.split(".")[0].replace("/",""));
		this.form.submit();
	}else{
		location.href=url+"?user_no=<%=user_no%>";			
	}
})
</script>
<%
}else{
	response.sendRedirect("/login.jsp");
}
%>
</body>
</html>
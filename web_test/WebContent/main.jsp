<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<title>Insert title here</title>
</head>
<!-- <script>
$(document).ready(function(){
	$("input[type='button']").click(function(){
		var value = this.value;
		if(value=="회원탈퇴"){
			$("#command").val("delete");
		}else if(value=="회원정보수정"){
			location.href = "/user/update.jsp";
			return;
		}else if(value=="회원리스트"){
			location.href = "/user/list.jsp";
			return;
		}
		this.form.submit();
	})
})
</script> -->
<body>
<%
if(session.getAttribute("user")!=null){
	Map<String, String> user=(Map)session.getAttribute("user");	
	String id = user.get("id");
	String user_no = user.get("user_no");
	String name = user.get("name");
	String hobby = user.get("hobby");

%>
<%=user_no%>번째로 가입하신 <br>

<form action="some.user" method="post">
<input type="button" value="로그아웃">
<input type="button" value="회원탈퇴">
<input type="button" value="회원정보수정">
<input type="button" value="회원리스트">
<input type="hidden" name="command" id="command" value="logout">
<input type="hidden" name="userNo" value="<%=userNo%>">
</form>
<script>
$("input").click(function(){
	var url=this.getAttribute"data-url");
	if(url.split(".")[1]=="user"){
		$("#command").val(url.split(".")[0].replace("/",""));
		this.form.submit();
	}else{
		location.href=url+"?user_no=<%=user_no%>";			
	}
})
</script>
<%
}
%>
</body>
</html>
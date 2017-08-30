<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "/common/header.jsp"%>
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	$("form[action='list.user']").submit();
});
</script>
<body>
<form action="list.user" method="post">
<input type="hidden" name="command" value="list">
</form>
</body>
</html>
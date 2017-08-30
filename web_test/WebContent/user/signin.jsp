<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<script>
$(document).ready(function(){
$("input[type='button']").click(function(){
	var params = {};
	params["id"]=$("#id").val();
	params["pwd"]=$("#pwd").val();
	params["name"]=$("#name").val();
	params["admin"]=$("#admin").val();
	params = JSON.stringify(params);
	var hobby =$('input[name="hobby"]:checked'].map(function()){
		return $(this).val();
	}).toArray();
	params["hobby"]=hobby.toString
	alert(params);
	var param = endcodeURI("?command=signin&param="+params);
	var au=new AjaxUtil(params);
	au.send();
})
})
</script>
<body>
<form action="sigin.user" method="post">
<table border="1">
	<tr>
		<td colspan="2" align="center">회원가입</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" id="id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd" id="pwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td>취미</td>
		<td>
			수면<input type="checkbox" name="hobby" value="수면">
			음악<input type="checkbox" name="hobby" value="음악">
			영화<input type="checkbox" name="hobby" value="영화">
			게임<input type="checkbox" name="hobby" value="게임">
			요리<input type="checkbox" name="hobby" value="요리">
			여행<input type="checkbox" name="hobby" value="여행">
		</td>
	</tr>
		<tr>
		<td align="center"> 관리자여부</td>
		<td>
		<select name="admin" id="admin">
		<option value ="1">Y</option>
		<option value ="0">N</option>
		</select>
	<tr>
		<td colspan="2" align="center"><input type="button" value="회원가입"></td>
	</tr>
</table>
<input type="hidden" name="command" value="signin">
</form>
</body>
</html>
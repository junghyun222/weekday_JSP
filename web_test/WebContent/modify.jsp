<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>    
<title>Insert title here</title>
</head>
<body>
<%
String userNo =request.getParameter("userNo"); //modify는 userNo정보를 가지고 있어야 함.
/* Map<String, String> user=(Map)session.getAttribute("user") */
%>
<script>
function callback(result){// 서버갔다와선 무조건 얘가 실행됨
	alert(result);
	$("#id").val(result.id);
	$("#name").val(result.name);
	var hobbies =result.hobby.split(",");// 회원가입시 입력한 정보 그대로임.게임,수면 처럼
	for(var i=0,max=hobbies.length;i<max;i++){//화면에 뿌려줌
		$("input[value='"+hobbies[i]+"']").prop("checked",true);//게임, 수면찾아서 체크박스에 체크함
	}
	$("#userNo").val)(result.user_no))
}
$(document).ready(function() {
	var param ="?command=view&userNo=<%=userNo%>";
	param=encodeURI(param);
	var au=new AjaxUtil(param);
	au.changeCallBack(callback);   //script는function 안에 function을 넣을수있음 vs자바는 클래스 안에 클래스 넣을수있다
	au.send();
})
</script>]
<form action="sigin.user" method="post">
<table border="1" cellspacing="0" cellpadding="0" width="400" align="center">
<tr>
	<td colspan="2"><p align="center"> = 회원정보수정 = </p></td>
</tr>
<tr>
	<td align="center">아이디</td>
	<td><input type="text" name="id" id="id" /></td>
</tr>
<tr>
	<td align="center">비밀번호</td>
	<td><input type="password" name="pwd" id="pwd" maxlength="100"/></td>
</tr>
<tr>
	<td align="center">이름</td>
	<td><input type="text" name="name" id="name" maxlength="100"/></td>
<tr>
<tr>
	<td align="center">취미</td>
	<td>
		<%-- 잠자기<input type="checkbox" name="hobby" <%-- value="잠자기" <%=user.get("hobby").indexOf("잠자기)!=-1?"checked":""%>>  --%>  <!--  3항 연산자사용,   indextOf는 -->
		게임<input type="checkbox" name="hobby"<%-- value="게임"  <%=user.get("hobby").indexOf("잠자기)!=-1?"checked":""%> --%>>
		독서<input type="checkbox" name="hobby"<%-- value="독서"  <%=user.get("hobby").indexOf("잠자기)!=-1?"checked":""%> --%>>
		음악<input type="checkbox" name="hobby"<%-- value="음악"  <%=user.get("hobby").indexOf("잠자기)!=-1?"checked":""%>> --%> --%>
	</td>
</tr>
<tr>
	<td colspan="2" align="center"><input type="submit" value="회원정보수정" /></td>
</tr> 
</table>
<input type="hidden" name="command" id="command" value="modify"/><br/>
</form>
</body>
</html>
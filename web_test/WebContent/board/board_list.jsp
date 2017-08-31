<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@iclude file="/common/header.jsp" %>

<title>테스트 게시판</title>
</head>
<body>
<script>
function callback(result){
	alert(result.list);
	var boardList=result.list;
	var str= "<table border='1'>";
	str+="<tr>";
	str+="<td>제목</td>";
	str+="<td>내용</td>";
	str+="<td>게시일자</td>";
	str+="<td>게시자</td>";
	str+="</tr>";
	for(var i=0, max=boardList.length;i<max;i++){
		var board =boardList[i];
		str+="<tr>";
		str+="<td>+board.b_num+</td>";
		str+="<td>+board.title+</td>";
		str+="<td>+board.content+</td>";
		str+="<td>+board.req_date+</td>";
		str+="<td>+board.writer+</td>";
		str+="</tr>";
	}
	$()
}
$(document).ready(function(){
	var param ="?command=list"
	var au =new AjaxUtil(param,"list.board")
	au.changeCallBack(callback);
	au.send();
})

</script>
</body>
</html>
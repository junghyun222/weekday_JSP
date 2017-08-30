<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>
</head>
<body>
<form action="write.board" method="post">
	<table>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" id="title"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" id="content"></textarea></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="writer" id="writer"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="게시글 올리기"/></td>
		</tr>
	</table>
	<input type="hidden" name="command" value="write">
</form>
</body>
</html>
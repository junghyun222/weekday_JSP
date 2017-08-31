<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- modify에서 잘라서 가져옴 -->
<%
String rootPath=request.getContextPath();
//context경로 바뀌어도 절대경로 rootPath 로 설정해주면 일일이 바꿔주지 않아도됨, 
//modify파일의 스크립트 구문script src="/js/jquery-3.2.1.min.js"></script> 잘라서 가져옴
if(session.getAttribute("user")==null){      //로그인에 실패한경우
	RequestDispatcher dis=request.getRequestDispatcher("/login.jsp"); 
	dis.forward(request,response); //sendRedirect대신 url주소를 변동시키지 않으면서 화면을 이동시킴
//	response.sendRedirect("/login.jsp"); 이것대신 위에두줄
}
%>
<script src="<%=rootPath %>/js/jquery-3.2.1.min.js"></script> 
<script>
var AjaxUtil = function(params,p_url) {
	this.params = params;
 
	getHttpXmlObj = function() {
		if (window.XMLHttpRequest) {
			return new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
	}
	this.xhr = getHttpXmlObj();
	var method = "post";
	var url=p_url?p_url:"test.user";
//	var url = "test.user";
	var aSync = true;
	this.xhr.callfunc = null;
	this.xhr.onreadystatechange = function() {
		if (this.readyState == 4) {
			if (this.status == 200) {
				var result = decodeURIComponent(this.responseText);
				var re = JSON.parse(result);
				if(this.callfunc){
					this.callfunc(re);
				}else{
					alert(re.msg);
					location.href=re.url;
				}
			}
		}
	}
	this.changeCallBack = function(func) {
		this.xhr.callfunc = func;
	}
	this.xhr.open(method, url + params, aSync);
	this.send = function() {
		this.xhr.send.arguments = this;
		this.xhr.send(params);
	}
}

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저리스트</title>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
	var AjaxUtil = function(params) {
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
		var url = "test.user";
		var aSync = true;
		this.xhr.onreadystatechange = function() {
			if (this.readyState == 4) {
				if (this.status == 200) {
					var result = decodeURIComponent(this.responseText);
					$("#result_div").html(result);
					setEvent();
				}
			}
		}
		this.changeCallBack = function(func) {
			this.xhr.onreadystatechange = func;
		}
		this.xhr.open(method, url + params, aSync);
		this.send = function() {
			this.xhr.send.arguments = this;
			this.xhr.send(params);
		}
	}
	
	function setEvent() {
		$("input[type='button']").click(function() {
			var url = this.getAttribute("data-url");
			if(url.split(".")[1]=="user"){
				var param = "?command=list&name="+$("#name").val();//?왼쪽에는 요청,?오른쪽에는 키밸류&?왼쪽에는 요청,?오른쪽에는 키밸류
				var au = new AjaxUtil(param);
				au.send();
			}
		}else{
			var userNum =this.getAttribute("data-nam");
			if(this.getAttribute("value")=="수정"{     //수정버튼 눌렀을때 modify화면으로 이동하게
				location.href="/modify.jsp?userNo="+userNo;
				}else if(this.getAttribute("value")=="삭제"){
					var param = "?command=delete&userNo="+userNo;
					var au =new  AjaxUtil(param);
					au.send();					
				}	
			}
		});
	}

	$(document).ready(function() {
		var param = "?command=list";
		var au = new AjaxUtil(param);
		au.send();
	})
</script>
</head>
<body>
	<div id="result_div"></div>
	이름 : <input type="text" name="name" id="name">
	<input type="button" value="검색" data-url="search.user">
</body>
</html>
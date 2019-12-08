<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String commandName = "/MiniShopCtrl";
	
	//Form에서 사용할 변수
	//contextPath = /ModelTWO/MiniShopCtrl
	String MyCtrlByForm = contextPath + commandName;
	String MyCtrlCommand = MyCtrlByForm + "?command=";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String contextPath = request.getContextPath();
	out.print(contextPath);
	response.sendRedirect(contextPath + "/hello");
%>
</body>
</html>
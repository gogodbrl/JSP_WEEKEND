<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String redirectPath = request.getParameter("redirectPath");
	String contactPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	에러페이지 입니다. ㅈㅅㅈㅅ <br>
	<a href="<%=contactPath+"/"+redirectPath %>.jsp">돌아갓</a>
</body>
</html>
<%@ page import="Bean.JstlMember" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	JstlMember member = new JstlMember();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:set var="xxx" value="<%=member %>"/>
	<c:set target="${xxx}" property="name" value="강감찬"/>
	<c:set target="${xxx}" property="age" value="30"/>
	출력하기<br>
	${xxx.name}<br>
	${xxx.age}<br>
</body>
</html>
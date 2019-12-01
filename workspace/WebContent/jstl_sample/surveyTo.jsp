<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file= "./../common/encoding.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	${param.name}님<br>
	<c:choose>
	<c:when test="${param.greeting==0}">
		처음 뵙겠습니다. <br>
	</c:when>
	<c:when test="${param.greeting==1}">
		오랫만에 뵙습니다.<br>
	</c:when>
	<c:otherwise>
		누구신지요.<br>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${param.fruit ==1}">
		사과를 선택하였음<br>
	</c:when>
	<c:when test="${param.fruit ==2}">
		메론을 선택하였음<br>
	</c:when>
	<c:otherwise>
		바나나를 선택하였음<br>
	</c:otherwise>
	</c:choose>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/encoding.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:set var="odd_result" value="0"/>
	<c:set var="even_result" value="0"/>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${i % 2 == 0}">
			<c:set var="even_result" value="${even_result + i}"></c:set>
		</c:if>
		
		<c:if test="${i % 2 == 1}">
			<c:set var="odd_result" value="${odd_result + i}"></c:set>
		</c:if>
	</c:forEach>
	odd_result : ${odd_result}
	even_result : ${even_result}
</body>
</html>
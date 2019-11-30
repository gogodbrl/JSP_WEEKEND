<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:set var="num1" value="14"/>
	<c:set var="num2" value="5"/>

	<c:set var="result" value="${num1+num2}"/>
	${num1}과 ${num2}의 더하기 = ${result} <br>
	
	<c:set var="result" value="${num1-num2}"/>
	${num1}과 ${num2}의 빼기 = ${result} <br>
	
	<c:set var="result" value="${num1*num2}"/>
	${num1}과 ${num2}의 곱하기 = ${result} <br>
	
	<c:set var="result" value="${num1/num2}"/>
	${num1}과 ${num2}의 나누기 = ${result} <br>
	

</body>
</html>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file= "./../common/encoding.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<%
	HashMap<String, Object> mapData = new HashMap<String, Object>();
	
	mapData.put("name","을지문덕");
	mapData.put("gender","남자");
	mapData.put("age",100);
%>
<body>
<!-- out.print대신 \$\{\}가 쓰이는 느낌 -->
<!-- jstl에 대부분 EL을 같이 쓴다. -->
<!-- param변수는 varibles >> _jspx_page_context(넘어온 데이터) >> attributes >>  HashMap<K,V> 에 저장되어 있다. -->
	<c:set var="dan" value="${param.dan}"/>
	<c:if test="${empty dan}"> ${dan=3} </c:if>
	
	단 : ${dan}<br>
	
	<c:forEach var="i" begin="1" end="9" step="1">
		${i}단 : ${i} * ${dan} = ${dan * i}<br>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="5" step="1">
		<font size=${i}>안녕하세요.</font><br>
	</c:forEach>
	
	<c:forEach var="cnt" begin="1" end="5" step="1">
		${cnt}곱하기 ${cnt}는 ${cnt*cnt}입니다.<br>
	</c:forEach>
	
	<!-- 변형된 for문 -->
	<!-- c:set하면 _jspx_th_c_005fset_005f1라는 임시변수에 저장된다. -->
	<c:set var="map" value="<%=mapData %>"></c:set>
	<c:forEach var="item" items="${map}">
		${item.key} : ${item.value}<br>	
	</c:forEach> 
</body>
</html>
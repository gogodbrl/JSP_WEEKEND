<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file= "./../common/encoding.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- session.setAttribute랑 request.setAttribute랑 햇갈리지 말자 ㅠㅠ !!!!!!!!!!! -->
<%
	request.setAttribute("price", 80808);
	request.setAttribute("discount", 0.2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	원가 : <fmt:formatNumber type="number" value="${price}"></fmt:formatNumber><br>
	할인율 : <fmt:formatNumber type="number" value="${discount}"></fmt:formatNumber><br>
	할인율(%) : <fmt:formatNumber type="percent" value="${discount}"></fmt:formatNumber><br>
	<hr>
	패턴1 : <fmt:formatNumber pattern="#,###,###.00" value="${price}"></fmt:formatNumber><br>
	패턴2 : <fmt:formatNumber pattern="0,000,000.00" value="${price}"></fmt:formatNumber><br>
	<hr>
	<c:set var="sale" value="${price*(1-discount)}"/>
	SalePrice = ${sale}
	<br>
	<c:if test="${sale >= 50000}"> expensive </c:if>
	<c:if test="${sale < 50000}"> cheap </c:if>
</body>
</html>
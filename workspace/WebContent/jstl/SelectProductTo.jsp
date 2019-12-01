<%@page import="Bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file= "./../common/encoding.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- session이랑 sessionScope랑 같은거당 -->
<%
//	List<Product> product = (List<Product>) session.getAttribute("ProductItems");
//	out.print(product);
%>
<%
	if(session.getAttribute("ProductItems") == null && session.getAttribute("ExampleItems") == null ){
		response.sendRedirect("./SelectProduct.jsp");
		return ;
	}
%>
<!-- EL을 쓰려면... scope위에서 돈다고 생각하면 된다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<table border ="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>제목</th>
		<th>단가</th>
		<th>카테고리</th>
	</tr>
	<c:forEach var="product" items="${sessionScope.ProductItems}">
		<tr>
			<td>${product.id}</td>
			<td>${product.name}</td>
			<td>${product.stock}</td>
			<td>${product.price}</td>
			<td>${product.category}</td>
		</tr>
	</c:forEach>
</table>

<table border ="1">
	<tr>
		<th>이름</th>
		<th>수량</th>
		<th>단가</th>
		<th>할인율</th>
		<th>판매금액</th>
		<th>전체금액</th>
	</tr>
	<c:set var="total" value = "0"></c:set>
	<c:forEach var="fruitItem" items="${sessionScope.ExampleItems}">
		<tr>
			<td>${fruitItem.name}</td>
			<td><fmt:formatNumber type="number" value="${fruitItem.stock}"></fmt:formatNumber></td>
			<td><fmt:formatNumber type="number" value="${fruitItem.price}"></fmt:formatNumber></td>
			<td><fmt:formatNumber type="percent" value="${fruitItem.sale}"></fmt:formatNumber></td>
			<td><fmt:formatNumber pattern="##.###" value="${fruitItem.price*(1-fruitItem.sale)}"></fmt:formatNumber></td>
			<c:set var="total_sub" value = "${total_sub = fruitItem.price*(1-fruitItem.sale) * fruitItem.stock}"></c:set>
			<td><fmt:formatNumber type="number" value="${total_sub}"></fmt:formatNumber></td>
			<fmt:formatNumber pattern="#####" value= "${total = total + total_sub}" ></fmt:formatNumber>
		</tr>
	</c:forEach>
	<tr>
			<td>전체가격</td>
			<td colspan="5"><fmt:formatNumber pattern="##.###" value="${total}"></fmt:formatNumber></td>
		</tr>
</table>


</body>
</html>
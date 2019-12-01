<%@page import="Bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file= "./../common/encoding.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ProductDao dao = new ProductDao()와 같은의미임 -->
<jsp:useBean id="dao" class="Dao.ProductDao"></jsp:useBean>
<%
	List<Product> items = dao.GetProductList();
	/** Session에 값을 넣고 ProductItems로 바인딩 하였다. **/
	session.setAttribute("ProductItems", items);
%>

<%
	List<Product> exampleItems = dao.GetProductExample();
	session.setAttribute("ExampleItems", exampleItems);
%>

<%
	response.sendRedirect("SelectProductTo.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
</body>
</html>
<%@page import="Util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String pageNumber = "13";
	String pageSize = "10";
	int totalCount = 250;
	String url = "selectBoardAll.jsp";
		
	Paging pp = new Paging(pageNumber, pageSize, totalCount, url);
	out.print(pp.getPagingHtml(url));
%>
</body>
</html>
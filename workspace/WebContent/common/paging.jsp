<%@page import="Util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	String pageNumber = request.getParameter("pageNumber");
	String pageSize = request.getParameter("pageSize");
	int totalCount = 13;
	String url = "../board/selectBoardAll.jsp";
		
	Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
%>
</body>
</html>
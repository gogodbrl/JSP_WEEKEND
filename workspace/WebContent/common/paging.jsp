<%@page import="Util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	//String pageNumber = "13";
	//String pageSize = "10";
	//int totalCount = 250;
	//String url = "../board/selectBoardAll.jsp";
	
	String pageNumber = request.getParameter("pageNumber");
	String pageSize = request.getParameter("pageSize");
	int totalCount = 13;
	String url = "../board/selectBoardAll.jsp";
		
	Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
	//out.print(pageInfo.getPagingHtml(url));
%>
</body>
</html>
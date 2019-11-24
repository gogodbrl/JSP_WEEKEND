<%@page import="Dao.BoardDao"%>
<%@page import="Util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	BoardDao dao = new BoardDao();
	String pageNumber = request.getParameter("pageNumber");
	String pageSize = request.getParameter("pageSize");
	int totalCount = dao.SelectTotalUploadCount();
	String url = "../board/selectBoardAll.jsp";
		
	Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
%>
</body>
</html>
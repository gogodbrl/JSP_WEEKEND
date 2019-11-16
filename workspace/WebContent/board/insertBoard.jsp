<%@page import="Bean.Board"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao();

	request.setCharacterEncoding("utf-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	Board bean = new Board();
	bean.setSubject(subject);
	bean.setWriter(writer);
	bean.setContent(content);
	
	dao.InsertBoard(bean);
%>
<%
	response.sendRedirect("selectBoardAll.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

</body>
</html>
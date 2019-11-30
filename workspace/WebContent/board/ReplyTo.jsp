<%@page import="Bean.Board"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao();

	request.setCharacterEncoding("utf-8");
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	int groupno = Integer.parseInt(request.getParameter("groupno"));
	int orderno = Integer.parseInt(request.getParameter("orderno"));
	int depth = Integer.parseInt(request.getParameter("depth"));
	
	Board bean = new Board();
	bean.setSubject(subject);
	bean.setWriter(writer);
	bean.setContent(content);
	bean.setGroupno(groupno);
	bean.setOrderno(orderno);
	bean.setDepth(depth);
	
	int cnt = dao.InsertReplyBoard(bean);
	if(cnt > 0) { 
		response.sendRedirect("selectBoardAll.jsp");
	} else {
		out.print("DB INSERT 실패 - 3초후 이동");
		out.print("<meta http-equiv='refresh' content='3; url=./selectBoardAll.jsp'>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

</body>
</html>
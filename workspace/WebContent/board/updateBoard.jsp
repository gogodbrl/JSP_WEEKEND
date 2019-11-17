<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="Bean.Board"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/** GET ENCODING UTF-8 **/
	request.setCharacterEncoding("utf-8");

	/** GET PARAM **/
	int no = Integer.parseInt(request.getParameter("no"));
	String subject = request.getParameter("subject");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	if("null".equalsIgnoreCase(regdate)){
		Date date = new Date();
		regdate = new SimpleDateFormat("yyyyMMdd").format(date);
	}
	Board board = new Board();
	board.setNo(no);
	board.setSubject(subject);
	board.setWriter(writer);
	board.setContent(content);
	board.setRegdate(regdate);
	
	/** DB UPDATE **/
	BoardDao dao = new BoardDao();
	int cnt = dao.UpdateBoard(board);
	if(cnt > 0) { 
		response.sendRedirect("selectBoardAll.jsp");
	} else {
		out.print("DB UPDATE 실패 - 3초후 이동");
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
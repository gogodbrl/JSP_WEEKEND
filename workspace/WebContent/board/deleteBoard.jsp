<%@page import="Define.Define"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String noStr = request.getParameter("no");
	if(noStr == null || "null".equalsIgnoreCase(noStr)) { 
		out.print("게시글 번호값이 null 입니다.");
		out.print("<meta http-equiv='refresh' content='3; url=./selectBoardAll.jsp'>");
		return ;
	}
	int no = Integer.parseInt(noStr);
	
	/** 여기에서 진짜 삭제하냐는 팝업창을 어떻게 띄우지? **/
			
	BoardDao dao = new BoardDao();
	int cnt = dao.DeleteBoard(no);
	
	String pageNumber = request.getParameter("pageNumber");
	String pageSize = request.getParameter("pageSize");
	
	if(cnt > 0) { 
		response.sendRedirect(String.format("./selectBoardAll.jsp?pageNumber=%s&pageSize=%s", pageNumber, pageSize));	
	} else {
		out.print("DB DELETE 실패 - 3초후 이동");
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
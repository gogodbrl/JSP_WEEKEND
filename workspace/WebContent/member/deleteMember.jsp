<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	/** 여기에서 진짜 삭제하냐는 팝업창을 어떻게 띄우지? **/

	MemberDao dao = new MemberDao();
	int cnt = dao.DeleteMember(id);
	
	if(cnt > 0) { 
		response.sendRedirect("selectMemberAll.jsp");
	} else {
		out.print("DB DELETE 실패!!!!");
		Thread.sleep(3000);
		response.sendRedirect("selectMemberAll.jsp");
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
<%@page import="Bean.Member"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	
	MemberDao dao = new MemberDao();
	Member bean = dao.GetLoginInfo(id, name);
	if(bean == null) {
		/** 로그인 실패 **/
		out.print("로그인 실패");
	} else {
		/** 1. 세션에 저장 - 신기하네 세션에 bean객체를 저장하네 
			2. 세션은 내장객체임.
			3. 지금 세션 이름은 loginInfo이고 그 안에 내용은 bean이라고 저장한다는 의미임
		**/
		session.setAttribute("loginInfo", bean);
		response.sendRedirect("./../member/selectMemberAll.jsp");
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
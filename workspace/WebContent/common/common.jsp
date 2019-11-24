<%@page import="Bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Member loginInfo = (Member) session.getAttribute("loginInfo");
	String user = "";
	if(loginInfo == null ){ user = "미로그인"; } 
	else { user = loginInfo.getName() + "(" + loginInfo.getId() + ")님"; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% if(loginInfo == null) { %>
	<a href="./../login/loginForm.jsp">로그인</a>
<%	} else { %>
	로그인 정보 : <%=user %> <a href="./../login/logout.jsp">로그아웃</a>
<%	} %>
</body>
</html>
<%@page import="Bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Member loginInfo = (Member) session.getAttribute("loginInfo");
	String user = "";
	if(loginInfo == null ){ user = "미로그인"; } 
	else { user = loginInfo.getId() + "님"; }
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	로그인 정보 : <%=user %>
	<br><br>
	<a href="./../member/logout.jsp">로그 아웃</a>
</body>
</html>
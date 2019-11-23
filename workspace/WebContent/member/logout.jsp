<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<% 
	/** session clear **/
	session.invalidate();
	/** 로그인 페이지 **/
	response.sendRedirect("loginForm.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

</body>
</html>
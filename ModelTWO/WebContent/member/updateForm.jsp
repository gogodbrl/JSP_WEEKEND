<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="<%=MyCtrlByForm %>" method="post">
		<input type="hidden" name="command" value="meUpdate">
		<input type="hidden" name="id" value="${requestScope.member.id}">
		
		아이디 : ${requestScope.member.id}<br>
		이름 : <input type="text" name="id" value="${requestScope.member.name}"><br>
		패스워드 : <input type="password" name="password" value=""><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>
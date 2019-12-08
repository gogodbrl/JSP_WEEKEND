<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="<%=MyCtrlByForm %>" method="post">
		<input type="hidden" name="command" value="meLogin">
		아이디 : <input type="text" name="id" value="hong"><br>
		패스워드 : <input type="password" name="password" value="1234"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>
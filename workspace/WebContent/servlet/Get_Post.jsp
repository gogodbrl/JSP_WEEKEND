<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="<%=request.getContextPath() %>/myCaller" method="get">
		<input type="text" name="name" value="김민수">
		<input type="submit" value="get 방식">
	</form>
	
	<form action="<%=request.getContextPath() %>/myCaller" method="post">
		<input type="text" name="name" value="박영희">
		<input type="submit" value="post 방식">
	</form>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${requestScope.member.id}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${requestScope.member.name}</td>
		</tr>
		<tr>
			<td>비밀 번호</td>
			<td>${requestScope.member.password}</td>
		</tr>
	</table>
</body>
</html>
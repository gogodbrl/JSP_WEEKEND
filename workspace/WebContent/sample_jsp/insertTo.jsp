<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/**
		내장객체로써 form에서 action에 insertTo.jsp가 오면 사용자가 입력한 값이 담겨서 온다.
	**/
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	//String salary = request.getParameter("salary");
	int salary = Integer.parseInt(request.getParameter("salary")) + 10;
	String hiredate = request.getParameter("hiredate");
	String address = request.getParameter("address");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<table border="1">
		<tr>
			<td>아이디</td>
		
			<td><%=id %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>급여</td>
			<td><%=salary %></td>
		</tr>
		<tr>
			<td>입사일자</td>
			<td><%=hiredate %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=address %></td>
		</tr>
	</table>
</body>
</html>
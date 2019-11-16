<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/** 
		1. 이 문법을 스크립트 릿(Scriptlit)이라고 한다. 
		2. request와 out등은 servlet 내장객체로 제공한다.
		3. out은 스크립트 릿에서 print하는 방법이다.
		4. html 코드안에 사용하기 위해서는 표현식을 사용한다.
		5. insertTo.jsp를 form으로 넘길 때 같이 데이터가 넘어온다고 보면 된다.
	**/
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String salary = request.getParameter("salary");
	String hiredate = request.getParameter("hiredate");
	String address = request.getParameter("address");
	//out.print( id + "<br>");
	//out.print( name + "<br>");
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
			<!-- 
				1. 아래 태그를 쓰면 태그에 스크립트릿에서 가져온 값을 사용할 수 있다.
			 	2. 이 문법을 표현식이라고 한다(Expression) 
			 -->
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
	어서 오세요.
</body>
</html>
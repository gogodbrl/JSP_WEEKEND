<%@page import="Bean.Member"%>
<%@page import="java.util.List"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	/** SELECT ALL로 조회한다.
	**/
	MemberDao dao = new MemberDao();
	List<Member> memberList = dao.SelectMemberAll();
%>
<h3>회원 목록 보기</h3>
<table border ="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>급여</td>
		<td>입사날짜</td>
		<td>주소</td>
	</tr>

	<!-- 이렇게 스크립트릿을 사용하면 값을 리스트로 출력 가능하다. -->
	<% for(Member member : memberList) { %>
	<tr>
		<!-- 1. 아래 태그를 쓰면 위에서 가져온 스크립트릿에서 가져온 값을 사용할 수 있다.
			 2. 이 문법을 표현식이라고 한다(Expression) -->
		<td><%=member.getId() %></td>
		<td><%=member.getName() %></td>
		<td><%=member.getSalary() %></td>
		<td><%=member.getHiredate() %></td>
		<td><%=member.getAddress() %></td>
	</tr>
	<% } %>
</table>
</body>
</html>
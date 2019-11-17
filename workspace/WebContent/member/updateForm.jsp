<%@page import="Bean.Member"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao();
	
	Member bean = dao.SelectMemberOne(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>회원 수정</h3>
<form action= "updateMember.jsp" method="post">
	<!-- 이렇게 적으면 페이지에는 안보이게 값을 숨겨서 적을 수 있다. -->
	<input type="hidden" name="id" value="<%=bean.getId() %>">
	<table>
		<tr>
			<th>아이디</th>
			<!--  이렇게 하면 DB에서 가져온 이름이 그대로 들어가있다. -->
			<td><%=bean.getId() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<!--  이렇게 하면 DB에서 가져온 이름이 텍스트 박스에 그대로 들어가있다. -->
			<td><input type="text" name="name" value="<%=bean.getName() %>"></td>
		</tr>
		<tr>
			<th>급여</th>
			<td><input type="text" name="salary" value="<%=bean.getSalary() %>"></td>
		</tr>
		<tr>
			<th>입사일자</th>
			<td><input type="text" name="hiredate" value="<%=bean.getHiredate() %>"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" value="<%=bean.getAddress() %>"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="전송">
				<a href="javascript:history.go(-1)"><input type="button" value="뒤로가기"></a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./../common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>수정</th>
			<th>탈퇴</th>
		</tr>
		<c:forEach items="${requestScope.lists}" var="member">
			<tr>
				<td>${member.id}</td>
				<td>${member.name}</td>
				<td>${member.password}</td>
				<td>
					<a href="<%=MyCtrlCommand%>meUpdateForm">수정</a>
				</td>
				<td>
					<a href="<%=MyCtrlCommand%>meDelete&id=${member.id}">탈퇴</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
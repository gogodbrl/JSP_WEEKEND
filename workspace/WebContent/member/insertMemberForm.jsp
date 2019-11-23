<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 
	insertForm.jsp -> insertBoard.jsp -> selectMemberAll.jsp 
-->
<form action= "insertMember.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>급여</td>
			<td><input type="text" name="salary"></td>
		</tr>
		<tr>
			<td>입사일자</td>
			<td><input type="text" name="hiredate"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
				<a href="javascript:history.go(-1)"><input type="button" value="뒤로가기"></a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
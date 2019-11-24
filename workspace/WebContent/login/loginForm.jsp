<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 다른 JSP파일을 포함시키려면 include 지시어를 사용하면 된다. -->
<%@include file= "./../common/encoding.jsp" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	</head>
	<body>
		<form action="loginTo.jsp" method="post">
		<h1>로그인 화면</h1>
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<!-- 아이디하고 이름이 똑같으면 로그인 되도록 처리하였음 -->
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="전송">
						<input type="reset" value="취소">				
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
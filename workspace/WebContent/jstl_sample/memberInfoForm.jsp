<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form action= "memberInfo.jsp" method="post">
	<h1>회원 정보 전송</h1>
	<table border="1">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="제시카"></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" value="20"></td>
		</tr>
		<tr>
			<td>몸무게</td>
			<td><input type="text" name="weight" value="70"></td>
		</tr>
		<tr>
			<td>키</td>
			<td><input type="text" name="height" value="175"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" name="gender" value="여자"></td>
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
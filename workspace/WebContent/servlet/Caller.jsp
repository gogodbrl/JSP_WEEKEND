<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h1>설문지 조사</h1>
	<form action="<%=request.getContextPath()%>/aaa.do" method="post">
		귀하의 성별은 ?
		<input type="radio" name="gender" value="남자">남자
		<input type="radio" name="gender" value="여자">여자
		<br>
		좋아하는 가수는?
		<input type="radio" name="singer" value="1">박진영
		<input type="radio" name="singer" value="2">에이 핑크
		<input type="radio" name="singer" value="3">이문세
		<br>
		귀하의 취미는?
		<input type="checkbox" name="hobby" value="당구" checked="checked">당구
		<input type="checkbox" name="hobby" value="노래" checked="checked">노래
		<input type="checkbox" name="hobby" value="미술">미술
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>
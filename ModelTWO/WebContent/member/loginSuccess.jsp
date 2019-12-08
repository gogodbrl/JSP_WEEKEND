<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	${sessionScope.loginfo.name} 님 -- 로그인 성공하셨군요.
	<br><br>
	<a href="<%=MyCtrlCommand %>meDetailView&id=${sessionScope.loginfo.id}">내 정보 보기</a>
</body>
</html>
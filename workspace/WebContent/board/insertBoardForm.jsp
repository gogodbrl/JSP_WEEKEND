<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<%
	/** GET ENCODING UTF-8 **/
	request.setCharacterEncoding("utf-8");
	String boardwriter = null;
	if(loginInfo != null){
		boardwriter = loginInfo.getId();
	} else {
		response.sendRedirect("../login/loginForm.jsp");
		return ;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form action= "insertBoard.jsp" method="post">
	<input type="hidden" name="writer" value="<%=boardwriter%>">
	<table border="1">
		<tr> 
			<td colspan="2">
				게시글 등록
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=boardwriter %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input type="text" name="content"></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<%
	String boardwriter = null;
	if(loginInfo != null){
		boardwriter = loginInfo.getId();
	} else {
		response.sendRedirect("../login/loginForm.jsp");
		return ;
	}
	
	String no = request.getParameter("no");
	String groupno = request.getParameter("groupno");
	String orderno = request.getParameter("orderno");
	String depth = request.getParameter("depth");
	
	if(groupno == null || orderno == null || depth == null ){
		response.sendRedirect("selectBoardAll.jsp");
		return ;
	}
	
	int intDepth = Integer.parseInt(depth);
	String retryStr = "";
	for(int index=0; index < intDepth; index ++){
		retryStr +="RE: ";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form action= "ReplyTo.jsp" method="post">
	<input type="hidden" name="writer" value="<%=boardwriter%>">
	<input type="hidden" name="groupno" value="<%=groupno %>">
	<input type="hidden" name="orderno" value="<%=orderno %>">
	<input type="hidden" name="depth" value="<%=depth %>">
	
	<table border="1">
		<tr> 
			<td colspan="2">
				게시글 답글
			</td>
		</tr>
		<tr>
			<td>원글번호</td>
			<td><%=no %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" value=<%=retryStr %>></td>
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
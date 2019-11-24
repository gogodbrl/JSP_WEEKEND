<%@page import="Bean.Board"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("no");
	if(id == null || "null".equalsIgnoreCase(id)) {
		String contextPath = request.getContextPath();
		String errorMemberPath = contextPath + "/error/Error.jsp?redirectPath=/board/selectBoardAll"; 
		response.sendRedirect(errorMemberPath); 
		return ;
	}
	BoardDao dao = new BoardDao();
	Board board = dao.SelectBoardOne(id);
	
	int boardNo = board.getNo();
	String boardRegdate = board.getRegdate();
	String boardSubject = board.getSubject();
	String boardwriter = board.getWriter();
	String boardContent = board.getContent();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>게시글 수정</h3>	
<form action= "updateBoard.jsp" method="post">
	<!-- 이렇게 적으면 페이지에는 안보이게 값을 숨겨서 적을 수 있다. -->
	<!-- form 태그의 input태그에 있는 값들만 action으로 넘어가기 때문에 hidden에 넣어준다. -->
	<input type="hidden" name="no" value="<%=boardNo %>">
	<input type="hidden" name="regdate" value="<%=boardRegdate %>">
	<input type="hidden" name="writer" value="<%=boardwriter %>">
	
	<!-- 제가 넘겨드릴 때 pageNumber랑 pageSize도 넘겨드리겠습니다 라는 의미!!! -->
	<input type="hidden" name="pageNumber" value="<%= request.getParameter("pageNumber") %>">
	<input type="hidden" name="pageSize" value="<%= request.getParameter("pageSize") %>">
	
	<table border="1">
		<tr>
			<th>게시글 번호</th>
			<!--  이렇게 하면 DB에서 가져온 이름이 그대로 들어가있다. -->
			<td><%=board.getNo() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<!--  이렇게 하면 DB에서 가져온 이름이 텍스트 박스에 그대로 들어가있다. -->
			<td><input type="text" name="subject" value="<%=boardSubject %>"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=boardwriter %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><input type="text" name="content" value="<%=boardContent %>"></td>
		</tr>
		<tr>
			<th>등록날짜</th>
			<td><%=boardRegdate %></td>
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
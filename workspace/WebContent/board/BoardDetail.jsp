<%@page import="Bean.Board"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	/** USE UTF-8 **/
	request.setCharacterEncoding("utf-8");

	/** GET PARAM **/
	String writer = request.getParameter("writer");
	if(writer == null || "null".equalsIgnoreCase(writer)) {
		String contextPath = request.getContextPath();
		String errorPath = contextPath + "/error/Error.jsp?redirectPath=/board/selectBoardAll"; 
		response.sendRedirect(errorPath); //이 때 인자값이 같이 넘어가는거 같음 
		return ; //이걸 써줘야 더이상 실행하지 않는 듯 ( 자바 메소드 느낌  )
	}
	/** GET DB DATA **/
	BoardDao dao = new BoardDao();
	Board board = dao.SelectBoardOne(writer);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h3>상세 보기</h3>
	<table border="1">
		<tr>
			<th>글번호</th>
			<td><%=board.getNo() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=board.getSubject() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=board.getWriter() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=board.getContent() %></td>
		</tr>
		<tr>
			<th>등록날짜</th>
			<td><%=board.getRegdate() %></td>
		</tr>
	</table>
	<h3><a href="javascript:history.go(-1)">뒤로가기</a></h3>
</body>
</html>
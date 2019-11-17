<%@page import="Bean.Board"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	/** GET PROJECT NAME ( /WebProject라는 String 반환 ) **/
	String contextPath = request.getContextPath();
	String boardPath = contextPath + "/board";

	BoardDao dao = new BoardDao();
	List<Board> boardList = dao.SelectBoardAll();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>게시글 전체 목록 보기</h3>
<table border ="1">
	<tr>
		<td>게시글번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>내용</td>
		<td>등록날짜</td>
	</tr>

	<!-- 이렇게 스크립트릿을 사용하면 값을 리스트로 출력 가능하다. -->
	<% for(Board board : boardList) { %>
	<tr>
		<!-- 1. 아래 태그를 쓰면 위에서 가져온 스크립트릿에서 가져온 값을 사용할 수 있다.
			 2. 이 문법을 표현식이라고 한다(Expression) -->
		<td><%=board.getNo() %></td>
		<td><%=board.getSubject() %></td>
		<td><%=board.getWriter() %></td>
		<td><%=board.getContent() %></td>
		<td><%=board.getRegdate() %></td>
		<td><a href="<%=boardPath %>/BoardDetail.jsp?writer=<%=board.getWriter()%>">상세</a></td>
	</tr>
	<% } %>
</table>
</body>
</html>
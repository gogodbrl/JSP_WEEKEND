<%@page import="Util.Paging"%>
<%@page import="Bean.Board"%>
<%@page import="java.util.List"%>
<%@page import="Dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<!-- 세션정보 가져오기 -->
<%
	String contextPath = request.getContextPath();
	String boardPath = contextPath + "/board";
	
	if(loginInfo == null) {
		response.sendRedirect("../login/loginForm.jsp");
		return ;
	} 
%>
<!-- 페이지 가져오기 -->
<%
	BoardDao dao = new BoardDao();
	String pageNumber = request.getParameter("pageNumber");
	String pageSize = request.getParameter("pageSize");
	int totalCount = dao.SelectTotalUploadCount();
	String url = "../board/selectBoardAll.jsp";
		
	Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url);
%>
<!-- 전체 리스트 가져오기 -->
<% 
	List<Board> boardList = dao.SelectBoardAll(pageInfo.getBeginRow(), pageInfo.getEndRow());
	if(boardList == null) { 
		out.print("boardList is null"); 
		return ;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<h3>게시글 전체 목록 보기</h3>
<h4><a href="<%=boardPath %>/insertBoardForm.jsp"> 신규 게시글 등록 </a></h4>
<table border ="1">
	<tr>
		<td colspan="5"></td>
		<td colspan="3"><b><%=pageInfo.getPagingStatus() %></b></td>
	</tr>
	<tr>
		<th>게시글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>내용</th>
		<th>등록날짜</th>
		<th>상세</th>
		<th>수정</th>
		<th>삭제</th>
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
		<td><a href="<%=boardPath %>/selectBoardDetail.jsp?no=<%=board.getNo()%>">상세</a></td>
		<% 
		if(board.getWriter().trim().equals(loginInfo.getId().trim())){
			/** 이런식으로하면 다른페이지에 넘길 때 이렇게 인자값을 넘기면 받는쪽에서 이전페이지의 정보를 가질 수 있고, 다시 넘겨줄 수도 있다. **/
			out.print(String.format("<td><a href='%s/updateBoardForm.jsp?no=%s&pageNumber=%s&pageSize=%s'>수정</a></td>", boardPath, board.getNo(), pageInfo.getPageNumber(), pageInfo.getPageSize()));
			out.print(String.format("<td><a href='%s/deleteBoard.jsp?no=%s&pageNumber=%s&pageSize=%s'>삭제</a></td>", boardPath, board.getNo(), pageInfo.getPageNumber(), pageInfo.getPageSize()));
		} else { 
			out.print("<td><font color='gray'>수정</font></td>");
			out.print("<td><font color='gray'>삭제</font></td>");
		} 
		 %>
		 <td><%=board.getGroupno() %></td>
		 <td><%=board.getOrderno() %></td>
		 <td><%=board.getDepth() %></td>
	</tr>
	<% } %> 
	<tr>
		<td colspan="8"><%=pageInfo.getPagingHtml() %></td>
	</tr>
</table>
</body>
</html>
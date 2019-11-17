<!-- selectMemberAll.jsp에서 호출 -->
<%@page import="Bean.Member"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
	/** USE UTF-8 **/
	request.setCharacterEncoding("utf-8");

	/** GET PARAM **/
	String id = request.getParameter("id");
	if(id == null || "null".equalsIgnoreCase(id)) {
		String contextPath = request.getContextPath();
		String errorMemberPath = contextPath + "/error/Error.jsp?redirectPath=/member/selectMemberAll"; 
		response.sendRedirect(errorMemberPath); 
		return ;
	}
	
	/** GET DB DATA **/
	MemberDao dao = new MemberDao();
	Member member = dao.SelectMemberOne(id);
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
			<th>아이디</th>
			<td><%=member.getId() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=member.getName() %></td>
		</tr>
		<tr>
			<th>급여</th>
			<td><%=member.getSalary() %></td>
		</tr>
		<tr>
			<th>입사일자</th>
			<td><%=member.getHiredate() %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=member.getAddress() %></td>
		</tr>
	</table>
	<h3><a href="javascript:history.go(-1)">뒤로가기</a></h3>
</body>
</html>
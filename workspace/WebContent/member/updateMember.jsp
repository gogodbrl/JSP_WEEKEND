<%@page import="Bean.Member"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<%
	/** GET ENCODING UTF-8 **/
	request.setCharacterEncoding("utf-8");

	/** GET PARAM **/
	MemberDao dao = new MemberDao();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	int salary = Integer.parseInt(request.getParameter("salary"));
	String hiredate = request.getParameter("hiredate");
	String address = request.getParameter("address");
	
	Member bean = new Member();
	bean.setAddress(address);
	bean.setHiredate(hiredate);
	bean.setId(id);
	bean.setName(name);
	bean.setSalary(salary);
	
	/** REDIRECT IF SUCCESS **/
	int cnt = dao.UpdateMember(bean);
	if(cnt > 0) { 
		response.sendRedirect("selectMemberAll.jsp");
	} else {
		out.print("DB UPDATE 실패");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
</body>
</html>
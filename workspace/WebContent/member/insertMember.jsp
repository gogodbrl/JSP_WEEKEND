<!-- 이 페이지가 자바어로 바뀌었을 때 Dao.BoardDao를 참조해서 가져오라는 의미 -->
<%@page import="Bean.Member"%>
<%@page import="Dao.MemberDao"%>
<!-- (화살표퍼센트골뱅이)로 시작하는 문법을 지시어라고 한다. 
language : 나중에 자바로 바뀐다는 의미
contentType : 우리가 보는 최종 타입은 text/html 문서로 바뀐다는 의미
pageEncoding : 이 페이지에서 보내거나 받아서 해석하는 방식은 UTF-8을 사용하겠다는 의미 -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./../common/common.jsp" %>
<%@include file= "./../common/encoding.jsp" %>

<!--  
	1. 이 문법을 스크립트 릿(Scriptlit)이라고 한다. 
	2. request와 out등은 servlet 내장객체로 제공한다.
	3. out은 스크립트 릿에서 print하는 방법이다.
	4. html 코드안에 사용하기 위해서는 표현식을 사용한다.
	5. insertTo.jsp를 form으로 넘길 때 같이 데이터가 넘어온다고 보면 된다.
	6. getParamter로 받는 기본값은 String이다.
-->
<%
	MemberDao dao = new MemberDao();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	//String salary = request.getParameter("salary");
	int salary = Integer.parseInt(request.getParameter("salary")) + 10;
	String hiredate = request.getParameter("hiredate");
	String address = request.getParameter("address");
	
	Member bean = new Member();
	
	bean.setAddress(address);
	bean.setHiredate(hiredate);
	bean.setId(id);
	bean.setName(name);
	bean.setSalary(salary);
	
	int cnt = dao.InsertMember(bean);
	if(cnt > 0) { 
		response.sendRedirect("selectMemberAll.jsp");
	} else {
		out.print("DB INSERT 실패");
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
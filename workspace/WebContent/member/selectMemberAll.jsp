<%@page import="Bean.Member"%>
<%@page import="java.util.List"%>
<%@page import="Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
	/** GET PROJECT NAME ( /WebProject라는 String 반환 ) **/
	String contextPath = request.getContextPath();
	String memberPath = contextPath + "/member";
//	out.print(memberPath);

	/** SELECT ALL로 조회한다.**/
	MemberDao dao = new MemberDao();
	List<Member> memberList = dao.SelectMemberAll();
%>
<h3>회원 목록 보기</h3>
<h4><a href="<%=memberPath %>/insertMemberForm.jsp"> 신규사용자 등록 </a></h4>
<table border ="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>급여</th>
		<th>입사날짜</th>
		<th>주소</th>
		<th>상세</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>

	<!-- 이렇게 스크립트릿을 사용하면 값을 리스트로 출력 가능하다. -->
	<% for(Member member : memberList) { %>
	<tr>
		<!-- 1. 아래 태그를 쓰면 위에서 가져온 스크립트릿에서 가져온 값을 사용할 수 있다.
			 2. 이 문법을 표현식이라고 한다(Expression) -->
		<td><%=member.getId() %></td>
		<td><%=member.getName() %></td>
		<td><%=member.getSalary() %></td>
		<td><%=member.getHiredate() %></td>
		<td><%=member.getAddress() %></td>
		<!-- 우리가 kim을 보려는지, kang을 보려는 지 분기처리를 여기서 해주어야 한다. 
		근데 여기서 get으로 받는 지 post로 받는 지 어떻게 알지? -->
		<td><a href="<%=memberPath %>/selectMemberDetail.jsp?id=<%=member.getId()%>">상세</a></td>
		<td><a href="<%=memberPath %>/updateMemberForm.jsp?id=<%=member.getId()%>">수정</a></td>
		<td><a href="<%=memberPath %>/deleteMember.jsp?id=<%=member.getId()%>">삭제</a></td>
	</tr>
	<% } %>
</table>
</body>
</html>
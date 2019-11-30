<%@page import="Bean.JstlMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file= "./../common/encoding.jsp" %>

<!-- 기존에 Form에서 값 가져와서 Bean에 값 넘기는 방법  -->
<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String weight = request.getParameter("weight");
	String height = request.getParameter("height");
	String gender = request.getParameter("gender");
	
	JstlMember bean = new JstlMember();
	bean.setName(name);
	bean.setAge(age);
	bean.setWeight(weight);
	bean.setHeight(height);
	bean.setGender(gender);
%>
<!-- jstl을 사용하는 방법 -->
<!-- jstl에서 쓰는 태그의 이름을 action태그라고 함 :: 기본적으로 xml 문법을 따르고 있다. -->
<!-- 자바의 인스턴스 변수를 == jsp에서는 프로퍼티라고 한다.(동일한 의미임) -->

<!-- Bean 클래스 객체를 이용하여 빈 객체를 생성하는 방법 -->
<!-- 객체 이름을 member로 쓰겠다는 의미 -->
<jsp:useBean id="member" class="Bean.JstlMember"></jsp:useBean>
<!-- 모든 프로퍼티에 대한 setter를 호출하는 방법 -->
<!-- member에 대해서 모든 멤버를 set한 뒤에 가져오겠다는 의미 -->
<jsp:setProperty property="*" name="member"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<table>
	이름 : <%= bean.getName()%> <br>
	나이 : ${member.age} <br>
	몸무게 : ${member.weight} <br>
	키 : <jsp:getProperty property="height" name="member"></jsp:getProperty><br>
	성별 : <jsp:getProperty property="gender" name="member"></jsp:getProperty><br>

	이름 : ${param.name} <br>
	나이 : ${param.age} <br>
	몸무게 : ${param.weight} <br>
	키 : ${param.height} <br>
	성별 : ${param.gender} <br>
	
</table>
</body>
</html>
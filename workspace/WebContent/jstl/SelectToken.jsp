<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@include file= "./../common/encoding.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:useBean id="dao" class="Dao.TokenExampleDao"></jsp:useBean>
<% 
	String myToken1 = dao.GetToken1();
	String myToken2 = dao.GetToken2();
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form action="">
	콤보 박스 만들기<br>
	<select name="sosi">
		<c:forTokens var="token1" items="<%=myToken1%>" delims="," >
			<c:if test="${token1 == '서현'}">
				<option value="${token1}" selected>${token1}</option>
			</c:if>
			<c:if test="${token1 != '서현'}">
				<option value="${token1}">${token1}</option>
			</c:if>
		</c:forTokens>	
	</select>
	
	<br><br>
	체크박스 만들기<br>
	<c:forTokens var="token2" items="<%=myToken2%>" delims="," varStatus ="status">
		<c:if test="${status.count % 2 == 1}">
			<input type="checkbox" name="chk_token" value="${token2}" checked="checked">${token2}<br>
		</c:if>
		<c:if test="${status.count % 2 == 0}">
		<input type="checkbox" name="chk_token" value="${token2}">${token2}<br>
		</c:if>
	</c:forTokens>
</form>
</body>
</html>
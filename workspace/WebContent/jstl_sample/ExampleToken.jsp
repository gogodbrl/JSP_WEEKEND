<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file= "./../common/encoding.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
[[ EL 내장 객체 ]]
1) pageScope → 페이지Scope에 접근
2) request Scope → 리퀘스트Scope에 접근
3) sessionScope → 세션Scope에 접근
4) applicationScope → 어플리케이션Scope에 접근
5) param → 파라미터값 얻어올때 ( 1개의 Key에 1개의 Value )
6) paramValues → 파라미터값 배열로 얻어올때( 1개의 Key에 여러개의 Value) 
7) header → 헤더값 얻어올때 ( 1개의 Key에 1개의 Value ) 
8) headerValues → 헤더값 배열로 얻어올때 ( 1개의 Key에 여러개의 Value ) 
9) cookie → ${cookie. key값. value값}으로 쿠키값 조회
10) initParam → 초기 파라미터 조회
11) pageContext → 페이지컨텍스트 객체를 참조할때


\[[ JSTL 내장 태그(액션태그) \]]
1. \<\c:set\>
2. \<\c:out\>
3. \<\c:remove\>
4. \<\c:if\>
5. \<\c:choose> \/ \<\c:when\> / \<\c\:otherwise\>
6. \<\c:forEach\>
7. \<\c:forTokens\>
8. \<\c:catch\>
9. \<\c:redirect\>
10. \<\c:import\>
11. \<\c: url\>

출처: https://hunit.tistory.com/203 [Ara Blog]
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:set var="area" value="서울,제주,경북,경남,강원"/>
	<c:forTokens var="oneitem" items="${area}" delims="," varStatus="status">
		count 지역[ ${status.count} |${oneitem}]<br>
		index 지역[ ${status.index} |${oneitem}]<br>
	</c:forTokens>
</body>
</html>
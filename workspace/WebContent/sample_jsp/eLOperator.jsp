<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jstl -->
<!-- jsp페이지에 java를 되도록이면 쓰지 말자는 의미에서 사용 -->
<!-- \${값} = string으로 사용하겠다는 의미 -->
<!-- $\{값\} = "값"을 계산해달라는 의미 -->

<meta charset="UTF-8">
</head>
<!-- 
<body>
	\${14+5} : ${14+5} <br>	
	\${14-5} : ${14-5} <br>	
	\${14*5} : ${14*5} <br>	
	\${14/5} : ${14/5} <br>	
	\${14 mod 5} : ${14 mod 5} <br>	
	\${14 > 5} : ${14 > 5} <br>	
	\${10 == 9} : ${10 == 9} <br>	
	\${5 gt 9} : ${5 gt 9} <br>	
	\${9 gt 5} : ${9 gt 5} <br>
		
	\${14>5 ? 14 : 5} : ${14>5 ? 14 : 5} <br>	
	-->
	<%
		String input = null;
	%>	
	\${empty input} : ${empty input} <br>
</body>
</html> 
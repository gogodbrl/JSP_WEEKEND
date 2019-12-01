<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<form action="surveyTo.jsp" method="post">
		이름 : <input type='text' name='name' value='강감찬'><br><br>
		
		인사 : 
		<input type='radio' name='greeting' value='0' checked="checked">초면
		<input type='radio' name='greeting' value='1' checked="checked">구면
		<input type='radio' name='greeting' value='2' checked="checked">기타
		<br><br>
		
		과일을 선택하세요.
		<br>
		<!-- combo box -->
		<select name="fruit">
			<option value="1">사과</option>
			<option value="2">메론</option>
			<option value="3">바나나</option>
		</select>
		
		<input type="submit" value='전송'>
	</form>
</body>
</html>
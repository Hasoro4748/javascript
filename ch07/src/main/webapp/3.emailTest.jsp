<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3.emailTest</title>
<!-- 
	날짜 : 2024/08/13
	이름 : 강중원
	내용 : 이메일 실습하기
 -->
</head>
<body>
	<h3>3.이메일 전송</h3>
	<form action="./proc/sendEmail.jsp" method= "post">
		<table border="1">
			<tr>
				<td>보내는 사람</td>
				<td><input type="text" name = "sender"/></td>
			</tr>
			<tr>
				<td>받는 사람</td>
				<td><input type="text" name = "receiver"/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name = "title"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name = "content" rows="20" cols="60"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="보내기"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
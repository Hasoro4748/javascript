<%@page import="ch06.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	String uid = request.getParameter("uid");
	
	User1VO vo = null;
try{
//1단계 - JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");
//2단계 - 데이터베이스 접속
Connection conn = DriverManager.getConnection(host, user, pass);
//3단계 - SQL 실행 객체 생성
String sql = "select * from `user1` where `uid` = ?";
PreparedStatement psmt = conn.prepareStatement(sql);
psmt.setString(1, uid);
//4단계 - SQL 실행

ResultSet rs = psmt.executeQuery();
//5단계 - 결과처리
if(rs.next()){
	vo = new User1VO();
	vo.setUid(rs.getString(1));
	vo.setName(rs.getString(2));
	vo.setBirth(rs.getString(3));
	vo.setHp(rs.getString(4));
	vo.setAge(rs.getInt(5));
}
	

//6단계 - 데이터베이스 종료
rs.close();
psmt.close();
conn.close();
}catch(Exception e){
e.printStackTrace();
}	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<h3>User1 목록</h3>
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a>
	<a href="/ch06/user1/list.jsp">목록</a>
	
	<form action="/ch06/user1/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name = "uid" value = "<%= vo.getUid()%>" readonly/> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name = "name" value = "<%= vo.getName()%>"/> </td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name = "birth" value = "<%= vo.getBirth()%>"/> </td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name = "hp" value = "<%= vo.getHp()%>"/> </td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name = "age" value = "<%= vo.getAge()%>"/> </td>
			</tr>
			<tr>
				<td colspan="2" align = "right">
					<input type="submit" value = "등록하기"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
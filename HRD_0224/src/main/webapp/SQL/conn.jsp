<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection c=null;
PreparedStatement st=null;
ResultSet rs=null;
String sql=null;
try{
	String driver="oracle.jdbc.OracleDriver";
	String url="jdbc:oracle:thin:@//localhost:1521/xe";
	String user="system";
	String pwd="1234";
	Class.forName(driver);
	System.out.println("DB연결 성공");
	c=DriverManager.getConnection(url,user,pwd);
}catch(Exception e){
	System.out.println("DB연결 실패");
	e.printStackTrace();
}
%>
</body>
</html>
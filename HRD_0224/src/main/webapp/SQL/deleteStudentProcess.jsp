<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	System.out.println(" 학번: " + id);
	try {
		sql="delete from stud0224 where studno=?";
		st=c.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		%>
		<script>
		alert("학사정보 삭제완료");
		location.href="../selectStudent.jsp";
		</script>
		<%
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
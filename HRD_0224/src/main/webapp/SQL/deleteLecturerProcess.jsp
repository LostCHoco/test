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
	System.out.println(" 강사ID: " + id);
	try {
		sql="delete from lecturer0224 where idx=?";
		st=c.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		%>
		<script>
		alert("강사정보 삭제완료");
		location.href="../selectLecturer.jsp";
		</script>
		<%
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
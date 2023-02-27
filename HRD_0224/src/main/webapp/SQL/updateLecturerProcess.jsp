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
	String name = request.getParameter("name");
	String major = request.getParameter("major");
	String field = request.getParameter("field");
	System.out.println("강사정보: ");
	System.out.print(" 강사ID: " + id + " /");
	System.out.print(" 강사명: " + name + " /");
	System.out.print(" 전공: " + major + " /");
	System.out.println(" 세부전공: " + field);
	try {
		sql="update lecturer0224 set name=?, major=?, "+
			"field=? where idx=?";
		st=c.prepareStatement(sql);
		st.setString(1, name);
		st.setString(2, major);
		st.setString(3, field);
		st.setString(4, id);
		st.executeUpdate();
		%>
		<script>
		alert("강사정보 변경완료");
		location.href="../selectLecturer.jsp";
		</script>
		<%
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
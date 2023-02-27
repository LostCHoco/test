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
	String dept = request.getParameter("dept");
	String grade = request.getParameter("grade");
	String hobbys[] = request.getParameterValues("hobby");
	String hobby = "";
	if (hobbys != null) {
		for (int i = 0; i < hobbys.length; i++) {
	if (i == (hobbys.length-1)) {
		hobby += hobbys[i];
	} else {
		hobby += hobbys[i] + ",";
	}
		}
	}
	String address = request.getParameter("address");
	String tel = request.getParameter("tel");
	System.out.println("학사변경정보: ");
	System.out.print(" 학번: " + id + " /");
	System.out.print(" 성명: " + name + " /");
	System.out.print(" 학과: " + dept + " /\n");
	System.out.print(" 학년: " + grade + " /");
	System.out.print(" 취미: " + hobby + " /");
	System.out.print(" 주소: " + address + " /");
	System.out.print(" 연락처: " + tel + "\n");
	try {
		sql="update stud0224 set name=?, dept=?, position=?, "+
			"address=?, phone=?, hobby=? where studno=?";
		st=c.prepareStatement(sql);
		st.setString(1, name);
		st.setString(2, dept);
		st.setString(3, grade);
		st.setString(4, address);
		st.setString(5, tel);
		st.setString(6, hobby);
		st.setString(7, id);
		st.executeUpdate();
		%>
		<script>
		alert("학사정보 변경완료");
		location.href="../selectStudent.jsp";
		</script>
		<%
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
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
	System.out.println("학사정보: ");
	System.out.print(" 학번: " + id + " /");
	System.out.print(" 성명: " + name + " /");
	System.out.print(" 학과: " + dept + " /\n");
	System.out.print(" 학년: " + grade + " /");
	System.out.print(" 취미: " + hobby + " /");
	System.out.print(" 주소: " + address + " /");
	System.out.print(" 연락처: " + tel + "\n");
	try{
		int err=0;
		sql="select studno from stud0224";
		st=c.prepareStatement(sql);
		rs=st.executeQuery();
		while(rs.next()){
			if(rs.getString(1).equals(id)){
				%>
				<script>
				alert("중복되는 학번입니다.");
				history.back(-1);
				</script>
				<%
				System.out.println("중복된 아이디");
				err=1;
				break;
			}
		}
		if(err==0){
			try {
				sql="insert into stud0224 values(?,?,?,?,?,?,?)";
				st=c.prepareStatement(sql);
				st.setString(1, id);
				st.setString(2, name);
				st.setString(3, dept);
				st.setString(4, grade);
				st.setString(5, address);
				st.setString(6, tel);
				st.setString(7, hobby);
				st.executeUpdate();
				%>
				<script>
				alert("학사정보 등록완료");
				location.href="../selectStudent.jsp";
				</script>
				<%
			} catch (Exception e) {
				%>
				<script>
				alert("입력오류 발생");
				history.back(-1);
				</script>
				<%
				e.printStackTrace();
			}
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>
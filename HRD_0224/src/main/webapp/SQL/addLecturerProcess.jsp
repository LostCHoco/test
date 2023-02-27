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
	try{
		int err=0;
		sql="select idx from lecturer0224";
		st=c.prepareStatement(sql);
		rs=st.executeQuery();
		while(rs.next()){
			if(rs.getString(1).equals(id)){
				%>
				<script>
				alert("중복되는 강사ID 입니다.");
				history.back(-1);
				</script>
				<%
				System.out.println("중복되는 강사ID");
				err=1;
				break;
			}
		}
		if(err==0){
			try {
				sql="insert into lecturer0224 values(?,?,?,?)";
				st=c.prepareStatement(sql);
				st.setString(1, id);
				st.setString(2, name);
				st.setString(3, major);
				st.setString(4, field);
				st.executeUpdate();
				%>
				<script>
				alert("강사정보 등록완료");
				location.href="../selectLecturer.jsp";
				</script>
				<%
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/SQL/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사정보 목록</title>
<link href="/HRD_0224/Form/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="/Form/headerNav.jsp" %>
<section><br>
<h3>학사정보 목록</h3><br>
<%
try{
	sql="select studno from stud0224";
	st=c.prepareStatement(sql);
	rs=st.executeQuery();
	int n=0;
	while(rs.next()){
		n++;
	}
	%>
	<h6>총 <%=n %>명의 학사정보가 있습니다.</h6>
	<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<form method="post" action="addStudent.jsp"><hr>
<table border=1>
<tr>
<th>학번
<th>성명
<th>학과
<th>학년
<th>주소
<th>연락처
<th>취미
<th>관리
<%
try{
sql="select * from stud0224 order by studno";
st=c.prepareStatement(sql);
rs=st.executeQuery();
String empty="";
while(rs.next()){
	%>
	<tr>
	<td><%=rs.getString(1) %>
	<td><%=rs.getString(2) %>
	<td><%=rs.getString(3) %>
	<td><%=rs.getString(4) %>
	<%empty=rs.getString(5);if(empty==null)empty="";%>
	<td><%=empty %>
	<%empty=rs.getString(6);if(empty==null)empty="";%>
	<td><%=empty %>
	<%empty=rs.getString(7);if(empty==null)empty="";%>
	<td><%=empty %>
	<td><a href="updateStudent.jsp?id=<%=rs.getString(1)%>">수정</a> /
	<a href="/HRD_0224/SQL/deleteStudentProcess.jsp?id=<%=rs.getString(1)%>"
	onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
	<%
	}
}catch(Exception e){
	e.printStackTrace();
}	
%>
<tr>
	<th class="btnTab" colspan=8><input class="btn" type="submit" value="작성">
</table>
</form><br><br>
</section>
<%@ include file="/Form/footer.jsp" %>
</body>
</html>
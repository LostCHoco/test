<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/SQL/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 목록</title>
<link href="/HRD_0224/Form/style.css" rel="stylesheet">
</head>
<body>
<%@ include file="/Form/headerNav.jsp" %>
<section><br>
<h3>강사 리스트</h3><br>
<%
try{
	sql="select idx from lecturer0224";
	st=c.prepareStatement(sql);
	rs=st.executeQuery();
	int n=0;
	while(rs.next()){
		n++;
	}
	%>
	<h6>총 <%=n %>명의 강사가 있습니다.</h6>
	<%
}catch(Exception e){
	e.printStackTrace();
}
%>
<form method="post" action="addLecturer.jsp"><hr>
<table border=1>
<tr>
<th>강사코드
<th>강사명
<th>전공
<th>세부전공
<th>관리
<%
try{
sql="select * from lecturer0224 order by idx";
st=c.prepareStatement(sql);
rs=st.executeQuery();
String empty="";
while(rs.next()){
	%>
	<tr>
	<td><%=rs.getString(1) %>
	<%empty=rs.getString(2);if(empty==null)empty="";%>
	<td><%=empty %>
	<%empty=rs.getString(3);if(empty==null)empty="";%>
	<td><%=empty %>
	<%empty=rs.getString(4);if(empty==null)empty="";%>
	<td><%=empty %>
	<td><a href="updateLecturer.jsp?id=<%=rs.getString(1)%>">수정</a> /
	<a href="/HRD_0224/SQL/deleteLecturerProcess.jsp?id=<%=rs.getString(1)%>"
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
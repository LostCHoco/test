<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/SQL/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/HRD_0224/Form/style.css" rel="stylesheet">
<title>강사 수정</title>
<script>
function check(){
	document.f.id.disabled=false;
	document.f.submit();
	document.f.id.disabled=true;
}
</script>
</head>
<body>
<%@ include file="/Form/headerNav.jsp" %>
<section><br>
<h3>강사 수정</h3><br>
<form name="f" method="post" action="/HRD_0224/SQL/updateLecturerProcess.jsp">
<table border=1>
<%
String id=request.getParameter("id");
try{
	sql="select * from lecturer0224 where idx=?";
	st=c.prepareStatement(sql);
	st.setString(1, id);
	rs=st.executeQuery();
	if(rs.next()){
		String name=rs.getString(2);if(name==null)name="";
		String major=rs.getString(3);if(major==null)major="";
		String field=rs.getString(4);if(field==null)field="";
		%>
<tr>
<th>강사 ID
<td><input name="id" type="text"  value=<%=rs.getString(1) %> disabled>
<tr>
<th>강사명
<td><input name="name" type="text" value=<%=name %>>
<tr>
<th>전공
<td><input name="major" type="text" value=<%=major %>>
<tr>
<th>세부전공
<td><input name="field" type="text" value=<%=field %>>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
<tr>
<th colspan=2><input class="btn" type="button" value="수정" onclick="check()">
<input class="btn" type="button" value="취소">
</table>
</form>
</section>
<%@ include file="/Form/footer.jsp" %>
</body>
</html>
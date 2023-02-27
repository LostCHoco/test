<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/SQL/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/HRD_0224/Form/style.css" rel="stylesheet">
<title>강사 추가</title>
<script>
function check(){
	let id=document.f.id.value;
	if(document.f.id.value==""){
		alert("학번이 입력되지 않았습니다.");
		document.f.id.focus();
		return false;
	}else if(isNaN(document.f.id.value)){
		alert("숫자를 입력하세요.");
		document.f.id.focus();
		return false;
	}else if(document.f.id.value<=0){
		alert("양수를 입력하세요.");
		document.f.id.focus();
		return false;
	}else if(id%1!=0){
		alert("정수를 입력하세요.");
		document.f.id.focus();
		return false;
	}
	document.f.submit();
}
</script>
</head>
<body>
<%@ include file="/Form/headerNav.jsp" %>
<section><br>
<h3>학사 정보 등록 화면</h3><br>
<form name="f" method="post" action="/HRD_0224/SQL/addLecturerProcess.jsp">
<hr>
<table border=1>
<tr>
<th>강사 ID
<%
try{
	sql="select idx from lecturer0224";
	st=c.prepareStatement(sql);
	rs=st.executeQuery();
	int n=1;
	while(rs.next()){
		n=rs.getInt(1);
	}
	n++;
	%><td><input name="id" type="text" value=<%=n %>><%
}catch(Exception e){
	e.printStackTrace();
}
%>
<tr>
<th>강사명
<td><input name="name" type="text">
<tr>
<th>전공
<td><input name="major" type="text">
<tr>
<th>세부전공
<td><input name="field" type="text">
<tr>
<th class="btnTab" colspan=2><input class="btn" type="button" value="등록" onclick="check()">
<input class="btn" type="button" value="취소">
</table><hr>
</form>
</section>
<%@ include file="/Form/footer.jsp" %>
</body>
</html>
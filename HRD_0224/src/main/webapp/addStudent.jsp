<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/SQL/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/HRD_0224/Form/style.css" rel="stylesheet">
<title>학사정보 등록</title>
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
	}else if(document.f.name.value==""){
		alert("이름이 입력되지 않았습니다.");
		document.f.name.focus();
		return false;
	}else if(document.f.grade.value==""){
		alert("학년이 선택되지 않았습니다.");
		document.f.grade.focus();
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
<form name="f" method="post" action="/HRD_0224/SQL/addStudentProcess.jsp">
<hr>
<table border=1>
<tr>
<th>학번
<%
try{
	sql="select studno from stud0224";
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
<th>성명
<td><input name="name" type="text">
<tr>
<th>학과
<td><select name="dept">
<option value="1">컴퓨터공학과
<option value="2">기계공학과
<option value="3">전자과
<option value="4">영문학과
<option value="5">일어과
<option value="6">경영학과
<option value="7">무역학과
<option value="8">교육학과
</select>
<tr>
<th>학년
<td><input type="radio" name="grade" value="1">1학년
<input type="radio" name="grade" value="2">2학년
<input type="radio" name="grade" value="3">3학년
<input type="radio" name="grade" value="4">4학년
<tr>
<th>취미
<td><input type="checkbox" name="hobby" value="프로그램">프로그램
<input type="checkbox" name="hobby" value="독서">독서
<input type="checkbox" name="hobby" value="등산">등산
<input type="checkbox" name="hobby" value="여행">여행
<input type="checkbox" name="hobby" value="낚시">낚시
<input type="checkbox" name="hobby" value="영화보기">영화보기
<input type="checkbox" name="hobby" value="잠자기">잠자기
<input type="checkbox" name="hobby" value="멍때리기">멍때리기
<tr>
<th>주소
<td><input name="address" type="text">
<tr>
<th>연락처
<td><input name="tel" type="text">
<tr>
<th class="btnTab" colspan=2><input class="btn" type="button" value="등록" onclick="check()">
<input class="btn" type="button" value="취소">
</table><hr>
</form>
</section>
<%@ include file="/Form/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/SQL/conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/HRD_0224/Form/style.css" rel="stylesheet">
<title>학사정보 변경</title>
<script>
function check(){
	if(document.f.name.value==""){
		alert("이름이 입력되지 않았습니다.");
		document.f.name.focus();
		return false;
	}else if(document.f.grade.value==""){
		alert("학년이 선택되지 않았습니다.");
		document.f.grade.focus();
		return false;
	}
	document.f.id.disabled=false;
	document.f.submit();
	document.f.id.disabled=true;
}
</script>
</head>
<body>
<%@ include file="/Form/headerNav.jsp" %>
<section><br>
<h3>학사정보 수정</h3><br>
<form name="f" method="post" action="/HRD_0224/SQL/updateStudentProcess.jsp">
<table border=1>
<%
String id=request.getParameter("id");
try{
	sql="select * from stud0224 where studno=?";
	st=c.prepareStatement(sql);
	st.setString(1, id);
	rs=st.executeQuery();
	if(rs.next()){
		String hobby=rs.getString(7);if(hobby==null)hobby="";
		String address=rs.getString(5);if(address==null)address="";
		String tel=rs.getString(6);if(tel==null)tel="";
		%>
		<tr>
<th>학번
<td><input name="id" type="text" value=<%=rs.getString(1) %> disabled>
<tr>
<th>성명
<td><input name="name" type="text" value=<%=rs.getString(2) %>>
<tr>
<th>학과
<td><select name="dept">
<option value="1" <%if(rs.getString(3).equals("1"))out.print("selected"); %>>컴퓨터공학과
<option value="2" <%if(rs.getString(3).equals("2"))out.print("selected"); %>>기계공학과
<option value="3" <%if(rs.getString(3).equals("3"))out.print("selected"); %>>전자과
<option value="4" <%if(rs.getString(3).equals("4"))out.print("selected"); %>>영문학과
<option value="5" <%if(rs.getString(3).equals("5"))out.print("selected"); %>>일어과
<option value="6" <%if(rs.getString(3).equals("6"))out.print("selected"); %>>경영학과
<option value="7" <%if(rs.getString(3).equals("7"))out.print("selected"); %>>무역학과
<option value="8" <%if(rs.getString(3).equals("8"))out.print("selected"); %>>교육학과
</select>
<tr>
<th>학년
<td><input type="radio" name="grade" value="1" <%if(rs.getString(4).equals("1"))out.print("checked"); %>>1학년
<input type="radio" name="grade" value="2" <%if(rs.getString(4).equals("2"))out.print("checked"); %>>2학년
<input type="radio" name="grade" value="3" <%if(rs.getString(4).equals("3"))out.print("checked"); %>>3학년
<input type="radio" name="grade" value="4" <%if(rs.getString(4).equals("4"))out.print("checked"); %>>4학년
<tr>
<th>취미
<td><input type="checkbox" name="hobby" value="프로그램" <%if(hobby.contains("프로그램"))out.print("checked"); %>>프로그램
<input type="checkbox" name="hobby" value="독서" <%if(hobby.contains("독서"))out.print("checked"); %>>독서
<input type="checkbox" name="hobby" value="등산" <%if(hobby.contains("등산"))out.print("checked"); %>>등산
<input type="checkbox" name="hobby" value="여행" <%if(hobby.contains("여행"))out.print("checked"); %>>여행
<input type="checkbox" name="hobby" value="낚시" <%if(hobby.contains("낚시"))out.print("checked"); %>>낚시
<input type="checkbox" name="hobby" value="영화보기" <%if(hobby.contains("영화보기"))out.print("checked"); %>>영화보기
<input type="checkbox" name="hobby" value="잠자기" <%if(hobby.contains("잠자기"))out.print("checked"); %>>잠자기
<input type="checkbox" name="hobby" value="멍때리기" <%if(hobby.contains("멍때리기"))out.print("checked"); %>>멍때리기
<tr>
<th>주소
<td><input name="address" type="text" value=<%=address %>>
<tr>
<th>연락처
<td><input name="tel" type="text" value=<%=tel %>>
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
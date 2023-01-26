<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/menu.jsp" %>
<link rel="stylesheet" href="/css/wr_mo.css">

<%
String uid = request.getParameter("uid");
String code = request.getParameter("code");

String sql = "select * from "+code+" where uid = "+uid;

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String gongji = "";
String title = "";
String comment = "";
String file1 = "";

if(rs.next()){
	gongji = rs.getString("gongji");
	title = rs.getString("title");
	comment = rs.getString("comment");
	file1 = rs.getString("file1");
}


%>

<%@ include file="title_code.jsp" %>

<script>
function write2(){
	if (subject.value == ""){
		alert("제목을 입력하세요.");
		subject.focus();
		return false;
	}
	if (comment.value == ""){
		alert("내용을 입력하세요.");
		comment.focus();
		return false;
	}
	document.submit();
}

</script>


<table width=700 border=0 align=center>
	<tr><td colspan="2" height=20></td></tr>
</table>
<table  width=850px height=50px border=0 align=center>
	<tr>
		<td align=center>
			<table width=200px height=30px border=0 style="border-radius:30px;background-color:#c0ecfe;">
				<tr>
					<td align=center><font size=3 ><b><%=table_title%></b> 수정</font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<form action="modify_update.jsp" method="post" onsubmit="return write2()" enctype="multipart/form-data">
<input type=hidden name="code" value="<%=code%>">
<input type=hidden name="uid" value="<%=uid%>">
<table width=800px border=0 align=center style="padding:10px;border-bottom: 2px solid #99e0ff">
	<tr>
		<td colspan="2" align=center>
		<select class="txt" name="gongji" style="height:30px;align:center;">
			<option value="1" style="color:red;font-weight:bold" <%if(gongji.equals("1")){%>selected<%}%>>공지</option>
			<option value="2" <%if(gongji.equals("2")){%>selected<%}%>>일반</option>
			<option value="3" <%if(gongji.equals("3")){%>selected<%}%>>비밀</option>
		</select>
		<input class="txt" id="title" name="title" value="<%=title%>" style="width:500px;height:40px;align:center;font-size:15px;padding-left:10px"></td>
	</tr>
	<tr><td colspan="2" height=20></td></tr>
	<tr>
		<td colspan="2"><textarea class="txt" id="comment" name="comment" cols="100px" rows="30" style="padding:15px"><%=comment %></textarea></td>
	</tr>
	<tr><td colspan="2" height=10></td></tr>
	<tr>
		<td align=center>첨부</td>
		<td><%
		if(!file1.equals("")){
		%>
		<a href="/upload/<%=file1 %>" download><%=file1 %></a>
		<%}
		%>
		<input type="file"  id="file1" name="file1"></td>
	</tr>
	<tr><td colspan="2" height=10></td></tr>
	<tr>
		<td align=center></td>
		<td align=right>
		<button id="button1">수정하기</button>
		</td>
	</tr>
</table>
</form>
<table width=800px border=0 align=center style="padding:10px;">
	<tr>
		<td align=right>
			<button style="width:80px" id="button1" onclick="location.href='list.jsp?code=<%=code%>'">목록</button>
			<button style="width:80px" id="button2" onclick="location.href='/'">홈</button>
		</td>
	</tr>
</table>

<%@ include file="/include/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%@ include file="/include/menu.jsp" %>

<link rel="stylesheet" href="/css/view.css">

<style>
	.com{
	border:1px solid #c0ecfe;
	}
	.com:focus{
    border-color:#0982f0;
    outline: none;
	}
</style>

<%
String code = request.getParameter("code");
String uid = request.getParameter("uid");

//검색어 부분
String field;
String search;

if(request.getParameter("search") != null){
	field = request.getParameter("field");
	search = request.getParameter("search");
}else{
	field = "";
	search = "";
}
%>
<%@ include file="title_code.jsp" %>

<script>
function delete_write(){
	var result = confirm("삭제 하시겠습니까?");
	if(result == true){
		location.href="delete.jsp?code=<%=code%>&uid=<%=uid%>";
	}
}
</script>

<table width=700 border=0 align=center>
	<tr><td height=10></td></tr>
</table>

<%
//조회수 +1 처리
String sql_update = "update "+code+" set ref=ref+1 where uid="+uid+"";
Connection conn_update = DriverManager.getConnection(url, user, password);
Statement stmt_update = conn_update.createStatement();
stmt_update.executeUpdate(sql_update);

//상세정보
String sql = "select * from "+code+" where uid="+uid+"";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String gongji = "";
String title = "";
String comment = "";
String name = "";
String id = "";
String wrdate = "";
String ref = "";
String file1 = "";
String ni = "";

if(rs.next()){
	gongji = rs.getString("gongji");
	title = rs.getString("title");
	comment = rs.getString("comment");
	name = rs.getString("name");
	id = rs.getString("id");
	wrdate = rs.getString("wrdate");
	ref = rs.getString("ref");
	file1 = rs.getString("file1");
	ni = rs.getString("nickname");
}


//비밀글 일때
if(gongji.equals("3")){
	if(se_level != null && (se_level.equals("10") || id.equals(se_id))){
		
	}else{
%>
		<script>
			alert("관리자 혹은 작성자만 볼 수 있습니다.");
			location.href="/";
		</script>
<%		
	}
}
%>
<table  width=850px height=50px border=0 align=center>
	<tr>
		<td align=center>
			<table width=120px height=30px border=0 style="border-radius:30px;background-color:#c0ecfe;">
				<tr>
					<td align=center><font size=3 ><b><%=table_title%></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<table width=850 border=0 align=center style="padding-top: 10px;padding-bottom: 5px;">
	<tr>
		<td>
			<button style="width:80px" id="button1" onclick="location.href='list.jsp?code=<%=code%>&field=<%=field%>&search=<%=search%>'">목록</button>
		</td>
		<td align=right>
			<button style="width:65px" id="button1" onclick="location.href='reply.jsp?code=<%=code%>&uid=<%=uid%>'">답변</button>
			<%
			if(se_level != null && (se_level.equals("10") || id.equals(se_id))){
			%>
			<button style="width:65px" id="button1" onclick="location.href='modify.jsp?code=<%=code%>&uid=<%=uid%>'">수정</button>
			<button style="width:65px" id="button2" onclick="delete_write()">삭제</button>
			<%}else{%>
			<button style="width:65px" id="button1" onclick="alert('작성자만 수정할 수 있습니다.')">수정</button>
			<button style="width:65px" id="button2" onclick="alert('관리자 혹은 작성자만 삭제할 수 있습니다.')">삭제</button>
			<%}%>
		</td>
	</tr>
</table>
<table width=850px border=0 align=center>
	<tr>
		<td colspan=2 id="title"><%=title %></td>
	</tr>
	<tr>
		<td height=50px style="border-bottom: 1px solid #c1edff"><b>글쓴이 : </b><%=ni%></td>
		<td align=right style="border-bottom: 1px solid #c1edff;line-height:150%"><b>작성날짜 : </b><%=wrdate %><br><b>조회수 : </b><%=ref %> </td>
	</tr>
	<tr>
		<td height=300 valign=top colspan=2 style="padding:20px;border-bottom: 1px solid #99e0ff"><%=comment %></td>
	</tr>	
	<tr>
		<td width=100 style="padding:20px;border-bottom: 2px solid #0086bf"><b>첨부파일</b></td>
		<td align=left style="border-bottom: 2px solid #0086bf">
		<%
		if(!file1.equals("")){
		%>
		<a align=left style="text-decoration:none" href="/upload/<%=file1 %>" download><%=file1 %></a>
		<%
		}
		%>
		</td>
	</tr>
</table>
<!-- 한줄 댓글 -->
<script>
function coin2(){
	if(comm.value == ""){
		alert("댓글을 입력하세요.");
		comm.focus();
		return false;
	}
	document.submit();
}
</script>
<form action="comment_insert.jsp?code=<%=code%>&uid=<%=uid%>" method="post" onsubmit="return coin2()">
<input type="hidden" name="name" value="<%=se_name%>">
<input type="hidden" name="id" value="<%=se_id%>">
<input type="hidden" name="nick" value="<%=se_nickname%>">
<table width=850px border=0 align=center style="border-bottom: 1px solid #0086bf">
	<tr><td colspan="3" height=10px></td></tr>
	<tr>
		<td align=center width=150><b>댓글</b></td>
		<td align=center><input class="com" id="comm" name="comm" value="" style="width:500px;height:50px;border-radius:5px;padding-left:15px"></td>
		<td style="width:100px;" align=left><button id="button">댓글작성</button></td>
	</tr>
	<tr><td colspan="3" height=10px></td></tr>
</table>
</form>
<!-- 한줄 댓글 목록 -->
<table width=850px border=0 align=center style="border-bottom: 2px solid #0086bf;padding:10px">
<%
	String sql_comment = "select * from comment where td_table='"+code+"' and td_uid="+uid+"";

	Connection conn_comment = DriverManager.getConnection(url, user, password);
	Statement stmt_comment = conn_comment.createStatement();
	ResultSet rs_comment = stmt_comment.executeQuery(sql_comment);
	
	while(rs_comment.next()){
		int c_uid = rs_comment.getInt("uid");
	%>
	<tr>
		<td align=center ><b><%=rs_comment.getString("td_nickname") %></b></td>
		<td align=center ><%=rs_comment.getString("td_comment") %></td>
		<td align=center >
			<button id="button1" onclick="delete_com(<%=c_uid%>)">삭제</button>
		</td>
	</tr>
	<%
	}
	%>
</table>
<script>
function delete_com(num){
	var result = confirm("삭제하시겠습니까?");
	if(result == true){
		location.href="comment_delete.jsp?code=<%=code%>&uid=<%=uid%>&c_uid="+num;
	}
}
</script>

<%@ include file="/include/footer.jsp" %>  
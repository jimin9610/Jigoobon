<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/menu.jsp" %>
<link rel="stylesheet" href="/css/wr_mo.css">



<%
if(se_id == null){
%>
<script>
	alert("로그인 후 작성하세요.\n로그인 페이지로 이동합니다.");
	location.href="/member/login.jsp";
</script>
<%	
}
%>

<%String code = request.getParameter("code");%>
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
					<td align=center><font size=3 ><b><%=table_title%></b> 글쓰기</font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<form action="write_insert.jsp" method="post" onsubmit="return write2()" enctype="multipart/form-data">
<input type=hidden name="code" value="<%=code%>">
<input type=hidden name="nickname" value="<%=se_nickname%>">
<table width=800px border=0 align=center style="padding:10px;border-bottom: 2px solid #99e0ff">
	<tr>
		<td colspan="2" align=center>
		<select class="txt" name="gongji" style="height:30px;align:center;">
			<option value="1" style="color:red;font-weight:bold">공지</option>
			<option value="2" selected>일반</option>
			<option value="3" style="color:blue">비밀</option>
		</select>
		<input class="txt" id="title" name="title" value="" style="width:500px;height:40px;align:center;font-size:15px;padding-left:10px" placeholder="제목을 입력하세요."></td>
	</tr>
	<tr><td colspan="2" height=20></td></tr>
	<tr>
		<td colspan="2"><textarea class="txt" id="comment" name="comment" cols="100px" rows="30" style="padding:15px" placeholder="4천자까지 입력 가능합니다."></textarea></td>
	</tr>
	<tr><td colspan="2" height=10></td></tr>
	<tr>
		<td align=center>첨부</td>
		<td><input type="file"  id="file1" name="file1"></td>
	</tr>
	<tr><td colspan="2" height=10></td></tr>
	<tr>
		<td align=center></td>
		<td align=right>
		<button id="button1">글쓰기</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/dbco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jigoo-bon 회원정보</title>
<link rel="stylesheet" href="/css/b.css">
<style>
		body{
			background-color: #fff;
			font-size: 14px;
			font-family: sans-serif
		}
		input::placeholder {
  			font-style: bold;
  			font-size: 12px;
		}
		#line{
			border-bottom: 1px solid #c0ecfe;
		}
		#line1{
			border-right: 1px solid #c0ecfe;
			border-bottom: 1px solid #c0ecfe;
		}
		#line2{
			border-bottom: 1px solid #e3f7ff;
		}
		#button1{
			border: 1px solid white;
			border-radius:6px;
			background-color: skyblue;
			color:white;
			padding:5px;
			cursor: pointer;
		}
		#button2{
			border: 1px solid white;
			border-radius:6px;
			background-color: #ff7d9e;
			color:white;
			padding:5px;
			cursor: pointer;
		}
		
</style>
</head>
<body>
<table width=100% height=50 border=0>
	<tr>
		<td align=center><img src="/img/jigoo.png" width=400px onclick="location.href='/admin'" style="cursor: pointer;"></td>
	</tr>
</table>

<%
String id = request.getParameter("id");

String sql = "select * from member where id='"+id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

if(rs.next()){

	

%>
<br>
<table width=500 border=0 align=center>
	<tr>
		<td width=50% height=45px colspan=2 align=center style="background-color:#c0ecfe">
			<b>회원정보</b>
		</td>
	</tr>
	<tr><td height=10px></td></tr>
	<tr>
		<td align=center height=35px id="line"><b>아이디</b></td>
		<td  id="line"><%=rs.getString("id") %></td>
	</tr>
	<tr>
		<td align=center id="line" height=35px><b>이름</b></td>
		<td  id="line"><%=rs.getString("name") %></td>
	</tr>
	<tr>
		<td align=center id="line" height=35px><b>닉네임</b></td>
		<td  id="line"><%=rs.getString("nickname") %></td>
	</tr>
	<tr>
		<td align=center id="line" height=35px><b>본인 확인 문구</b></td>
		<td  id="line"><%=rs.getString("prove") %></td>
	</tr>
	<tr>
		<td align=center id="line" height=35px><b>연락처</b></td>
		<td  id="line"><%=rs.getString("phone") %></td>
	</tr>
	<tr>
		<td align=center id="line" height=35px><b>메일</b></td>
		<td  id="line"><%=rs.getString("email1")%>@<%=rs.getString("email2") %></td>
	</tr>
	<tr>
		<td align=center id="line1" rowspan=4><b>주소</b></td>
		<td  id="line2" height=30px><%=rs.getString("zipcode") %></td>
	</tr>
	<tr>
		<td  id="line2" height=30px>
			<a>도로명 주소 : </a>
			<a><%=rs.getString("zipcode1")%></a>
		</td>
	</tr>
	<tr>
		<td  id="line2" height=30px>
			<a>지번 주소 : </a>
			<a><%=rs.getString("zipcode2")%></a>
		</td>
	</tr>
	<tr>
		<td  id="line" height=30px><%=rs.getString("zipcode3")%> <%=rs.getString("zipcode4")%></td>
	</tr>
	<tr>
		<td align=center id="line" height=35px><b>성별</b></td>
		<td  id="line">
		<%
		if(rs.getString("gender").equals("F")){
			out.print("여자");
		}else{
			out.print("남자");
		}
		
		%></td>
	</tr>
	<tr>
		<td align=center id="line" height=35px><b>레벨</b></td>
		<td  id="line"><%=rs.getString("level")%></td>
	</tr>
</table>
<br>
<table width=500 align=center>
	<tr>
		<td  width=250>
			<button id="button2" onclick="location.href='/admin/mem/list.jsp';">뒤로가기</button>
		</td>
		<td  width=250 align=right>
			<button align=right id="button1" onclick="location.href='/admin/mem/modify.jsp?id=<%=rs.getString("id")%>';">수정</button>
			<button align=right id="button1" onclick="location.href='/admin/mem/delete.jsp?id=<%=rs.getString("id")%>';">삭제</button>
		</td>
	</tr>
</table>

<%
}
%>


<%@ include file="/admin/include/footer.jsp" %>








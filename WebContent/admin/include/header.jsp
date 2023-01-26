<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/dbco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jigoo-bon 관리자 채널</title>
<link rel="stylesheet" href="/css/b.css">
</head>
<body>
<table align=center height=50 border=0>
	<tr>
		<td align=center><img src="/img/jigoo.png"  width=400px onclick="location.href='/'" style="cursor: pointer;"></td>
	</tr>
</table>

<%
String se_id = (String)session.getAttribute("id");
String se_name = (String)session.getAttribute("name");
String se_level = (String)session.getAttribute("level");
String se_nickname = (String)session.getAttribute("nick");
%>

<%if(se_id != null && !se_id.equals("")){ %>
<table width=1200px align=center>
	<tr>
		<td>
			<table width=200px align=right style="padding-bottom:10px;font-size: 15px;border-radius:10px;background-color:#e1f7ff;text-align:right">
				<tr>
					<td align=center width=150px height=40px><img valign=center src="/img/비행기-removebg-preview.png" width=25px><b><%=se_nickname%></b>님 <b>&nbsp;|&nbsp;</b> lv : <%=se_level %></td>
				</tr>
				<tr>
					<td align=center width=150px height=20px>
					<button onclick="location.href='/mem/logout.jsp';" style="height:25px;border: 1px solid white;border-radius:6px;background-color:skyblue;color:white;cursor: pointer;"><font size=1px>로그아웃</font></button>
		   			<button onclick="location.href='/mem/join_up.jsp';" style="height:25px;border: 1px solid white;border-radius:6px;background-color:skyblue;color:white;cursor: pointer;"><font size=1px>회원수정</font></button>
		   			<%
					if(se_level != null && se_level.equals("10")){
					%>
					<button onclick="location.href='/';" style="height:25px;border: 1px solid white;border-radius:6px;background-color: #ff7d9e;color:white;cursor: pointer;"><font size=1px>일반</font></button>
					</td>
				</tr>
				<%} %>
			</table>
		</td>
	</tr>
</table>
<%} %>


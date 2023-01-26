<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/dbco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jigoo-bon 회원목록</title>
<link rel="stylesheet" href="/css/b.css">
<style>
		body{
			background-color: #fff;
			font-size: 14px;
		}
		#title{
			background-color:#c0ecfe;
			height:45px;
			text-align:center;
			font-weight:bold;
			border-bottom: 1px solid #0283e1;
			border-top: 1px solid #0283e1;
		}
		#cont{
			text-align:center;
			height:40px;
			border-bottom: 1px solid #77d5fd;
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
<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");

//검색어 부분
String field;
String search;

if(request.getParameter("search") != null && !request.getParameter("search").equals("")){
	field = request.getParameter("field");
	search = request.getParameter("search");
	%>
	<%
}else{
	field = "";
	search = "";
}
%>
<%
String sql_count = "";
if(request.getParameter("search") != null && !request.getParameter("search").equals("")){ //검색어 있다면
	sql_count = "select count(*) from member where "+field+" like '%"+search+"%'";
}else{
	sql_count = "select count(*) from member";
}
Connection conn_count = DriverManager.getConnection(url, user, password);
Statement stmt_count = conn_count.createStatement();
ResultSet rs_count = stmt_count.executeQuery(sql_count);

int total_count = 0;
if(rs_count.next()){
	total_count = rs_count.getInt(1); //총 게시물 수
}

//페이징 관련 변수들

//현재 페이지 수
int page_now = 1;
if(request.getParameter("page_now") != null){
	page_now = Integer.parseInt(request.getParameter("page_now"));
}

int num_per_page = 20; //한 페이지당 출력 게시물 수
int page_per_block = 5; //한 블럭당 출력할 링크 수
int first = 0; //limit 시작 값
	first = num_per_page * (page_now - 1);
int total_page = 0; //총 페이지 수
	total_page = (int)Math.ceil(total_count / (double)num_per_page);
%>
<table width=100% height=50 border=0>
	<tr>
		<td align=center><img src="/img/jigoo.png" width=400px onclick="location.href='/admin'" style="cursor: pointer;"></td>
	</tr>
</table>

<%
String sql = "select * from member order by signdate desc";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>
<br>
<table border=0 align=center>
	<tr>
		<td width=300px height=40px align=center style="background-color:#c0ecfe;border-radius: 80px;font-size:23px;color:#2b363c;font-weight:bold;">회 원  목 록</td>
	</tr>
</table>
<br>
<table width=1000 border=0 align=center style="padding:0px">
	<td colspan=9>총 회원수 : <font color=#0283e1><b><%=total_count%></b></font>명</td>
	<tr>
		<td id="title">id</td>
		<td id="title">이름</td>
		<td id="title">닉네임</td>
		<td id="title">연락처</td>
		<td id="title">email</td>
		<td id="title">성별</td>
		<td id="title">본인확인 문구</td>
		<td id="title">level</td>
		<td id="title">가입일자</td>
	</tr>
	<%
	while(rs.next()){
		String email = rs.getString("email1") + "@" + rs.getString("email2");
		String signdate = rs.getString("signdate");
	%>
	<tr>
		<td id="cont">
			<a href="view.jsp?id=<%=rs.getString("id")%>" style="text-decoration:none;color:#0080ff"><b><%=rs.getString("id")%></b></a>
		</td>
		<td id="cont">
		<%=rs.getString("name") %>
		<%
			//2일전까지 최신글 처리
			java.util.Date today_list, day_22;

			//2일전 날짜
			java.util.Date today = new java.util.Date(); //오늘날짜
			java.util.Date day2 = new java.util.Date(today.getTime() - (long)(1000*60*60*24*2));
			SimpleDateFormat bbb = new SimpleDateFormat("yyyy-MM-dd");
			String day_2 = bbb.format(day2);
			day_22 = new SimpleDateFormat("yyyy-MM-dd").parse(day_2);
			//리스트 입력날짜
			today_list = new SimpleDateFormat("yyyy-MM-dd").parse(signdate);			 
			%>
			<%if(today_list.getTime() >= day_22.getTime()){%><img width=40px src="/bbs/img/new.png"><%}%>
			</td>
		<td id="cont"><%=rs.getString("nickname") %></td>
		<td id="cont"><%=rs.getString("phone") %></td>
		<td id="cont"><%=email %></td>
		<td id="cont"><%=rs.getString("gender") %></td>
		<td id="cont"><%=rs.getString("prove") %></td>
		<td id="cont"><%=rs.getString("level") %></td>
		<td id="cont"><%=rs.getString("signdate") %></td>
	</tr>
	<%
	}
	%>
</table>
<br>
<table width=900 border=0 align=center>
	<tr>
		<td>
			<button id="button1" onclick="location.href='/admin/mem/list.jsp'">새로고침</button>
			<button width=40px id="button2" onclick="location.href='/admin'">뒤로가기</button>
		</td>
		<td align=right>
			<button id="button1" onclick="location.href='/admin/mem/write.jsp'">회원가입</button>
		</td>
	</tr>
</table>

<%@ include file="/admin/include/footer.jsp" %>

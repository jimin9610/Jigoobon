<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp" %>

<%@ include file="/include/menu.jsp" %>

<link rel="stylesheet" href="/css/list.css">

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");

//검색어 부분
String field;
String search;

if(request.getParameter("search") != null && !request.getParameter("search").equals("")){
	field = request.getParameter("field");
	search = request.getParameter("search");
}else{
	field = "";
	search = "";
}
%>
<%@ include file="title_code.jsp" %>

<%
String sql_count = "";
if(request.getParameter("search") != null && !request.getParameter("search").equals("")){ //검색어 있다면
	sql_count = "select count(*) from "+code+" where gongji != '1' and "+field+" like '%"+search+"%'";
}else{
	sql_count = "select count(*) from "+code+" where gongji != '1'";
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

int num_per_page = 10; //한 페이지당 출력 게시물 수
int page_per_block = 5; //한 블럭당 출력할 링크 수
int first = 0; //limit 시작 값
	first = num_per_page * (page_now - 1);
int total_page = 0; //총 페이지 수
	total_page = (int)Math.ceil(total_count / (double)num_per_page);
%>
<br>
<table  width=300px height=40px border=0 align=center style="border-radius: 30px;background-color:#c0ecfe;">
	<tr>
		<td align=center><font size=3 ><b><%=table_title%></b></font></td>
	</tr>
</table>
<br>
<table width=1000 border=0 align=center style="border-radius: 30px">
	<tr>
		<td colspan=2>Total : <font color=red><b><%=total_count%></b></font></td>
		<td colspan="3" align=right>
			<button id="button2" onclick="location.href='list.jsp?code=<%=code%>'">새로고침</button>
			<button id="button1" onclick="location.href='write.jsp?code=<%=code%>'">글쓰기</button>
		</td>
	</tr>
	<tr><td colspan=5 height=1 class="td_bottom"></td></tr>
	<tr>
		<td id="title"><b>No</b></td>
		<td id="title" width=500><b>제목</b></td>
		<td id="title"><b>글쓴이</b></td>
		<td id="title"><b>날짜</b></td>
		<td id="title"><b>조회수</b></td>
	</tr>
	<%
	//공지글
	if(page_now == 1){ //1page 에서만 출력
		String sql_gongji = "select * from "+code+" where gongji = '1' order by uid desc";
	
		Connection conn_gongji = DriverManager.getConnection(url, user, password);
		Statement stmt_gongji = conn_gongji.createStatement();
		ResultSet rs_gongji = stmt_gongji.executeQuery(sql_gongji);
		
		while(rs_gongji.next()){
			int uid = rs_gongji.getInt("uid");		
			String title = rs_gongji.getString("title"); //제목
			String id = rs_gongji.getString("id"); //글쓴이 아이디
			String wrdate = rs_gongji.getString("wrdate"); //날짜
			int ref = rs_gongji.getInt("ref"); //조회수
			String nick = rs_gongji.getString("nickname"); //닉네임
	%>
	<tr>
		<td id="ntc" width=50><font color=blue><b>[공지]</b></font></td>
		<td id="ntc">
			<a href="view.jsp?code=<%=code%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>"><%=title %></a>
		</td>
		<td id="ntc"><%=nick %></td>
		<td id="ntc"><%=wrdate %></td>
		<td id="ntc"><%=ref %></td>
	</tr>
	<%
		}//while
	}//if
	%>
	<%
	//공지글 제외 : 일반글, 비밀글
	String sql = "";
	if(request.getParameter("search") != null && !request.getParameter("search").equals("")){ //검색어 있는 경우
		sql = "select * from "+code+" where gongji != '1' and "+field+" like '%"+search+"%' order by fid desc,thread asc limit "+first+","+num_per_page+"";
	}else{ //검색어 없는 경우
		sql = "select * from "+code+" where gongji != '1' order by fid desc,thread asc limit "+first+","+num_per_page+"";
	}
	//out.print(sql);
	Connection conn = DriverManager.getConnection(url, user, password);
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	//넘버링
	int numbering = total_count - (page_now -1) * num_per_page;
	
	while(rs.next()){
		int uid = rs.getInt("uid");		
		String title = rs.getString("title"); //제목
		String id = rs.getString("id"); //글쓴이 아이디
		String wrdate = rs.getString("wrdate"); //날짜
		int ref = rs.getInt("ref"); //조회수
		String gongji = rs.getString("gongji");
		String thread = rs.getString("thread");
		String nick = rs.getString("nickname"); //닉네임
		
		//제목 길이
		int sub_len = title.length();
		if(sub_len > 30){
			title = title.substring(0, 30)+"...";
		}else{
			title = title;
		}
	%>
	<tr>
		<td id="list"><%=numbering %></td>
		<td id="list" style="text-align:left">
			<%
			//답변일 경우 : 들여쓰기 , 이미지
			for(int i=2; i<=thread.length(); i++ ){
				out.print("&nbsp;&nbsp;&nbsp;");
			}
			if(thread.length() > 1){
			%>
			<img src="img/thread_new.gif">&nbsp;
			<%} %>
			<a style="text-decoration:none" href="view.jsp?code=<%=code%>&uid=<%=uid%>&field=<%=field%>&search=<%=search%>"><%=title %></a>
			<%if(gongji.equals("3")){%><img src="img/icon_secret.gif"><%}%>
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
			today_list = new SimpleDateFormat("yyyy-MM-dd").parse(wrdate);			 
			%>
			<%if(today_list.getTime() >= day_22.getTime()){%><img width=40px  src="img/new.png"><%}%>
		</td>
		<td id="list"><%=nick %></td>
		<td id="list"><%=wrdate %></td>
		<td id="list"><%=ref %></td>
	</tr>
	<%
		numbering--;
	}
	if(total_count == 0){ //총 게시물 수가 0
	%>
	<tr>
		<td height=100 colspan=5 class="td_bottom2" align=center>작성된 게시물이 없습니다.</td>
	</tr>
	<%
	}
	%>
</table>
<table width=700 border=0 align=center>
	<tr>
		<td colspan=2 height=20px></td>
	</tr>
	<tr>
		<td colspan=2 align=center height=30px height=30px style="background-color:#ecf8fd;border-radius: 15px;">	
<%
/////////////////////
//페이징 처리
int total_block = 0; //전체 블럭수
int block = 0; //현재 블럭
int first_page = 0;
int last_page = 0;
int direct_page = 0; //현재 페이지
int my_page = 0;

total_block = (int)Math.ceil(total_page / (double)page_per_block); //총 블럭 수
block = (int)Math.ceil(page_now / (double)page_per_block);
first_page = (block - 1) * page_per_block;
last_page = block * page_per_block;

if(total_block <= block) {
	last_page = total_page;
}
%>

<%
//out.print(last_page);
			// 이전 블럭 처리
			if(block == 1){
%>
			
<%			
			}else{
				my_page = first_page;
%>
				<a href="list.jsp?code=<%=code%>&page_now=<%=my_page%>&field=<%=field%>&search=<%=search%>">
<%
			}

			for(direct_page = first_page + 1; direct_page <= last_page; direct_page++){
				if(page_now == direct_page){
%>
					<font color=red><b><%=direct_page%></b></font>&nbsp;
<%
				}else{
%>
					<b><a href="list.jsp?code=<%=code%>&page_now=<%=direct_page%>&field=<%=field%>&search=<%=search%>"><%=direct_page%></a></b>&nbsp;
<%
				}
			}			

			// 다음 블럭 처리
			if(block < total_block) {
				my_page = last_page + 1;
%>
				&nbsp;<a href="list.jsp?code=<%=code%>&page_now=<%=my_page%>&field=<%=field%>&search=<%=search%>"></a>
<%
			}else{
%>
				
<%
			}
%>
		</td>
	</tr>
	<tr><td height=20px></td></tr>
</table>
<form action="list.jsp?code=<%=code%>" method="post">
<table width=700 border=0 align=center>
	<tr>
		<td align=right>
			<select name="field">
				<option value="title" <%if(field.equals("title")){%>selected<%}%>>제목</option>
				<option value="comment" <%if(field.equals("comment")){%>selected<%}%>>내용</option>
				<option value="name" <%if(field.equals("name")){%>selected<%}%>>글쓴이</option>
			</select>
		</td>
		<td width=200>
			<input name="search" style="width:200px" value="<%=search%>">
		</td>
		<td>
			<button>검색</button>
		</td>
	</tr>
</table>
</form>

<%@ include file="/include/footer.jsp" %>
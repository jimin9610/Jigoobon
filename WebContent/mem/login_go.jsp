<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/dbco.jsp" %>
    
<%
String id = request.getParameter("meid");
String pass = request.getParameter("mepass");

String sql = "select * from member where id='"+id+"' and pass='"+pass+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String mem_id = "";
String mem_name = "";
String mem_level = "";
String mem_nick = "";

while(rs.next()){
	mem_id = rs.getString("id");
	mem_name = rs.getString("name");
	mem_level = rs.getString("level");
	mem_nick = rs.getString("nickname");
}
if(!mem_id.equals("")){ //회원이 존재한다.
	session.setAttribute("id", mem_id);
	session.setAttribute("name", mem_name);
	session.setAttribute("level", mem_level);
	session.setAttribute("nick", mem_nick);
%>
	<script>
		location.href="/";
	</script>
<%	
}else{
%>
	<script>
		alert("아이디 틀리거나 비밀번호 틀리다. 다시 입력하세요");
		history.back();
	</script>
<%	
}
%>

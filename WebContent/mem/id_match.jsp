<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/dbco.jsp" %>

<%

String id = request.getParameter("id");

String sql = "select count(*) as count from member where id='"+id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);


int number = 0;
if(rs.next()){ //반복문 while 대신 if구문 사용 가능 ; 값이 0 또는 1일 경우
	number = rs.getInt("count");
	if(number == 1){
		%>
		<script>
		alert("중복입니다. 다시 입력하세요.");
		window.opener.ch.value = "c"
		window.opener.meid.value = "";
		self.close();
		</script>
		<%
	}else{
		%>
		<script>
		alert("사용가능한 아이디입니다.");
		window.opener.ch.value = "y";
		self.close();
		</script>
		<%
	}
}
%>





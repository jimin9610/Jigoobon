<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/dbco.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String uid = request.getParameter("uid");
String id = request.getParameter("id");
String name = request.getParameter("name");
String comment = request.getParameter("comm");
String nick = request.getParameter("nick");

//날짜 구하기 (년-월-일 , 시:분:초 사용할때 이거쓰셈 )
java.util.Date date = new java.util.Date();
SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = cal.format(date);

String sql = "insert into comment values(null,'"+code+"',"+uid+",'"+id+"','"+name+"','"+comment+"','"+today+"','"+nick+"')";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql);
%>
<script>
	location.href="view.jsp?code=<%=code%>&uid=<%=uid%>";
</script>


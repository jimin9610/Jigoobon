<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<%
String uid = request.getParameter("uid");
String code = request.getParameter("code");

String sql = "delete from "+code+" where uid="+uid;


Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
stmt.executeUpdate(sql);

String sql2 = "delete from comment where td_table='"+code+"' and td_uid="+uid;

Connection conn2 = DriverManager.getConnection(url, user, password);
Statement stmt2 =conn2.createStatement();
stmt2.executeUpdate(sql2);
%>

<script>
	location.href="list.jsp?code=<%=code%>";
</script>
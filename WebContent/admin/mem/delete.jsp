<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/admin/include/header.jsp" %>

<%
String id = request.getParameter("id");

String sql = "delete from member where id='"+id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
stmt.executeUpdate(sql);

	

%>

<script>
	alert("삭제되었습니다.");
	location.href="list.jsp";
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
   
<%
request.setCharacterEncoding("utf-8");
%>

<% 
request.setCharacterEncoding("utf-8");

String id = request.getParameter("meid");
String pass = request.getParameter("mepass");
String name = request.getParameter("mename");
String phone = request.getParameter("mephone");
String email1 = request.getParameter("meemail1");
String email2 = request.getParameter("meemail2");
String zipcode = request.getParameter("zipcode");
String zipcode1 = request.getParameter("zipcode1");
String zipcode2 = request.getParameter("zipcode2");
String zipcode3 = request.getParameter("zipcode3");
String zipcode4 = request.getParameter("zipcode4");
String gender = request.getParameter("megender");
String nina = request.getParameter("menina");

String sql = "";

if(pass.equals("")){
	sql = "update member set phone='"+phone+"',email1='"+email1+"',email2='"+email2+"',zipcode='"+zipcode+"',zipcode1='"+zipcode1+"',zipcode2='"+zipcode2+"',zipcode3='"+zipcode3+"',zipcode4='"+zipcode4+"',gender='"+gender+"',nickname='"+nina+"' where id='"+se_id+"'";
}else{
	sql = "update member set pass='"+pass+"',phone='"+phone+"',email1='"+email1+"',email2='"+email2+"',zipcode='"+zipcode+"',zipcode1='"+zipcode1+"',zipcode2='"+zipcode2+"',zipcode3='"+zipcode3+"',zipcode4='"+zipcode4+"',gender='"+gender+"',nickname='"+nina+"' where id='"+se_id+"'";
}


Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
stmt.executeUpdate(sql);
%>

<script>
location.href="/";
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/include/dbco.jsp" %>

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
String level = request.getParameter("melv");

java.util.Date date = new java.util.Date();
java.text.SimpleDateFormat cal = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = cal.format(date);

String sql = "insert into member(id,pass,name,phone,email1,email2,zipcode,zipcode1,zipcode2,zipcode3,zipcode4,gender,level,signdate) values ('"+id+"','"+pass+"','"+name+"','"+phone+"','"+email1+"','"+email2+"','"+zipcode+"','"+zipcode1+"','"+zipcode2+"','"+zipcode3+"','"+zipcode4+"','"+gender+"','1','"+today+"')";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
stmt.executeUpdate(sql);
%>

<script>
location.href="list.jsp";
</script>
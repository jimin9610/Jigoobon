<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
String prove = request.getParameter("mepr");

//날짜 구하기 (년-월-일 , 시:분:초 사용할때 이거쓰셈 )
java.util.Date date = new java.util.Date();
SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String today = cal.format(date);

String sql = "insert into member(id,pass,name,phone,email1,email2,zipcode,zipcode1,zipcode2,zipcode3,zipcode4,gender,level,signdate,nickname,prove) values ('"+id+"','"+pass+"','"+name+"','"+phone+"','"+email1+"','"+email2+"','"+zipcode+"','"+zipcode1+"','"+zipcode2+"','"+zipcode3+"','"+zipcode4+"','"+gender+"','1','"+today+"','"+nina+"','"+prove+"')";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
stmt.executeUpdate(sql); //select 제외
//stmt.executeQuery(sql);
%>

<script>
	alert("가입이 완료되었습니다.");
	location.href="/";
</script>
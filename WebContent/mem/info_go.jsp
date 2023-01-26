<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/dbco.jsp" %>
    
<%
request.setCharacterEncoding("utf-8");

String na = request.getParameter("mena");
String pr = request.getParameter("mepr");

String sql = "select * from member where prove='"+pr+"' and name='"+na+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String me_id = "";
String me_pass = "";
String me_pr = "";
String me_na = "";

while(rs.next()){
	me_id = rs.getString("id");
	me_pass = rs.getString("pass");
	me_pr = rs.getString("prove");
	me_na = rs.getString("name");
	
	if(pr.equals(me_pr) && na.equals(me_na)){ //일치 회원이 있다.
%>
		<table>
			<tr>
				<td>
					<input id="id" name="id" value="<%=me_id%>">
					<input id="pass" name="pass" value="<%=me_pass%>">
				</td>
			</tr>
		</table>
		<script>
			location.href="find_result.jsp?id=<%=me_id%>&pass=<%=me_pass%>";
		</script>
<%
	}else{
%>
		<script>
			alert("일치하는 회원이 없습니다.");
			location.href="find.jsp";
		</script>
<%	
	}
}
%>
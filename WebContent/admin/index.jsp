<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>
<%@ include file="/admin/include/admin_menu.jsp" %>

<style type="text/css">

		body{
			background-color: #fff;
			font-size: 14px;
			font-family: sans-serif
		}
		input::placeholder {
  			font-style: bold;
  			font-size: 15px;
  			text-align:center;
		}
		#button1{
			border:0;
			border-radius:6px;
			background-color: skyblue;
			color:white;
			padding:5px;
			width:100px;
			height:45px;
			cursor: pointer;
		}
		#button2{
		border:0;
		border-radius:6px;
		background-color: #ff7d9e;
		color:white;
		padding:5px;
		height:30px;
		cursor: pointer;
		}

</style>


<%
if(se_id ==null){
%>
<table align=center width=1200px height=150 border=0 style="background-color:#c0ecfe;border-radius:100px">
	<tr>
		<td align=center style="width:60px;height:100px"><font size=25px;>Jigoo-bon!</font></td>
	</tr>
	<tr>
		<td align=center style="width:60px;height:50px">로그인 후 당신의 세상을 펼쳐보세요.</td>
	</tr>
	<tr><td colspan="2" height:50px></td></tr>
	<tr>
		<td colspan="2" align=center style="padding-bottom: 10px">
			<button onclick="location.href='/mem/login.jsp';" style="border: 1px solid white;border-radius:6px;background-color: skyblue;color:white;padding:5px;margin-right: 5px;cursor: pointer;">로그인</button>
		    <button onclick="location.href='/mem/join.jsp';" style="border: 1px solid white;border-radius:6px;background-color: skyblue;color:white;padding:5px;margin-left: 5px;cursor: pointer;">회원가입</button>
		</td>
	</tr>
</table>
		<% 
		}else{  // 로그인후
			%>
<br>
<table width="100%" border="0">
    <tr>
        <td align="center">
        	<table width=1200 border=0>
          		<tr>
          	 		<td  width=800 valign=middle>
          	 			<img src="/img/baloon.png" width=800>
          	 		</td>
          		</tr>
			</table>
		</td>
	</tr>
</table>
			
			
<%}%>






</body>
<%@ include file="/admin/include/footer.jsp" %>
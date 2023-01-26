<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>



<style type="text/css">

		body{
			background-color: #fff;
			font-size: 14px;
			font-family: sans-serif
		}
		input::placeholder {
  			font-style: bold;
  			font-size: 15px;
  		
  			color:#a2a2a2;
		}
		#button1{
			border: 1px solid white;
			border-radius:6px;
			background-color: skyblue;
			color:white;
			padding:5px;
			width:100px;
			height:45px;
			cursor: pointer;
		}
		#button2{
		border: 1px solid white;
		border-radius:6px;
		background-color: #ff7d9e;
		color:white;
		padding:5px;
		height:30px;
		cursor: pointer;
		width:120px;
		}

</style>


<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pass");
%>
<script type="text/javascript">
	function info(str){
		if(str == '1'){
			re.value = "<%=id%>";
		}else{
			re.value = "<%=pw%>";
		}
		}
</script>


<table width=500px border=0 align=center>	
	<tr><td height=30px></td></tr>
</table>
<br>
<table width=500px border=0 align=center>
	<tr>
		<td align=center colspan=2 height=30 style="background-color:white;border: 0.5px solid #dadada">
			<table align=center>
				<tr>
					<td align=center>
						<input id="re" name="re" align=center style="text-align:center;height:40px;border:0px;font-size:20px;color:#b6b6b6" placeholder="쉿! 버튼 누르세요!">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td height=15px></td></tr>
	<tr>
		<td colspan=2 height=30 align=center>
			<button id="button2" onclick="info('1')"> 아이디 </button>
			<button id="button2" onclick="info('2')"> 비밀번호 </button>
		</td>
	</tr>
	<tr><td height=20px></td></tr>
	<tr><td align=center><img src=/img/비행기-removebg-preview.png width=25px><a href="/mem/login.jsp" style="text-decoration:none;color:#778eff">이제  날아가볼까요?</a><img src=/img/비행기-removebg-preview.png width=25px></td></tr>
</table>
</body>
<%@ include file="/include/footer.jsp" %>
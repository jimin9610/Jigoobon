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

<body>
<script type="text/javascript">
function logingo(){
	if(meid.value == ""){
		alert("아이디를 입력하세요.");
		meid.focus();
		return false;
	}
	if(!mepass.value){
		alert("비밀번호를 입력하세요.");
		mepass.focus();
		return false;
	}
	document.submit();
}
</script>


<table align=center width=500px height=500px border=0 style="background-color:#c0ecfe;border-radius:300px">
	<tr><td height=150px></td></tr>
	<form name="login" action="/mem/login_go.jsp" method="post" onsubmit="return logingo()">
	<tr>
		<td height=60px colspan=2 align=center><input align=center id="meid" name="meid" value="" style="width:350px;height:40px;background-color: white;border: 0.5px solid #dadada;font-size: 17px;padding-left:20px;padding-right:20px" placeholder="당신의 ID는?"></td>		
	</tr>
	<tr>
		<td height=60px colspan=2 align=center><input align=center id="mepass" name="mepass" value="" style="width:350px;height:40px;background-color: white;border: 0.5px solid #dadada;font-size: 17px;padding-left:20px;padding-right:20px" type="password" placeholder="암호를 대라!"></td>
	</tr>
	<tr>
		<td><input type="hidden" align=center id="find" name="find" value=""></td>
	</tr>
	<tr><td height=10px></td></tr>
	<tr>
		<td align=center width=300px colspan="2">
			<button id="button1">로그인</button>
		</td>
	</tr>
	</form>
	<tr>
		<td align=center>
			<button id="button2" onclick="location.href='find.jsp'">아이디 / 비밀번호 찾기</button>
		</td>
	</tr>
	<tr><td height=80px></td></tr>
</table>
</body>
<%@ include file="/include/footer.jsp" %>
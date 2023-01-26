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
  			font-size: 12px;
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
<script type="text/javascript">
function infogo(){
	if(mena.value == ""){
		alert("이름을 입력하세요.");
		mena.focus();
		return false;
	}
	if(mepr.value == ""){
		alert("본인확인 문구를 입력하세요.");
		mepr.focus();
		return false;
	}
	document.submit();
}
</script>
<form name="info_go" action="/mem/info_go.jsp" method="post" onsubmit="return infogo()">
<table width=500px border=0 align=center>	
	<tr><td height=30px></td></tr>
	<tr>
		<td width=50% height=45px colspan=2 align=center style="background-color:#c0ecfe">
			<font size=4px face="myeongjo"><b>아이디 / 비밀번호 찾기</b></font>		
		</td>
	</tr>
</table>
<br>
<table width=500px border=0 align=center>
	<tr>
		<tr>
		<td colspan=2 height=30><b>이름 입력</b></td>
	</tr>
	<tr>
		<td colspan=2 height=30 style="background-color:white;border: 0.5px solid #dadada">
			<table>
				<tr>
					<td width=340 style="padding-left: 10px"><input id="mena" name="mena" style="decoration:none;width: 98%;height:40px;border: 0px;font-size: 17px"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td height=10px></td></tr>
	<tr>
		<tr>
		<td colspan=2 height=30><b>본인확인 문구 입력</b></td>
	</tr>
	<tr>
		<td colspan=2 height=30 style="background-color:white;border: 0.5px solid #dadada">
			<table>
				<tr>
					<td width=340 style="padding-left: 10px"><input id="mepr" name="mepr" style="decoration:none;width: 98%;height:40px;border: 0px;font-size: 17px"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width=300px height=60px colspan="2" align=center height=30>
			<table>
				<tr>
					<td align=center>
						<button id="button2">찾기</button>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
<%@ include file="/include/footer.jsp" %>
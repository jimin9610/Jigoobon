<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/include/dbco.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jigoo-bon</title>
<link rel="stylesheet" href="/css/b.css">
<style>
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
		}
		
</style>
</head>
<body>
<table width=100% height=50 border=0>
	<tr>
		<td align=center><img src="/img/jigoo.png" width=400px onclick="location.href='/'" style="cursor: pointer;"></td>
	</tr>
</table>


<script type="text/javascript">
var idchecking = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사        

function join_up(){
	if(meid.value == ""){
		alert("아이디를 입력하세요.");
		meid.focus();
		return false;
	}
	if (!idchecking.test(meid.value)) {
		alert("아이디는 영문 대소문자 혹은 숫자만 입력받습니다.");
		meid.value = "";
		meid.focus();
		return false;
	}
	document.submit();
}
</script>

<%

String se_id = (String)session.getAttribute("id");
String se_name = (String)session.getAttribute("name");
String se_level = (String)session.getAttribute("level");

String sql = "select * from member where id='"+se_id+"'";

Connection conn = DriverManager.getConnection(url, user, password);
Statement stmt =conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);


if(rs.next()){
	String meid = rs.getString("id");
	String name = rs.getString("name");
	String phone = rs.getString("phone");
	String email1 = rs.getString("email1");
	String email2 = rs.getString("email2");
	String zipcode = rs.getString("zipcode");
	String zipcode1 = rs.getString("zipcode1");
	String zipcode2 = rs.getString("zipcode2");
	String zipcode3 = rs.getString("zipcode3");
	String zipcode4 = rs.getString("zipcode4");
	String gender = rs.getString("gender");
	String nina = rs.getString("nickname");

%>

<form name="join_update" action="/mem/join_update.jsp" method="post" onsubmit="return join_up()">
<input type="text" id="id_use" name="id_use" value="N" hidden>
<table width=500px border=0 align=center>
	<tr><td colspan=2 height=50px></td></tr>
	<tr>
		<td width=50% height=45px colspan=2 align=center style="background-color:#c0ecfe">
			<font size=4px face="myeongjo"><b>회원수정</b></font>		
		</td>
	</tr>
	<tr><td colspan=2 height=20></td></tr>
	<tr>
		<td colspan=2 height=30><b>아이디</b></td>
	</tr>
	<tr>
		<td colspan=2 width=340 height=30 style="background-color: white;border: 0.5px solid #dadada;padding-left: 10px">
			<input id="meid" name="meid" value="<%=se_id %>" style="width: 98%;height:30px;border: 0px;font-size: 17px">
		</td>
	</tr>
	<tr>
		<td colspan=2 height=30><b>비밀번호</b></td>
	</tr>
	<tr>
		<td colspan=2 height=30 style="background-color: white;border: 0.5px solid #dadada">
			<table>
				<tr>
					<td width=315 style="padding-left: 10px"><input id="mepass" name="mepass" value="" style="width: 98%;height:30px;border: 0px;font-size: 17px" type="password"></td>
					<td width=130 align=right style="color: #dadada"><img src="pswd.png"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=2 height=30><b>비밀번호 재확인</b></td>
	</tr>
	<tr>
		<td colspan=2 height=30 style="background-color: white;border: 0.5px solid #dadada">
			<table>
				<tr>
					<td width=315 style="padding-left: 10px"><input id="mepass2" name="mepass2" value="" style="width: 98%;height:30px;border: 0px;font-size: 17px" type="password"></td>
					<td width=130 align=right style="color: #dadada"><img src="pswdc.png"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=2 height=30><b>이름</b></td>
	</tr>
	<tr>
		<td colspan=2 height=30 style="background-color: white;border: 0.5px solid #dadada">
			<table>
				<tr>
					<td width=315 style="padding-left: 10px"><input id="mename" name="mename" value="<%=name%>" placeholder="가입 후 변경할 수 없습니다." style="width: 98%;height:30px;border: 0px;font-size: 20px" ></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=2 height=30><b>닉네임</b></td>
	</tr>
	<tr>
		<td colspan=2 height=30 style="background-color: white;border: 0.5px solid #dadada">
			<table>
				<tr>
					<td width=340 style="padding-left: 10px"><input id="menina" name="menina" value="<%=nina%>" placeholder="7자까지 입력 가능합니다." style="width: 98%;height:30px;border: 0px;font-size: 17px"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=2 height=30><b>연락처</b></td>
	</tr>
	<tr>
		<td colspan=2 height=30 style="background-color: white;border: 0.5px solid #dadada">
			<table>
				<tr>
					<td width=315 style="padding-left: 10px"><input id="mephone" name="mephone" value="<%=phone %>" placeholder="'-'를 포함하여 입력하세요." style="width: 98%;height:30px;border: 0px;font-size: 20px" ></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan=2 height=30 ><b>메일</b></td>
	<tr>
		<td colspan=2 style="width:450px;border: 0.5px solid #dadada;padding-left: 10px">
			<input id="meemail1" name="meemail1" value="<%=email1 %>" style="width:200px;height:40px;border: 0px;font-size: 20px">@<input id="meemail2" name="meemail2" value="<%=email2 %>" style="padding-left: 20px;width:200px;height:40px;border: 0px;font-size: 20px">
		</td>
	</tr>
	<tr><td colspan=2 height=10></td></tr>
	<tr>
		<td rowspan=3 height=30 width=60><b>주소</b></td>
		<td height=30>
			<input type="text" id="sample4_postcode" name="zipcode"  value="<%=zipcode %>" placeholder="우편번호" style="width:200px;height:20px">
			<input id="button1" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		</td>
	</tr>
	<tr>
		<td height=30>
			<input type="text" id="sample4_roadAddress" name="zipcode1" value="<%=zipcode1 %>" placeholder="도로명주소" style="width:200px;height:20px">
			<input type="text" id="sample4_jibunAddress" name="zipcode2" value="<%=zipcode2 %>" placeholder="지번주소" style="width:200px;height:20px">
			<span id="guide" style="color:#999;display:none"></span>
		</td>
	</tr>
	<tr>
		<td height=30>
			<input type="text" id="sample4_detailAddress" name="zipcode3" value="<%=zipcode3 %>" placeholder="상세주소" style="width:200px;height:20px">
			<input type="text" id="sample4_extraAddress" name="zipcode4" value="<%=zipcode4 %>" placeholder="참고항목" style="width:200px;height:20px">
		</td>
	</tr>
	<tr><td colspan=2 height=10></td></tr>
	<tr>
		<td><b>성별</b></td>
		<td>
			<input type="radio" id="megender" name="megender" value="F" <%if(gender.equals("F")){%>checked<%}%>>여자
			<input type="radio" id="megender" name="megender" value="M" <%if(gender.equals("M")){%>checked<%}%>>남자
		</td>
	</tr>
	<tr><td colspan=2 height=10></td></tr>	
	<tr>
		<td colspan="2" height=30 align=right><button id="button1">회원수정</button></td>
	</tr>
	<tr><td colspan=2 height=30></td></tr>	
</table>
</form>
<%
}
%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>


<%@ include file="/include/footer.jsp" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%if(se_id !=null){
		%>
<table align=center width=1200px height=50 style="border-top:1px solid #119cd6;border-bottom:1px solid #119cd6;background-color:skyblue;">
	<tr>
		<td align=center>
		   <a href="/bbs/list.jsp?code=notice" style="color:white;text-decoration:none;"><b>공지사항</b></a>
		</td>
		<td align=center>
			<a href="/bbs3/list.jsp?code=qna" style="color:white;text-decoration:none;"><b>질문&답변</b></a>	
		</td>
		<td align=center>
			<a href="/bbs2/list.jsp?code=webs" style="color:white;text-decoration:none;"><b>갤러리</b></a>
		</td>
		<td align=center>
		   <a href="/bbs4/list.jsp?code=free" style="color:white;text-decoration:none;"><b>자유게시판</b></a>
		</td>
		<td align=center>
			<a href="/bbs5/page.jsp" style="color:white;text-decoration:none;"><b>국가별 정보</b></a>
		</td>
		<td style="background-color:white;">
			<table align=center>
				<tr>
					<td align=center>
						<a href="/admin/mem/list.jsp;" style="text-decoration:none;color:#ff6266"><b>회원관리</b></a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

  <% 
}%>
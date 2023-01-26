<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
String table_title = "";

if(code.equals("notice")){
	table_title = "공지사항";
}else if(code.equals("qna")){
	table_title = "질문 & 답변";
}else if(code.equals("webs")){
	table_title = "갤러리";
}else if(code.equals("free")){
	table_title = "자유게시판";
}else{
	table_title = "존재하지 않는 게시판";
}
%>
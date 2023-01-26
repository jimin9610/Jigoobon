<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate(); //내가 만든 세션 값들 모두 삭제
%>
<script>
	location.href="/";
</script>
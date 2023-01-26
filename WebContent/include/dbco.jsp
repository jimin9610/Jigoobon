<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/work";
String user="root";
String password="1111"; 
%>
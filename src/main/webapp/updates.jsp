<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection" %>
<%@page import= "java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Scanner"%>
<%
request.setCharacterEncoding("UTF-8");
String sql;
String URL="jdbc:mysql://localhost:3306/spring5fs";
Connection conn=null; 
PreparedStatement pstmt =null;
Class.forName("com.mysql.cj.jdbc.Driver");
out.println("드라이버 로딩 완료");
conn=DriverManager.getConnection(URL, "spring5", "spring5");
out.println("sql 접속 완료");
String s1 = request.getParameter("title");
String s2 = request.getParameter("writer");
String s3 = request.getParameter("content");
Date today = new Date();
SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
String time=fm.format(today);
String num = request.getParameter("num");
sql="UPDATE board SET writer='"+s2+"', title='"+s1+"', content='"+s3+"', regtime='"+time+"' WHERE Num = "+num;
pstmt=  conn.prepareStatement(sql);
pstmt.executeUpdate(sql);
response.sendRedirect("list.jsp");
%>
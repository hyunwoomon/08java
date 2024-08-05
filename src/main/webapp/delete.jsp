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

	

String id = (String)session.getAttribute("boardid");
if(id!=null){
String sql;
String URL="jdbc:mysql://localhost:3306/spring5fs";
Connection conn=null; 
PreparedStatement pstmt =null;
Class.forName("com.mysql.cj.jdbc.Driver");
out.println("드라이버 로딩 완료");
conn=DriverManager.getConnection(URL, "spring5", "spring5");
out.println("sql 접속 완료");
String s1 = request.getParameter("num");

sql="delete from board where num="+s1;
pstmt=  conn.prepareStatement(sql);
pstmt.executeUpdate(sql);
response.sendRedirect("list.jsp");
}else{
	out.println("로그인 정보가 확인 되지 않습니다.");
}

%>
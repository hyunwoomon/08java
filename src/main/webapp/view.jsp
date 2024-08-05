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
    String s1 = request.getParameter("num");
    
		
	
	
    sql = "select * from board where num ="+s1;
    out.println(sql);
    
    pstmt=  conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    String o1 = rs.getString("title");
    String o2=rs.getString("writer");
    String o3=rs.getString("regtime");
    String o4=rs.getString("hits");
    String o5 = rs.getString("content");
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { width:680px; text-align:center; }
        th    { width:100px; background-color:cyan; }
        td    { text-align:left; border:1px solid gray; }
    </style>
</head>
<body>

<table>
    <tr>
        <th>제목</th>
        <td><%=o1 %></td>
    </tr>
    <tr>
        <th>작성자</th>
        <td><%=o2 %></td>
    </tr>
    <tr>
        <th>작성일시</th>
        <td><%=o3 %></td>
    </tr>
    <tr>
        <th>조회수</th>
        <td><%=o4 %></td>
    </tr>
    <tr>
        <th>내용</th>
        <td><%=o5 %></td>
    </tr>
</table>

<br>
<input type="button" value="목록보기" onclick="location.href='list.jsp'">
<input type="button" value="수정"
       onclick="location.href='update.jsp?num=<%=s1%>'">
<input type="button" value="삭제"
       onclick="location.href='delete.jsp?num=<%=s1%>'">
</body>
</html>

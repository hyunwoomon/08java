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
String name = (String)session.getAttribute("boardname");
    request.setCharacterEncoding("UTF-8");
	String sql;
	String URL="jdbc:mysql://localhost:3306/spring5fs";
    Connection conn=null; 
    PreparedStatement pstmt =null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    out.println("드라이버 로딩 완료");
    conn=DriverManager.getConnection(URL, "spring5", "spring5");
    out.println("sql 접속 완료");
	
		
	
	
    sql="select * from board";
    pstmt=  conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table     { width:680px; text-align:center; }
        th        { background-color:cyan; }
        
        .num      { width: 80px; }
        .title    { width:230px; }
        .writer   { width:100px; }
        .regtime  { width:180px; }
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>
</head>
<body>

<table>
    <tr>
        <th class="num"    >번호    </th>
        <th class="title"  >제목    </th>
        <th class="writer" >작성자  </th>
        <th class="regtime">작성일시</th>
        <th                >조회수  </th>
    </tr>
    <%while(rs.next()){
    	String o1=rs.getString(1);
    	String o2=rs.getString(3);
    	String o3=rs.getString(2);
    	String o4=rs.getString(5);
    	String o5=rs.getString(6);
    	%>
    	<tr>
    	<td><%=o1 %></td>
    	<td><a href="view.jsp?num=<%=o1%>"><%=o2 %></a></td>
    	<td><%=o3 %></td>
    	<td><%=o4 %></td>
    	<td><%=o5 %></td>
    	</tr>
    <%} %>
   
</table>

<br>
<%=id %>
<input type="button" value="글쓰기" onclick="location.href='write.jsp'">
<%if(id==null){ %>
<input type="button" value="로그인" onclick="location.href='login.jsp'">
<input type="button" value="회원가입" onclick="location.href='register.jsp'">
<%} else{%>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<br>
<%=name %>님 어서오세요 !
<%} %>
</body>
</html>
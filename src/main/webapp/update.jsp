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
String s1=null;
String o1=null;
String o2=null;
String o3=null;
boolean next=false;
if(id!=null){
		

    request.setCharacterEncoding("UTF-8");
	String sql;
	String URL="jdbc:mysql://localhost:3306/spring5fs";
    Connection conn=null; 
    PreparedStatement pstmt =null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    out.println("드라이버 로딩 완료");
    conn=DriverManager.getConnection(URL, "spring5", "spring5");
    out.println("sql 접속 완료");

	
	s1= request.getParameter("num");
    
    sql = "select * from board where num ="+s1;
    out.println(sql);
    
    pstmt=  conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    o1 = rs.getString("title");
    o2=rs.getString("writer");
    o3 = rs.getString("content");
    next=true;
}
    %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { width:680px; text-align:center; }
        th    { width:100px; background-color:cyan; }
        input[type=text], textarea { width:100%; }
    </style>
</head>
<body>
<%if(next==true){%>
<form method="post" action='updates.jsp?num=<%=s1%>'>
    <table>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title"  maxlength="80"
                       value="<%=o1%>">
            </td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" maxlength="20"
                       value="<%=o2%>">
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10"><%=o3%></textarea>
            </td>
        </tr>
    </table>

    <br>
    <input type="submit" value="저장">
    <input type="button" value="취소" onclick="history.back()">
</form>
<%}else{ %>
로그인 정보가 확인 되지 않습니다.
<%} %>
</body>
</html>
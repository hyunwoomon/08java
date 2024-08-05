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
String s1 = request.getParameter("id");
String s2 = request.getParameter("password");
	String sql;
	String URL="jdbc:mysql://localhost:3306/spring5fs";
    Connection conn=null; 
    PreparedStatement pstmt =null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    out.println("드라이버 로딩 완료");
    conn=DriverManager.getConnection(URL, "spring5", "spring5");
    out.println("sql 접속 완료");
    sql="select * from user_account";
    pstmt=  conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
    	String o1 = rs.getString("id");
    	if(s1.equals(o1)){
    		String o2 = rs.getString("password");
    		if(s2.equals(o2)){
    			String o3 =rs.getString("name");
    			session.setAttribute("boardid",s1);
    			session.setAttribute("boardname",o3);
    			
    		}
    		
    	}
    	
    }
    response.sendRedirect("list.jsp");
		%>

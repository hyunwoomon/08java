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
String name = request.getParameter("name");
String id = request.getParameter("id");
String password = request.getParameter("password");
String passwordcheck = request.getParameter("passwordcheck");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String gender = request.getParameter("gender");
sql="select * from user_account where id='"+id+"'";
pstmt=  conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
if(!rs.next()){
	if(password!=passwordcheck){
		Date today = new Date();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String time=fm.format(today);

		sql="INSERT INTO user_account(name,id,password,email,date,phone,gender) VALUES ('"+name+"','"+id+"','"+password+"','"+email+"','"+time+"','"+phone+"','"+gender+"')";
		pstmt=  conn.prepareStatement(sql);
		pstmt.executeUpdate(sql);
		response.sendRedirect("list.jsp");
	}else{
		out.println("패스워드가 다릅니다.");
	}
	
}else{
	out.println("id가 중복되었습니다");
	
}

%>
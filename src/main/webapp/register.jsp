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
%>
<!DOCTYPE html>
<html>
<head>
<style>
        table { width:800px; text-align:center; }
        th    { width:150px; background-color:cyan; }
        input[type=text], textarea { width:40%; }
    </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="regis.jsp">
    <table>
        <tr>
            <th>이름</th>
            <td><input type="text" name="name"  maxlength="80"
                       value="">
            </td>
        </tr>
        <tr>
            <th>아이디</th>
            <td><input type="text" name="id" maxlength="20"
                       value="">
            </td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="text" name="password" maxlength="20"
                       value="">
            </td>
        </tr>
        <tr>
            <th>비밀번호 확인</th>
            <td><input type="text" name="passwordcheck" maxlength="20"
                       value="">
            </td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><input type="text" name="email" maxlength="20"
                       value="">
            </td>
        </tr>
        <tr>
            <th>휴대폰</th>
            <td><input type="text" name="phone" maxlength="20"
                       value="">
            </td>
        </tr>
        <tr>
            <th>성별</th>
            <td><select name="gender">
            <option	value="남성">남성</option>
            <option	value="여성">여성</option>
            </select>
            </td>
        </tr>
    </table>

    <br>
    <input type="submit" value="회원가입">
    <input type="button" value="취소" onclick="history.back()">
</form>
</body>
</html>
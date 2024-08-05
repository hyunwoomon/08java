<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="logins.jsp">
    <table>
        <tr>
            <th>아이디</th>
            <td><input type="text" name="id"  maxlength="80"
                       value="">
            </td>
        </tr>
        <tr>
            <th>패스워드</th>
            <td><input type="password" name="password" maxlength="20"
                       value="">
            </td>
        </tr>
    </table>

    <br>
    <input type="submit" value="로그인">
</form>
</body>
</html>
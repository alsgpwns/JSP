<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="HTML Study">
<meta name="keywords" content="HTML,CSS,XML,JavaScript">
<meta name="author" content="Bruce">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>edit</title>
</head>
<body>
	<%
		String pw1=request.getParameter("pw");
		String no=request.getParameter("no");
		String menu=request.getParameter("menu");
		out.write(pw1);
		out.write(menu);
	%>
	<form method="post" action="inputCheck.jsp">
	<table>
	<tr>
		<td>비밀번호 </td>
		<td><input type="password" name="pw2"></td>
	</tr>
	</table>
	
	<input type="submit" value="확인">
	<input type="hidden" name="no" value="<%=no %>">
	<input type="hidden" name="pw1" value="<%=pw1%>">
	<input type="hidden" name="menu" value="<%=menu%>">
	</form>
</body>
</html>
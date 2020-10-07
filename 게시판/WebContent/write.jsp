<%@page import ="java.sql.*" %>
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

<title>글쓰기</title>
</head>
<body>

	<p style="padding-left:110px">글쓰기</p>
	<form method="post" action="writeSuccess.jsp">
		<table>
			<tr>
				<td><label for="title">제목 </label></td>
				<td><input type="text" name="title" id="title" required></td>
			</tr>
			<tr>
				<td><label for="name">이름 </label></td>
				<td><input type="text" name="name" id="name" required></td>
			</tr>
			<tr>
				<td><label for="pw">비밀번호 </label></td>
				<td><input type="password" name="password" id="pw" required></td>
			</tr>
			<tr>
				<td><label for="email">E-Mail </label></td>
				<td><input type="text" name="email" id="email" required></td>
			</tr>
		</table>
		<textarea name="contents" id="contents" cols="50" rows="10" placeholder='내용을 입력하세요.' required style="overflow-x:hidden; overflow-y:scroll; resize: none;﻿"></textarea><br>
		<div id="button" style="padding-left:100px;padding-top:10px;">
			<input type="submit" value="등록" >
			<input type="button" value="목록" onclick="location.href='list.jsp'">
		</div>
	</form>

</body>
</html>
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
<link rel="stylesheet" type="text/CSS" href="css/write.css">
<link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<title>글쓰기</title>
</head>
<body>

<header>
		<h1><img src="img/block_logo.jpg" alt="logo" id="logoimg"></img> <h3 id="logo"> Welcome to the<br>BlockChain Border!</h3></h1>
</header>

<main>
	<form method="post" action="writeSuccess.jsp">
		<table>
		<caption>write</caption>
			<tr>
				<td><label for="title">Title </label></td>
				<td><input type="text" name="title" id="title" required></td>
			</tr>
			<tr>
				<td><label for="name">Name </label></td>
				<td><input type="text" name="name" id="name" required></td>
			</tr>
			<tr>
				<td><label for="pw">Password </label></td>
				<td><input type="password" name="password" id="pw" required></td>
			</tr>
			<tr>
				<td><label for="email">E-Mail </label></td>
				<td><input type="text" name="email" id="email" required></td>
			</tr>
		</table>
		<textarea name="contents" id="contents" cols="50" rows="10" placeholder='내용을 입력하세요.' required style="overflow-x:hidden; overflow-y:scroll; resize: none;﻿"></textarea><br>
		<div id="button" style="padding-left:100px;padding-top:10px;">
			<input id="writeBtn" type="submit" value="Write" >
			<input id="listBtn" type="button" value="List" onclick="location.href='list.jsp'">
		</div>
	</form>
	
</main>

<footer>
	<section class="links" id="link1">
		<h3>Random Stuff</h3>
		<ul class="style2">
			<li><a href="#">Etiam feugiat condime</a></li>
			<li><a href="#">Aliquam imperdiet first</a></li>
			<li><a href="#">Sed porttitor cras in erat</a></li>
			<li><a href="#">Felis varius pellentesque</a></li>
			<li><a href="#">Nullam scelerisque second</a></li>
		</ul>
	</section>

	<section class="links" id="link2">
		<h3>Random Stuff</h3>
		<ul class="style2">
			<li><a href="#">Etiam feugiat condime</a></li>
			<li><a href="#">Aliquam imperdiet first</a></li>
			<li><a href="#">Sed porttitor cras in erat</a></li>
			<li><a href="#">Felis varius pellentesque</a></li>
			<li><a href="#">Nullam scelerisque second</a></li>
		</ul>
	</section>

	

	<section class="contact">
		<h3>Contact Us</h3>
		<a href="https://hye-jun.netlify.app/">Developer's page</a>
		<p>BCN LAB, Building D <br />Hongik University<br />Sejong City • South Korea<br />
		(800) 555-0000</p>
	</section>

	<div id="copyright">
		<ul>
			<li>© Untitled. All rights reserved 　|</li>
			
			<li>　Design: Hyejun-min</li>
		</ul>
	</div>
</footer>


</body>
</html>
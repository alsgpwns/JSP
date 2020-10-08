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
<link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/CSS" href="css/InputPw.css">
<title>edit</title>
</head>
<body>

<header>
		<h1><img src="img/block_logo.jpg" id="logoimg"></img> <h3 id="logo"> Welcome to the<br>BlockChain Border!</h3></h1>
</header>

	<%
		String pw1=request.getParameter("pw");
		String no=request.getParameter("no");
		String menu=request.getParameter("menu");
	%>
<main>
	<form method="post" action="inputCheck.jsp">
	<table>
	<tr>
		<td id="pwInput">password: </td>
		<td><input type="password" id="pw2Input" name="pw2"></td>
	</tr>
	</table>
	
	<input type="submit"  id="submitBtn" value="Check">
	<input type="hidden" name="no" value="<%=no %>">
	<input type="hidden" name="pw1" value="<%=pw1%>">
	<input type="hidden" name="menu" value="<%=menu%>">
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
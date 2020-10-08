<%@page import="java.sql.*" %>
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
<link rel="stylesheet" type="text/CSS" href="css/modify.css">
<title>modify</title>
</head>
<body>
<header>
		<h1><img src="img/block_logo.jpg" id="logoimg"></img> <h3 id="logo"> Welcome to the<br>BlockChain Border!</h3></h1>
</header>

<%!
	private final String driver="com.mysql.cj.jdbc.Driver";
	private final String url="jdbc:mysql://localhost:3306/object?useSSl=false&serverTimezone=UCT";
	private final String user="root";
	private final String psword="1234";
%>
<%
	String no = request.getParameter("no");
	String query ="select title,name,wTime,contents from board where no="+no;
	Statement stmt = null;
	Connection conn = null;
	ResultSet rs = null;


	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,psword);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while(rs.next()){
%>
<main>
		<form method="post" action="modifySuccess.jsp">
			<table border="1">
			<caption id="catption">Edit</caption>
			<tr>
				<td id="title">제목</td>
				<td><input type="text" name="title" value='<%=rs.getString("title") %>'></td>
			</tr>
			<tr>
				<td id="name">이름</td>
				<td><input type="text" name="name" value='<%=rs.getString("name") %>'></td>
			</tr>
			<tr>
				<td id="date">작성일</td>
				<td><%=rs.getString("wTime") %></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="contents" cols="50" rows="10" style="overflow-x:hidden; overflow-y:scroll;resize: none;"><%=rs.getString("contents") %></textarea></td>
			</tr>
			</table>
			<input type="submit" id="editBtn" value="Edit">
			<input type="hidden" name="no" value="<%=no%>">
			<input type="submit" id="listBtn" value="List" onclick="location.href='list.jsp'">
		</form>
</main>	
<%
		}
	} catch(ClassNotFoundException e){
		System.out.println("Driver load fail! ");
	} catch(SQLException e){
		e.printStackTrace();
	}finally{
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {}	
	}
%>

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
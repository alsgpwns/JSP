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
<link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/CSS" href="css/list.css">
<title>혜멍이네 게시판</title>
</head>
<body>

<header>
		<h1><img src="img/block_logo.jpg" alt="logo" id="logoimg"></h1> <h3 id="logo"> Welcome to the<br>BlockChain Border!</h3>
</header>
	
<main>
	<table border="1">
	<caption>List</caption>
	<tr id="firstTr">
		<td id="no"> no </td>
		<td id="title"> title </td>
		<td id="name"> name </td>
		<td id="date"> date </td>
		<td id="view"> views </td>
	</tr>

		
<%!
	private final String driver="com.mysql.cj.jdbc.Driver";
	private final String url="jdbc:mysql://localhost:3306/object?useSSl=false&serverTimezone=UCT";
	private final String user="root";
	private final String psword="1234";
%>

<%
	String query = "select* from board order by no desc";
	Statement stmt = null;
	Connection conn = null;
	ResultSet resultSet = null;
	int count=0;
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,psword);
		stmt = conn.createStatement();
		resultSet = stmt.executeQuery(query);


		while(resultSet.next()){
%>
			<tr>
				<td><%=resultSet.getInt("no") %></td>
				<td><a href="show.jsp?no=<%=resultSet.getInt("no")%>"><%=resultSet.getString("title") %></a></td>
				<td><a href="mailto:<%=resultSet.getString("email")%>?Subject=from 혜멍's 게시판"><%=resultSet.getString("name") %></a></td>
				<td><%=resultSet.getString("wTime") %></td>
				<td><%=resultSet.getString("rcnt") %></td>
			</tr>
			
<%
		}
	} catch(ClassNotFoundException e){
		out.write("mysql driver load fail!");
		e.printStackTrace();
	} catch (SQLException e) {
		out.write("mysql connect fail!");
		e.printStackTrace();
	} finally{
		try {
			if(resultSet != null) resultSet.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}


%>
	</table>
		<input type="button" value="Wirte" name="wirte" id="WriteButton" onclick="location.href='write.jsp'">
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
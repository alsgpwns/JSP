<%@ page import="java.sql.*" %>
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
<link rel="stylesheet" type="text/CSS" href="css/show.css">
<title>내용 보기</title>
</head>
<body>

<header>
		<h1><img src="img/block_logo.jpg" alt="logo" id="logoimg"></h1> <h3 id="logo"> Welcome to the<br>BlockChain Border!</h3>
</header>
<%!
		private final String driver="com.mysql.cj.jdbc.Driver";
		private final String url ="jdbc:mysql://localhost:3306/object?useSSL=false&serverTimezone=UTC";
		private final String user="root";
		private final String pwd="1234";
%>
<%
	String no = request.getParameter("no");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String query = "select title,name,wTime,contents,rcnt,password from board where no="+no;
	int count = 0;
	String pw =null;
%>


<%
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,pwd);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while(rs.next()){
		count = rs.getInt("rcnt");		
		pw=rs.getString("password");
%>

<main>
	<table border="1">
	<caption>contents</caption>
	<tr>
		<td class="contents">title</td>
		<td><%=rs.getString("title") %></td>
	</tr>
	<tr>
		<td class="contents">name</td>
		<td><%=rs.getString("name") %></td>
	</tr>
	<tr>
		 <td class="contents">date</td>
		<td><%=rs.getString("wTime") %></td>
	</tr>
	<tr>
		<td id="text" colspan="2"><%=rs.getString("contents") %></td>
	</tr>
	</table>
	
	<input type="button" id="list" value="List" onclick="location.href='list.jsp'">
	
	<form method="post" action="inputPw.jsp">
	<input type="hidden" name="no" value="<%=no %>">
	<input type="hidden" name="pw" value="<%=pw %>">
	<input type="hidden" name="menu" value="1">
	<input type="submit" id="edit" value="Edit">
	</form>
	
	<form method="post" action="inputPw.jsp">
	<input type="hidden" name="no" value="<%=no %>">
	<input type="hidden" name="pw" value="<%=pw %>">
	<input type="hidden" name="menu" value="2">
	<input type="submit" id="delete" value="Delete">
	</form>
</main>

<%
		}
		count++;
		query = "update board set rcnt= "+ count +" where no="+no;
		stmt.executeUpdate(query);
	} catch(ClassNotFoundException e){
		System.out.println("Driver load error!");
	} catch(SQLException e){
		e.printStackTrace();
	} finally{
		try{
			if( rs!=null) rs.close();
			if(stmt!=null)stmt.close();
			if(conn !=null) conn.close();
		} catch(SQLException e){
			e.printStackTrace();
		}
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
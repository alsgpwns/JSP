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
<link rel="stylesheet" type="text/CSS" href="css/board.css">
<title>혜멍이네 게시판</title>
</head>
<body>
	<table border="1">
	<caption>목록</caption>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
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
	<input type="button" value="글쓰기" name="wirte" onclick="location.href='write.jsp'">
	
</body>
</html>
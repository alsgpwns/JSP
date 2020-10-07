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

<title>modify</title>
</head>
<body>
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
		<form method="post" action="modifySuccess.jsp">
			<table border="1">
			<caption>수정 하기</caption>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" value='<%=rs.getString("title") %>'></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value='<%=rs.getString("name") %>'></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=rs.getString("wTime") %></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="contents" cols="50" rows="10" style="overflow-x:hidden; overflow-y:scroll;resize: none;"><%=rs.getString("contents") %></textarea></td>
			</tr>
			</table>
			<input type="hidden" name="no" value="<%=no%>">;
			<input type="submit" value="수정">
		</form>
		<input type="submit" value="목록" onclick="location.href='list.jsp'">
		
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
	

</body>
</html>
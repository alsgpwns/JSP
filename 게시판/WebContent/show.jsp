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
<title>내용 보기</title>
</head>
<body>
	
<%!
		private final String driver="com.mysql.cj.jdbc.Driver";
		private final String url ="jdbc:mysql://localhost:3306/object?useSSl=false&serverTimezone=UCT";
		private final String user="root";
		private final String pwd="1234";
%>
<%
	String no = request.getParameter("no");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String query = "select title,name,wTime,contents from board where no="+no;
%>


<%
	
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,pwd);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while(rs.next()){
			
%>

	<table border="1">
	<caption>내용 보기</caption>
	<tr>
		<td>제목</td>
		<td><%=rs.getString("title") %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=rs.getString("name") %></td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><%=rs.getString("wTime") %></td>
	</tr>
	<tr>
		<td colspan="2"><textarea cols="50" rows="10" style="overflow-x:hidden; overflow-y:scroll;resize: none;"><%=rs.getString("contents") %></textarea></td>
	</tr>
	</table>
	<input type="button" value="목록" onclick="location.href='list.jsp'">
	<input type="button" value="수정">
	<input type="button" value="삭제">
<%
		}
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



</body>
</html>
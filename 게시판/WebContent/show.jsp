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
		<td colspan="2"><%=rs.getString("contents") %></td>
	</tr>
	</table>
	
	<input type="button" value="목록" onclick="location.href='list.jsp'">
	
	<form method="post" action="inputPw.jsp">
	<input type="hidden" name="no" value="<%=no %>">
	<input type="hidden" name="pw" value="<%=pw %>">
	<input type="hidden" name="menu" value="1">
	<input type="submit" value="수정">
	</form>
	
	<form method="post" action="inputPw.jsp">
	<input type="hidden" name="no" value="<%=no %>">
	<input type="hidden" name="pw" value="<%=pw %>">
	<input type="hidden" name="menu" value="2">
	<input type="submit" value="삭제">
	</form>
	

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



</body>
</html>
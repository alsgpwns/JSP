<%@ page import = "java.sql.*" %>
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
<title>Insert title here</title>
</head>
<body>
	<%!
		private final String driver="com.mysql.cj.jdbc.Driver";
		private final String url ="jdbc:mysql://localhost:3306/object?useSSl=false&serverTimezone=UCT";
		private final String user="root";
		private final String pwd="1234";
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		Statement stmt = null;
		Connection conn = null;
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String pw = request.getParameter("password");
		String email = request.getParameter("email");
		String text = request.getParameter("contents");
		String query = "insert into board (title,name,password,email,contents) values('" +title +"','"+name+"','"+pw+"','"+email+"','"+text+ "')";
		
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pwd);
			stmt = conn.createStatement();
			int i= stmt.executeUpdate(query);
			if(i>=1)
			{
	%>
				<script>alert("게시글이 정상적으로 등록되었습니다 !");</script>
	<%
				response.sendRedirect("list.jsp");
			} else {
	%>
				<script>alert("error!");</script>
	<% 
				response.sendRedirect("list.jsp");
			}
			
		} catch(ClassNotFoundException e)
		{
			out.write("mysql driver load fail !");
			e.printStackTrace();
		} catch(SQLException e){
			out.write("mysql connect fail !");
			e.printStackTrace();
		} finally {
			try{
				if(stmt !=null) stmt.close();
				if(conn !=null) conn.close();
			} catch (Exception e){
				System.out.println("close() error!");
			}
		}
	%>
	
	
</body>
</html>
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
<link rel="stylesheet" type="text/CSS" href="css/board.css">
<title>edit</title>
</head>
<body>
<%!
	private final String driver="com.mysql.cj.jdbc.Driver";
	private final String url="jdbc:mysql://localhost:3306/object?useSSl=false&serverTimezone=UCT";
	private final String user="root";
	private final String psword="1234";
%>

<%
	Connection conn=null;
	Statement stmt=null;
	String query =null;
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,psword);
		stmt = conn.createStatement();
	} catch(ClassNotFoundException e){
		System.out.println("Driver load fail! ");
	} catch(SQLException e){
		e.printStackTrace();
	}
	
	String no =request.getParameter("no");
	String pw1=request.getParameter("pw1");
	String pw2=request.getParameter("pw2");
	String menu_str=request.getParameter("menu");
	int menu=Integer.parseInt(menu_str);

	if(pw1.equals(pw2) && menu==2){
		query="delete from board where no="+no;
		stmt.executeUpdate(query);
%>
	<script>
			alert("삭제 완료!");
			location.href = "list.jsp";	
	</script>
<%
	} else if(pw1.equals(pw2) && menu==1){
%>
	<script>
		location.href = "modify.jsp?no=<%=no%>";
	</script>
<%
	} else{
%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		location.href="list.jsp";
	</script>
<%
	}
%>


</body>
</html>
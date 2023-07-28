<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width initial-scale=1.0">
<link rel="stylesheet" href="./Assets/CSS/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Ubuntu:wght@300;400;500&display=swap"
	rel="stylesheet">
<title>Delete Post | Mavew</title>
</head>
<body>
	<%
		DatabaseConn conn;
		String postId = (String)request.getParameter("post_id");
		
		try{
			conn = DatabaseConn.getInstance();
			PreparedStatement pstmt;
			String query = "delete from posts where post_id=?";
			pstmt = conn.getPreparedStatement(query);
			pstmt.setInt(1, Integer.parseInt(postId));
			pstmt.execute();
			response.sendRedirect(request.getContextPath()+"/manage-post.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>
</body>
</html>
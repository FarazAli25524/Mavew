<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete User | Mavew</title>
</head>
<body>
<%
		DatabaseConn conn;
		String userId = (String)request.getParameter("user_id");
		
		try{
			conn = DatabaseConn.getInstance();
			PreparedStatement pstmt;
			String query = "delete from users where user_id=?";
			pstmt = conn.getPreparedStatement(query);
			pstmt.setInt(1, Integer.parseInt(userId));
			pstmt.execute();
			response.sendRedirect(request.getContextPath()+"/manage-user.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>
</body>
</html>
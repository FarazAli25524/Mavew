<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Category | Mavew</title>
</head>
<body>
	<%
		DatabaseConn conn;
		String categoryId = (String)request.getParameter("category_id");
		
		try{
			conn = DatabaseConn.getInstance();
			PreparedStatement pstmt;
			String query = "delete from categories where category_id=?";
			pstmt = conn.getPreparedStatement(query);
			pstmt.setInt(1, Integer.parseInt(categoryId));
			pstmt.execute();
			response.sendRedirect(request.getContextPath()+"/manage-category.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	
	%>
</body>
</html>
<%@page import="Database.DatabaseConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
	<%
		DatabaseConn conn;
		session.invalidate();
		conn = DatabaseConn.getInstance();
		response.sendRedirect(request.getContextPath()+"/signIn.jsp");
	%>
</body>
</html>
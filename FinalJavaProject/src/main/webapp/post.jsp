<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConn"%>
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
<title>Post | Mavew</title>
</head>
<body>

	<!---------------- Navigation Bar ----------------->
	<jsp:include page="./Partials/header.jsp"></jsp:include>
	<%
	DatabaseConn con;
	PreparedStatement pstmt;
	String postId = request.getParameter("post_id");
	try {
		con = DatabaseConn.getInstance();
		String query = "select post_title, post_heading, post_body, post_thumbnail, post_datetime, user_firstname, user_lastname, user_avatar from posts inner join users on post_userid=user_id where post_id=?";
		pstmt = con.getPreparedStatement(query);
		pstmt.setInt(1, Integer.parseInt(postId));
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
	%>
	<section class="singlepost">
		<div class="container singlepost_container">
			<h2><%=rs.getString("post_title")%></h2>
			<div class="post_author">
				<div class="post_author-avatar">
					<img alt="" src="./Assets/Image/<%=rs.getString("user_avatar")%>">
				</div>
				<div class="post_author-info">
					<h5>
						<%
						out.println(rs.getString("user_firstname") + " " + rs.getString("user_lastname"));
						%>
					</h5>
					<small><%=rs.getDate("post_datetime")%></small>
				</div>
				<div class="share-btn-container">
					<a href="#" class="facebook-btn btn"><i class="fa fa-facebook"></i></a>
					<a href="#" class="twitter-btn btn"><i class="fa fa-twitter"></i></a>
					<a href="#" class="linkedin-btn btn"><i class="fa fa-linkedin"></i></a>
					<a href="#" class="pinterest-btn btn"><i class="fa fa-pinterest"></i></a>
					<a href="#" class="whatsapp-btn btn"><i class="fa fa-whatsapp"></i></a>
				</div>
			</div>
			<div class="singlepost_thumail">
				<img src="./Assets/Image/<%=rs.getString("post_thumbnail")%>"
					alt="" class="pinterest-img">
			</div>
			<p><%=rs.getString("post_heading")%></p>
			<br>
			<p><%=rs.getString("post_body")%></p>
			<br>
		</div>
	</section>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	<!---------------- Single Post Section ----------------->
	<script src="./Assets/JS/button.js"></script>
	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
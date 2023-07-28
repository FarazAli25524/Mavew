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
<title>Category - Post | Mavew</title>
</head>
<body>
	<jsp:include page="./Partials/header.jsp"></jsp:include>
	<!---------------- Navigation Bar ----------------->

	<%
	DatabaseConn con;
	PreparedStatement pstmt;
	String categoryId = request.getParameter("category_id");
	try {
		con = DatabaseConn.getInstance();
		String query = "select * from categories where category_id=?";
		pstmt = con.getPreparedStatement(query);
		pstmt.setInt(1, Integer.parseInt(categoryId));
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
	%>

	<header class="category_title">
		<h2>Category | <%=rs.getString("category_title")%></h2>
	</header>
	<%
		}
	%>

	<!---------------- Header Section ----------------->


	<section class="posts">
		<div class="container posts_container">
			<%
			query = "select category_id, category_title, post_id, post_title, post_heading, post_body, post_thumbnail, post_datetime, user_firstname, user_lastname, user_avatar from categories join posts on post_categoryid=category_id join users on post_userid=user_id where category_id=?";
			pstmt = con.getPreparedStatement(query);
			pstmt.setInt(1, Integer.parseInt(categoryId));
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<article class="post">
				<div class="post_thumbail">
					<img alt="" src="./Assets/Image/<%=rs.getString("post_thumbnail")%>">
				</div>
				<div class="post_info">
					<a href="" class="category_button"><%=rs.getString("category_title") %></a>
					<h3 class="post_title">
						<a href="post.jsp?post_id=<%=rs.getInt("post_id")%>"><%=rs.getString("post_title") %></a>
					</h3>
					<p class="post_body"><%=rs.getString("post_heading") %></p>
					<div class="post_author">
						<div class="post_author-avatar">
							<img alt="" src="./Assets/Image/<%=rs.getString("user_avatar")%>">
						</div>
						<div class="post_author-info">
							<h5><%out.println(rs.getString("user_firstname")+" "+rs.getString("user_lastname"));%></h5>
							<small><%=rs.getDate("post_datetime") %></small>
						</div>
					</div>
				</div>
			</article>
			<%
				}
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</div>
	</section>
	<!---------------- Posts Section ----------------->
	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
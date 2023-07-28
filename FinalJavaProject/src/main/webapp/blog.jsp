<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
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
<title>Blog | Mavew</title>
</head>
<body>
	<jsp:include page="./Partials/header.jsp"></jsp:include>

	<!---------------- Navigation Bar ----------------->

	<section class="search_bar">
		<form action="SearchPost" method="post"  class="container search_bar-container">
			<div>
				<i class="fa fa-search" aria-hidden="true"></i>
				 <input type="search" placeholder="Search..." name="search">
			</div>
			<button type="submit" class="btn">Go</button>
		</form>
	</section>

	<!---------------- Search Section ----------------->

	<section class="posts">
		<div class="container posts_container">
			<%
			ArrayList<Integer> list;
			list = (ArrayList<Integer>)session.getAttribute("allPost");
			DatabaseConn con;
			PreparedStatement pstmt;
			ResultSet rs;
			try{
				con = DatabaseConn.getInstance();
				String query;
				if(list!=null){
					for(int i : list){
						query = "select post_id, post_title, post_heading, post_thumbnail, post_datetime, category_id, category_title, user_firstname, user_lastname, user_avatar from posts join categories on  post_categoryid=category_id join users on post_userid=user_id where post_id="+i;
						pstmt = con.getPreparedStatement(query);
						rs = pstmt.executeQuery();
						while(rs.next()){
		%>

			<article class="post">
				<div class="post_thumbail">
					<img alt="" src="./Assets/Image/<%=rs.getString("post_thumbnail")%>">
				</div>
				<div class="post_info">
					<a href="category-post.jsp?category_id=<%=rs.getInt("category_id")%>" class="category_button"><%=rs.getString("category_title") %></a>
					<h3 class="post_title">
						<a href="post.jsp?post_id=<%=rs.getInt("post_id")%>"><%=rs.getString("post_title")%></a>
					</h3>
					<p class="post_body"><%=rs.getString("post_heading") %></p>
					<div class="post_author">
						<div class="post_author-avatar">
							<img alt="Profile-1" src="./Assets/Image/<%=rs.getString("user_avatar")%>">
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
					}
				}
				else{
					query = "select post_id, post_title, post_heading, post_thumbnail, post_datetime, category_id, category_title, user_firstname, user_lastname, user_avatar from posts join categories on  post_categoryid=category_id join users on post_userid=user_id";
					pstmt = con.getPreparedStatement(query);
					rs = pstmt.executeQuery();
					while(rs.next()){
			%>
						<article class="post">
				<div class="post_thumbail">
					<img alt="" src="./Assets/Image/<%=rs.getString("post_thumbnail")%>">
				</div>
				<div class="post_info">
					<a href="category-post.jsp?category_id=<%=rs.getInt("category_id")%>" class="category_button"><%=rs.getString("category_title") %></a>
					<h3 class="post_title">
						<a href="post.jsp?post_id=<%=rs.getInt("post_id")%>"><%=rs.getString("post_title")%></a>
					</h3>
					<p class="post_body"><%=rs.getString("post_heading") %></p>
					<div class="post_author">
						<div class="post_author-avatar">
							<img alt="Profile-1" src="./Assets/Image/<%=rs.getString("user_avatar")%>">
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
						}
			%>
		</div>
	</section>
	<!---------------- Posts Section ----------------->

	<section class="category_buttons">
		<h2>Categories</h2>
		<div class="container category_buttons-container">
		<%
			query = "select * from categories";
			pstmt = con.getPreparedStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
			<a href="category-post.jsp?category_id=<%=rs.getInt("category_id")%>" class="category_button"><%=rs.getString("category_title") %></a>
		<%
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		%>		
		</div>
	</section>

	<!---------------- Category Button Section ----------------->
	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
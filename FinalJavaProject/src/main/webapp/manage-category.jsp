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
<title>Manage Category | Mavew</title>
</head>
<body>
	<nav>
		<div class="container nav_container">
			<a href="index.jsp" class="nav_logo">Mavew</a>
			<ul class="nav_items">
				<li class="nav_profile <%=session.getAttribute("display")%>">
					<div class="avatar">
						<img src="./Assets/Image/<%=session.getAttribute("avatar")%>" alt="Profile.logo">
					</div>
					<ul>
						<li><a href="dashboard.jsp">Dashboard</a></li>
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</li>
			</ul>
			<button id="open_nav-btn">
				<i class="fa fa-bars"></i>
			</button>
			<button id="close_nav-btn">
				<i class="fa fa-close"></i>
			</button>
		</div>
	</nav>
	
	<section class="dashboard">
		<div class="container dashboard_container">
		<button id="show_sidebar-btn" class="sidebar_toggle"><i class="fa fa-angle-right"></i></button>
		<button id="hide_sidebar-btn" class="sidebar_toggle"><i class="fa fa-angle-left"></i></button>
			<aside>
				<ul>
					<li>
						<a href="add-post.jsp"><i class="fa fa-plus"></i><h5>Add Post</h5></a>
					</li>
					<li>
						<a href="manage-post.jsp"><i class="fa fa-edit"></i><h5>Manage Post</h5></a>
					</li>
					<li>
						<a href="add-user.jsp"><i class="fa fa-user"></i><h5>Add User</h5></a>
					</li>
					<li>
						<a href="manage-user.jsp"><i class="fa fa-group"></i><h5>Manage User</h5></a>
					</li>
					<li>
						<a href="add-category.jsp"><i class="fa fa-book"></i><h5>Add Category</h5></a>
					</li>
					<li>
						<a href="manage-category.jsp" class="active"><i class="fa fa-list"></i><h5>Manage Category</h5></a>
					</li>
				</ul>
			</aside>
			<main>
				<h2>Manage Categories</h2>
				<table>
					<thead>
						<tr>
							<th>Title</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<%
						DatabaseConn con;
						String userId = (String)session.getAttribute("userId");
						try {
							con = DatabaseConn.getInstance();
							PreparedStatement pstmt;
							String query = "select * from categories;";
							pstmt = con.getPreparedStatement(query);
							ResultSet rs = pstmt.executeQuery();
							while (rs.next()) {
						%>
						<tr>
					
							<td><%= rs.getString("category_title") %></td>
							<td><a href="edit-category.jsp?category_id=<%= rs.getInt("category_id") %>" class="btn sm">Edit</a></td>
							<td><a href="delete-category.jsp?category_id=<%= rs.getInt("category_id") %>" class="btn sm danger">Delete</a></td>
						</tr>
						<%
						}

						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</tbody>
				</table>
			</main>
		</div>
	</section>
	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
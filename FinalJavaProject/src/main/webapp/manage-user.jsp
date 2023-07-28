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
<title>Manage User | Mavew</title>
</head>
<body>
	<nav>
		<div class="container nav_container">
			<a href="index.jsp" class="nav_logo">Mavew</a>
			<ul class="nav_items">
				<li class="nav_profile <%=session.getAttribute("display")%>">
					<div class="avatar">
						<img src="./Assets/Image/<%=session.getAttribute("avatar")%>"
							alt="Profile.logo">
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
			<button id="show_sidebar-btn" class="sidebar_toggle">
				<i class="fa fa-angle-right"></i>
			</button>
			<button id="hide_sidebar-btn" class="sidebar_toggle">
				<i class="fa fa-angle-left"></i>
			</button>
			<aside>
				<ul>
					<li><a href="add-post.jsp"><i class="fa fa-plus"></i>
						<h5>Add Post</h5></a></li>
					<li><a href="manage-post.jsp"><i class="fa fa-edit"></i>
						<h5>Manage Post</h5></a></li>
					<li><a href="add-user.jsp"><i class="fa fa-user"></i>
						<h5>Add User</h5></a></li>
					<li><a href="manage-user.jsp" class="active"><i
							class="fa fa-group"></i>
						<h5>Manage User</h5></a></li>
					<li><a href="add-category.jsp"><i class="fa fa-book"></i>
						<h5>Add Category</h5></a></li>
					<li><a href="manage-category.jsp"><i class="fa fa-list"></i>
						<h5>Manage Category</h5></a></li>
				</ul>
			</aside>
			<main>
				<h2>Manage User</h2>
				<table>
					<thead>
						<tr>
							<th>Name</th>
							<th>Username</th>
							<th>Role</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<%
						DatabaseConn con;
						String userId = (String) session.getAttribute("userId");
						try {
							con = DatabaseConn.getInstance();
							PreparedStatement pstmt;
							String query = "select * from users where user_id!=?;";
							pstmt = con.getPreparedStatement(query);
							pstmt.setInt(1, Integer.parseInt(userId));
							ResultSet rs = pstmt.executeQuery();
							while (rs.next()) {
						%>
						<tr>

							<td><% out.println(rs.getString("user_firstname") + " " + rs.getString("user_lastname"));%></td>
							<td><%=rs.getString("user_username")%></td>
							<%
								if(rs.getString("user_isadmin").equals("1")){
									out.println("<td>Admin</td>");
								}else{
									out.println("<td>Author</td>");
								}
							%>
							<td><a
								href="edit-user.jsp?user_id=<%=rs.getInt("user_id")%>"
								class="btn sm">Edit</a></td>
							<td><a
								href="delete-user.jsp?user_id=<%=rs.getInt("user_id")%>"
								class="btn sm danger">Delete</a></td>
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
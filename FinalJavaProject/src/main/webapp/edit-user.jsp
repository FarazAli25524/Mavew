<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConn"%>
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
<title>Edit User | Mavew</title>
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

	<section class="form_section">
		<div class="container form_section-container">
			<h2>Edit User</h2>
			<div class="alert_message <%=request.getParameter("class")%>">
				<p><%=session.getAttribute("msg")%></p>
			</div>
			<form action="EditUser" method="post">
				<%
				DatabaseConn conn;
				String userId = (String)request.getParameter("user_id");
				session.setAttribute("userid", userId);
				try {
					conn = DatabaseConn.getInstance();
					PreparedStatement pstmt;
					String query = "select * from users where user_id=?";
					pstmt = conn.getPreparedStatement(query);
					pstmt.setInt(1, Integer.parseInt(userId));
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {
				%>
				<input type="text"  name="first_name" value="<%=rs.getString("user_firstname")%>">
				<input type="text"  name="last_name" value="<%=rs.getString("user_lastname")%>">
				<select name="role">
				<option value='' disabled>Choose Role</option>
					<%
					
						String[] role = {"Author", "Admin"};
						int user_isadmin = rs.getInt("user_isadmin");
						for(int i=0; i<2; i++){
							if(i == user_isadmin){
								out.println("<option value='"+i+"'selected>"+role[i]+"</option>");
							}
							else{
								out.println("<option value='"+i+"'>"+role[i]+"</option>");
							}
						}
					%>
				</select>
				<%
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
				<div class="form_btn">
					<button type="submit" class="btn">Update</button>
					<button type="reset" class="btn">Back</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
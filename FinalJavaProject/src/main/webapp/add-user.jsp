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
<title>Add User | Mavew</title>
</head>
<body>
	<nav>
		<div class="container nav_container">
			<a href="index.jsp" class="nav_logo">Mavew</a>
			<ul class="nav_items">
				<li class="nav_profile <%= session.getAttribute("display")%>">
					<div class="avatar">
						<img src="./Assets/Image/<%= session.getAttribute("avatar")%>" alt="Profile.logo">
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
			<h2>Add User</h2>
			<div class="alert_message <%=request.getParameter("class")%>">
				<p>
					<%
					boolean value = Boolean.parseBoolean(request.getParameter("msg"));
					if (value) {
						out.println("User Added!");
					} else {
						out.println("Password Mismatch!");
					}
					%>
				</p>
			</div>
			<form action="AddUser" method="post" enctype="multipart/form-data">
				<input type="text" placeholder="First Name" name="first_name">
				<input type="text" placeholder="Last Name" name="last_name">
				<input type="text" placeholder="Username" name="username">
				<input type="email" placeholder="Email" name="email">
				<input type="password" placeholder="Create Password" name="create_password">
				<input type="password" placeholder="Confirm Password" name="confirm_password">
				<select name="role">
					<option selected disabled>Choose Role</option>
					<option value="1">Admin</option>
					<option value="0">Author</option>
				</select>	
				<div class="radio_btn-control">
					Gender
					<input type="radio" id="male" name="gender" value="Male">
					<label for="male">Male</label>
					<input type="radio" id="female" name="gender" value="Female">
					<label for="female">Female</label>
					<input type="radio" id="other" name="gender" value="Other">
					<label for="other">Other</label>
				</div>
				<div class="form_control">
					<label for="avatar">Avatar</label>
					<input type="file" id="avatar" name="avatar">
				</div>
				<div class="form_btn">
					<button type="submit" class="btn">Add User</button>
					<button type="reset" class="btn">Reset</button>
				</div>
			</form>
		</div>
	</section>
	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
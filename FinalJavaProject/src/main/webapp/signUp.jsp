<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.Object"%>
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
<title>Sign Up | Mavew</title>
</head>
<body>
	<nav>
		<div class="container nav_container">
			<a href="index.jsp" class="nav_logo">Mavew</a>
		</div>
	</nav>

	<section class="form_section">
		<div class="container form_section-container">
			<h2>Sign Up</h2>
			<div class="alert_message <%=request.getParameter("class")%>">
				<p>
					<%
					boolean value = Boolean.parseBoolean(request.getParameter("msg"));
					if (value) {
						out.println("Successfuly Registered!");
					} else {
						out.println("Password Mismatch!");
					}
					%>
				</p>
			</div>
			<form action="SignUp" method="post" enctype="multipart/form-data">
				<input type="text" placeholder="First Name" name="first_name"
					required> <input type="text" placeholder="Last Name"
					name="last_name" required> <input type="text"
					placeholder="Username" name="username" required> <input
					type="email" placeholder="Email" name="email" required> <input
					type="password" placeholder="Create Password"
					name="create_password" required> <input type="password"
					placeholder="Confirm Password" name="confirm_password" required>
				<div class="radio_btn-control">
					Gender <input type="radio" id="male" name="gender" value="Male"
						required> <label for="male">Male</label> <input
						type="radio" id="female" name="gender" value="Female" required>
					<label for="female">Female</label> <input type="radio" id="other"
						name="gender" value="Other" required> <label for="other">Other</label>
				</div>
				<div class="form_control">
					<label for="avatar">Avatar</label> <input type="file" id="avatar"
						name="profile" required>
				</div>
				<div class="form_btn">
					<button type="submit" class="btn">Register</button>
					<button type="reset" class="btn">Reset</button>
				</div>
				<small>Already have an account?<a href="signIn.jsp">Sign
						In</a></small>
			</form>
		</div>
	</section>

	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
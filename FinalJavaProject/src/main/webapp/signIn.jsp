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
<title>Sign In | Mavew</title>
</head>
<body>
	<nav>
		<div class="container nav_container">
			<a href="index.jsp" class="nav_logo">Mavew</a>
		</div>
	</nav>
	
	<section class="form_section">
		<div class="container form_section-container">
			<h2>Sign In</h2>
			<div class="alert_message <%=request.getParameter("class")%>">
				<p><%= session.getAttribute("msg") %></p>
			</div>
			<form action="SignIn" method="post" >
				<input type="email" placeholder="Email" name="email" required>
				<input type="password" placeholder="Password" name="password" required>
				<div class="form_btn">
					<button type="submit" class="btn">Sign In</button>
					<button type="reset" class="btn">Reset</button>
				</div>
				<small>Don't have account?<a href="/signUp.jsp">Sign Up</a></small>
			</form>
		</div>
	</section>
	<jsp:include page="./Partials/footer.jsp"></jsp:include>	
</body>
</html>
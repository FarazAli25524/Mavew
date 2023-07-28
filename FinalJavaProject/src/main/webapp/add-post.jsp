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
<title>Add Post | Mavew</title>
</head>
<body>
	<nav>
		<div class="container nav_container">
			<a href="index.jsp" class="nav_logo">Mavew</a>
			<ul class="nav_items">
				<li class="nav_profile <%= session.getAttribute("display")%>">
					<div class="avatar">
						<img src="./Assets/Image/<%= session.getAttribute("avatar")%>" alt="Profile-logo">
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
			<h2>Add Post</h2>
			<div class="alert_message <%=request.getParameter("class")%>">
				<p>Post Published</p>
			</div>
			<form action="AddPost" method="post" enctype="multipart/form-data">
				<input type="text" placeholder="Title" name="postTitle" required>
				<input type="text" placeholder="Heading" name="postHeading" required>
				<textarea rows="4" cols="" placeholder="Body" name="postBody" required></textarea>
				<select name="postCategory" required>
					<option selected disabled>Select Category</option>
					<option value="1">Politics</option>
					<option value="2">Business</option>
					<option value="3">Entertainment</option>
					<option value="4">Gadgets</option>
					<option value="5">Sport</option>
					<option value="6">Nature</option>
				</select>
				<div class="form_control">
					<label for="thumbail">Post Image</label>
					<input type="file" name="postThumbnail" id="thumbail" required>
				</div>
				<div class="form_control inline">
					<input type="checkbox" id="is_featured" name="postFeatured" checked>
					<label for="is_featured">Featured</label>
				</div>
				
				<div class="form_btn">
					<button type="submit" class="btn">Add Post</button>
					<button type="reset" class="btn">Reset</button>
				</div>
				
			</form>
		</div>
	</section>
	<jsp:include page="./Partials/footer.jsp"></jsp:include>
</body>
</html>
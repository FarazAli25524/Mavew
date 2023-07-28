<%@page import="Database.DatabaseConn" %>
<nav>
	<div class="container nav_container">
		<a href="index.jsp" class="nav_logo">Mavew</a>
		<ul class="nav_items">
			<li><a href="blog.jsp">Blog</a></li>
			<li><a href="about.jsp">About</a></li>
			<li><a href="service.jsp">Services</a></li>
			<li><a href="contact.jsp">Contact</a></li>
			<li><a href="signIn.jsp">Sign In</a></li>
			<li class="nav_profile">
				<div class="avatar">
					<img src="./Assets/Image/Profile.png" alt="Profile.logo">
				</div>
				<ul>
					<li><a href="dashboard.jsp">Dashboard</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
			</li>
		</ul>
		<button type="submit" id="open_nav-btn">
			<i class="fa fa-bars"></i>
		</button>
		<button type="submit" id="close_nav-btn">
			<i class="fa fa-close"></i>
		</button>
	</div>
</nav>
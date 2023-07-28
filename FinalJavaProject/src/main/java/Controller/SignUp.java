package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import Database.DatabaseConn;

@MultipartConfig
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String create_password = request.getParameter("create_password");
		String confirm_password = request.getParameter("confirm_password");
		String gender = request.getParameter("gender");
		Part avatar = request.getPart("profile");
		String file = avatar.getSubmittedFileName();
		String path = getServletContext().getRealPath("/Assets/Image" + File.separator + file);
		
		if (create_password.equals(confirm_password)) {
			DatabaseConn con;
			try {
				con = DatabaseConn.getInstance();
				PreparedStatement pstmt = con.getPreparedStatement(
						"insert into users(user_firstname, user_lastname, user_username, user_email, user_password, user_gender, user_avatar, user_isadmin) values(?,?,?,?,?,?,?,?);");
				pstmt.setString(1, firstName);
				pstmt.setString(2, lastName);
				pstmt.setString(3, username);
				pstmt.setString(4, email);
				pstmt.setString(5, confirm_password);
				pstmt.setString(6, gender);
				pstmt.setString(7, file);
				pstmt.setInt(8, 0);
				pstmt.executeUpdate();
				for (Part part : request.getParts()) {
					part.write(path);
				}
				response.sendRedirect(request.getContextPath() + "/signUp.jsp?msg=true&class=sucess");
			} catch (SQLException e) {
				e.printStackTrace();
			};
		} else {
			response.sendRedirect(request.getContextPath() + "/signUp.jsp?msg=false&class=error");
		}

	}

}

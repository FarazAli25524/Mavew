package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DatabaseConn;

@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		DatabaseConn conn;
		try {
			conn = DatabaseConn.getInstance();
			PreparedStatement pstmt = conn.getPreparedStatement("select * from users where user_email=? and user_password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String avatar = rs.getString("user_avatar");
				session.setAttribute("avatar", avatar);
				session.setAttribute("display", "visible");
				String userId = rs.getString("user_id");
				session.setAttribute("userId", userId);
				int userIsAdmin = rs.getInt("user_isadmin");
				
				if(userIsAdmin==0){
					session.setAttribute("role", "editor");
					response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
				}
				else {
					session.setAttribute("role", "admin");
					response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
				}
			} else {
				session.setAttribute("msg", "Invalid Email or Password.");
				response.sendRedirect(request.getContextPath() + "/signIn.jsp?class=error");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}

package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DatabaseConn;

@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String role = request.getParameter("role");
		String userId = (String) request.getSession().getAttribute("userid");
		DatabaseConn con;
		
		try {
			con = DatabaseConn.getInstance();
			String query = "update users set user_firstname=?, user_lastname=?, user_isadmin=? where user_id=?";
			PreparedStatement pstmt = con.getPreparedStatement(query);
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			if(role.equals("1")) {
				pstmt.setInt(3, 1);
			}else {
				pstmt.setInt(3, 0);
			}
			pstmt.setInt(4, Integer.parseInt(userId));
			pstmt.execute();
			request.getSession().setAttribute("msg", "User Updated!");
			response.sendRedirect(request.getContextPath()+"/edit-user.jsp?user_id="+userId+"&class=sucess");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}

package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DatabaseConn;

@WebServlet("/AddCategory")
public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DatabaseConn con;
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		
		try {
			con = DatabaseConn.getInstance();
			PreparedStatement pstmt;
			String query = "insert into categories(category_title, category_description) values(?, ?);";
			pstmt = con.getPreparedStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, description);
			pstmt.execute();
			response.sendRedirect(request.getContextPath() + "/add-category.jsp?msg=true&class=sucess");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}

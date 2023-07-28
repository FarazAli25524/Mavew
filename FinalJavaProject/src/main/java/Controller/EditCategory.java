package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Database.DatabaseConn;

@WebServlet("/EditCategory")
public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String categoryId = (String)request.getSession().getAttribute("categoryid");
		DatabaseConn con;
		PreparedStatement pstmt;
		
		try {
			con = DatabaseConn.getInstance();
			String query = "update categories set category_title=?, category_description=? where category_id=?;";
			pstmt = con.getPreparedStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, description);
			pstmt.setInt(3, Integer.parseInt(categoryId));
			pstmt.execute();
			request.getSession().setAttribute("msg", "Category Updated!");
			response.sendRedirect(request.getContextPath()+"/edit-category.jsp?category_id="+categoryId+"&class=sucess");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

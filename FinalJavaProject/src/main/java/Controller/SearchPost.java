package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Database.DatabaseConn;

@WebServlet("/SearchPost")
public class SearchPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<Integer> no_of_post = new ArrayList<Integer>();
 		String search = request.getParameter("search");
		DatabaseConn con;
		PreparedStatement pstmt;
		try {
			con = DatabaseConn.getInstance();
			String query = "select post_id, post_title, post_heading, post_thumbnail, post_datetime, category_id, category_title, user_firstname, user_lastname, user_avatar from posts join categories on  post_categoryid=category_id join users on post_userid=user_id";
			pstmt = con.getPreparedStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getString("post_title").contains(search)) {
					no_of_post.add(rs.getInt("post_id"));
				}
			}
			session.setAttribute("allPost", no_of_post);
			response.sendRedirect(request.getContextPath()+"/blog.jsp");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}

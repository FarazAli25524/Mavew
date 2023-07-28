package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Database.DatabaseConn;

@MultipartConfig
@WebServlet("/EditPost")
public class EditPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		
		String userId = (String) session.getAttribute("userId");
		String postid = (String) session.getAttribute("postid");
		String title = request.getParameter("title");
		String heading = request.getParameter("heading");
		String body = request.getParameter("body");
		String category = request.getParameter("category");
		Part thumbnail = request.getPart("thumbnail");
		String is_featured = request.getParameter("featured");
		
		String file = thumbnail.getSubmittedFileName();
		String path = getServletContext().getRealPath("/Assets/Image" + File.separator + file);

		DatabaseConn con;

		try {
			con = DatabaseConn.getInstance();
			PreparedStatement pstmt;
			int featured_value;
			if(is_featured == null) {
				featured_value=0;	
			}
			else {
				featured_value=1;
			}
			
			String query = "update posts set post_title=?, post_heading=?, post_body=?, post_categoryid=?, post_thumbnail=?, post_datetime=?, post_isfeatured=? where post_userid=? and post_id=?";
			pstmt = con.getPreparedStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, heading);
			pstmt.setString(3, body);
			pstmt.setInt(4, Integer.parseInt(category));
			pstmt.setString(5, file);
			pstmt.setDate(6, date);
			pstmt.setInt(7, featured_value);
			pstmt.setInt(8, Integer.parseInt(userId));
			pstmt.setInt(9, Integer.parseInt(postid));
			pstmt.execute();
			
			for (Part part : request.getParts()) {
				part.write(path);
			} 
			session.setAttribute("msg", "Post Updated!");
			response.sendRedirect(request.getContextPath()+"/edit-post.jsp?post_id="+postid+"&class=sucess");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}

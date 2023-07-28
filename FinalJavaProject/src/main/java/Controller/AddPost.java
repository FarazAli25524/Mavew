package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Database.DatabaseConn;

@MultipartConfig
@WebServlet("/AddPost")
public class AddPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		
		String userId = (String) request.getSession().getAttribute("userId");
		String title = request.getParameter("postTitle");
		String heading = request.getParameter("postHeading");
		String body = request.getParameter("postBody");
		String category = request.getParameter("postCategory");
		Part thumbnail = request.getPart("postThumbnail");
		String is_featured = request.getParameter("postFeatured");
		String file = thumbnail.getSubmittedFileName();
		String path = getServletContext().getRealPath("/Assets/Image" + File.separator + file);

		DatabaseConn con;

		try {
			con = DatabaseConn.getInstance();
			PreparedStatement pstmt = con.getPreparedStatement(
					"insert into posts(post_title, post_heading, post_body, post_thumbnail, post_datetime, post_categoryid, post_userid, post_isfeatured) values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, title);
			pstmt.setString(2, heading);
			pstmt.setString(3, body);
			pstmt.setString(4, file);
			pstmt.setDate(5, date);
			pstmt.setInt(6, Integer.parseInt(category));
			pstmt.setInt(7, Integer.parseInt(userId));
			if(is_featured==null) {
				pstmt.setInt(8, 0);	
			}
			else {
				pstmt.setInt(8, 1);
			}
			pstmt.executeUpdate();
			
			for (Part part : request.getParts()) {
				part.write(path);
			}
			
			response.sendRedirect(request.getContextPath()+"/add-post.jsp?class=sucess");
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

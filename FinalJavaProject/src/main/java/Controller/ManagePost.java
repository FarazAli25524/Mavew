package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DatabaseConn;


@WebServlet("/ManagePost")
public class ManagePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    int userId = (Integer) session.getAttribute("userId");
		DatabaseConn con; 
		try {
			con = DatabaseConn.getInstance();
			PreparedStatement pstmt = con.getPreparedStatement("select * from posts where user_id=?");
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();
			
			while(!rs.next()) {
				System.out.println("Post-title: " + rs.getString("post_title"));
			}
			session.setAttribute("resultSet", rs);
			response.sendRedirect(request.getContextPath()+"/dashboard.jsp");	
		}
	    catch(Exception e) {
	    	e.printStackTrace();
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

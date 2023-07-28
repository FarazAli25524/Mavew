package Database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseConn {
	private static DatabaseConn connect;
	private Connection connection;
	private final String url = "jdbc:mysql://localhost:3308/mavew";
	private final String user = "root";
	private final String password = "root";
	
	private  DatabaseConn() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("Got Connection!");
		}
		catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static DatabaseConn getInstance() throws SQLException{
		return (connect == null) ? (connect = new DatabaseConn()) : connect;
	} 
	
	public PreparedStatement getPreparedStatement(String query) {
		PreparedStatement pstmt = null;
		try {
			pstmt = connection.prepareStatement(query);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
	public void close() throws SQLException{
		connection.close();
	}
}

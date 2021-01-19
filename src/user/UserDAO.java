package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public UserDAO() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/ajax";
			String dbID = "jinwoo";
			String dbPassword = "wlsdn123";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<User> search(String userName){
		
		String sql = "select * from user where userName like ?";
		ArrayList<User> userList = new ArrayList<User>();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + userName + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				User user = new User();
				user.setUserName(rs.getString(1));
				user.setUserAge(rs.getInt(2));
				user.setUserGender(rs.getString(3));
				user.setUserEmail(rs.getString(4));
				userList.add(user);
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		} return userList;
	} 
	
	public int register(User user) {
		String sql = "insert into user values (?, ?, ?, ?)";
		
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setInt(2, user.getUserAge());
			pstmt.setString(3, user.getUserGender());
			pstmt.setString(4, user.getUserEmail());
			
			return pstmt.executeUpdate(); // 1 반환
			
		} catch(Exception e) {
			e.printStackTrace();
		} return -1; // 데이터베이스 오류
	}

}

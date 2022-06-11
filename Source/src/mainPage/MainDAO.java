package mainPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MainDAO {
	private Connection conn;
	
	public MainDAO(Connection conn) {
		this.conn = conn; // 의존성주입
	}
	
	public String searchUserName(int num) {
		
		String userName = "";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select guestName from guest where guestNum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userName = rs.getString("guestName");
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		System.out.println("dao result: " + userName);
		return userName;
		
	}
	
}

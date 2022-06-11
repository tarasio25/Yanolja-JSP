package myPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class myPageDAO {
	

	private Connection conn;
	
	public myPageDAO(Connection conn) {
		this.conn = conn;
	}
	
	public String searchInfo(int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		myPageDTO dto = null;
		String resultPwd="";
		
		try {
			sql = "select guestPwd from guest where guestNum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultPwd = rs.getString("guestPwd");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return resultPwd;
		
	}

}

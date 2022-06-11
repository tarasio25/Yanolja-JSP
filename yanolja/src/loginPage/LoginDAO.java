package loginPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	private Connection conn;
	
	public LoginDAO(Connection conn) {
		this.conn = conn;
	}
	
	public LoginDTO searchInfo(String id, String pwd) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		LoginDTO dto = null;
		try {
			sql = "select guestNum, guestName, guestID, guestPwd, guestGender, guestBirth, guestTel, guestEmail "
					+ "from guest where guestID=? and guestPwd=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new LoginDTO();
				
				dto.setGuestNum(rs.getInt("guestNum"));
				dto.setGuestName(rs.getString("guestName"));
				dto.setGuestID(rs.getString("guestID"));
				dto.setGuestPwd(rs.getString("guestPwd"));
				dto.setGuestGender(rs.getString("guestGender"));
				dto.setGuestBirth(rs.getString("guestBirth"));
				dto.setGuestTel(rs.getString("guestTel"));
				dto.setGuestEmail(rs.getString("guestEmail"));
				
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}
	
}

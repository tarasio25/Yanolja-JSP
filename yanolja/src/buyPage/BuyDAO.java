package buyPage;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import basketPage.BasketDTO;
import guestPage.GuestDTO;
import util.DBConn;

public class BuyDAO {

	private Connection conn;
		
	
	public BuyDAO(Connection conn) {
		this.conn = conn;
	}
	
	public List<BuyDTO> getList(int guestnum) { 
		
		List<BuyDTO> lists = new ArrayList<BuyDTO>(); 
		
		BuyDTO dto = null; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		String sql; 
		
		try {
			sql = "select * from buy where guestnum = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, guestnum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new BuyDTO();
				dto.setBuynum(rs.getInt("buynum"));
				dto.setBuycase(rs.getString("buycase"));
				dto.setRoomnum(rs.getInt("roomnum"));
				dto.setBuildingnum(rs.getInt("buildingnum"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setTotalprice(rs.getInt("totalprice"));
				lists.add(dto);
				System.out.println("!!!");
			}
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return lists;
	}
}

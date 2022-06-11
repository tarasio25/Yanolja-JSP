package roomRsvPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import guestPage.GuestDTO;

public class RoomRsvDAO {

	private Connection conn;

	public RoomRsvDAO(Connection conn) {
		this.conn = conn;
	}
	
	// 최대값 Num
	public int getMaxNum() {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql = "select nvl(count(*),0) from buy";	
			// sql 연결 
			pstmt = conn.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1); // 첫번째 나온 컬럼값 받는다
			}		
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum; // num의 최대값구하는 메소드 
	}
	
	// roomPrice select
	public int getPrice(int num) {
		
		int price = 0;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql = "select roomPrice from room where roomNum=?";	
			// sql 연결 
			pstmt = conn.prepareStatement(sql);	
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				price = rs.getInt(1); // 첫번째 나온 컬럼값 받는다
			}		
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return price;
	}
	
	// insert data
	public int insert(RoomRsvDTO dto) {
		int result = 0;
		String sql;
		PreparedStatement pstmt = null;
		try {
			// 사진 4번 
			sql = "insert into buy (buyNum, buyCase, guestNum, roomNum, buildingNum, startdate, enddate, totalprice) ";
			sql += "values(?,?,?,?,?,?,?,?)";
		
			// 문법적으로 db 틀렸나 
			pstmt = conn.prepareStatement(sql);
			// 각각의 물음표에 넣음 	
			
			pstmt.setInt(1, dto.getBuyNum());
			pstmt.setString(2, dto.getBuyCase());
			pstmt.setInt(3, dto.getGuestNum());
			pstmt.setInt(4, dto.getRoomNum());
			pstmt.setInt(5, dto.getBuildingNum());
			pstmt.setString(6, dto.getStartDate());
			pstmt.setString(7, dto.getEndDate());
			pstmt.setInt(8, dto.getTotalPrice());
					
			// 완벽한 insert문을 실행 
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}

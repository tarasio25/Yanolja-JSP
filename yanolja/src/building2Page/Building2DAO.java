package building2Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Building2DAO {

	private Connection conn;
	
	public Building2DAO(Connection conn) {
		this.conn = conn;
	}
	
	// [종류:호텔 > 지역:서울] 의 전체 숙박 정보
	public List<Building2DTO> getBuildingLists(int kindValue, String locValue, String locDetailValue) {

		List<Building2DTO> lists = new ArrayList<Building2DTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			
			locValue = "'%" + locValue + "%'"; 
			locDetailValue = "'%" + locDetailValue + "%'";
			System.out.println(kindValue);
			System.out.println(locValue);
			System.out.println(locDetailValue);
			
			sql = "select buildingNum, buildingName, buildingLoc, buildingDesc, ";
			sql += "buildingKW, buildingKind, buildingStar, buildingCI, buildingCO ";
			sql += "from building ";
			sql += "where buildingKind = ? and ";
			sql += "buildingLoc like " + locDetailValue;
   
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, kindValue);
		
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				Building2DTO dto = new Building2DTO();
				
				dto.setBuildingNum(rs.getInt("buildingNum"));
				dto.setBuildingName(rs.getString("buildingName"));
				dto.setBuildingLoc(rs.getString("buildingLoc"));
				dto.setBuildingLoc(rs.getString("buildingDesc"));
				dto.setBuildingKW(rs.getString("buildingKW"));
				dto.setBuildingKind(rs.getInt("buildingKind"));
				dto.setBuildingStar(rs.getInt("buildingStar"));
				dto.setBuildingCI(rs.getString("buildingCI"));
				dto.setBuildingCO(rs.getString("buildingCO"));
			
				lists.add(dto);
				}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;
	}
	
	// 해당 buildingNum 의 minPrice 가져오기
	public int getRoomLists(int num) {

		List<Building2DTO> lists = new ArrayList<Building2DTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		int result = 0;

		try {

			sql = "select min(roomPrice) from room where buildingNum = ? ";
   
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}
	
}

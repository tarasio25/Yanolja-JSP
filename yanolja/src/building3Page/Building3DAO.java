package building3Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Building3DAO {

	private Connection conn;
	
	public Building3DAO(Connection conn) {
		this.conn = conn;
	}
	

	// 후기 데이터 개수 구하기
	public int getMaxNum() {

		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select nvl(max(reviewNum),0) from review";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return maxNum;
	}

	// buildingName가져오기
	public String searchBuilding(int buildingNum) {
		
		Building3DTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		String result = "";
		try {

			sql = "select buildingName from building ";
			sql += "where buildingNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, buildingNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getString("buildingName");

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	// guestID가져오기

	public String searchGuest(int guestNum) {
		Building3DTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		String result = "";
		try {

			sql = "select guestId from guest ";
			sql += "where guestNum=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, guestNum);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getString("guestId");

			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	// 방 리스트 가져오기
	public List<Building3DTO> getLists(int buildingNum) {

		
		List<Building3DTO> lists = new ArrayList<Building3DTO>();
				
		Building3DTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select roomNum, roomName, roomPrice, roomPeople, roomOption, buildingNum from room "
					+ "where buildingNum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buildingNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new Building3DTO();

				dto.setRoomNum(rs.getInt("roomNum"));
				dto.setRoomName(rs.getString("roomName"));
				dto.setRoomPrice(rs.getInt("roomPrice"));
				dto.setRoomPeople(rs.getInt("roomPeople"));
				dto.setRoomOption(rs.getString("roomOption"));
				dto.setBuildingNum(rs.getInt("buildingNum"));
			
				lists.add(dto);
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lists;

	}
	
	
	// 방 데이터 가져오기
	public Building3DTO getRoomData(int roomNum) {
				
		Building3DTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select roomNum, roomName, roomPrice, roomPeople, roomOption from room "
					+ "where roomNum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				dto = new Building3DTO();

				dto.setRoomNum(rs.getInt("roomNum"));
				dto.setRoomName(rs.getString("roomName"));
				dto.setRoomPrice(rs.getInt("roomPrice"));
				dto.setRoomPeople(rs.getInt("roomPeople"));
				dto.setRoomOption(rs.getString("roomOption"));
			
			}

			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;

	}

	// 전체데이터
	public Building3DTO getBuildingData(int buildingNum) {

		PreparedStatement bpstmt = null;

		ResultSet brs = null;

		String bsql;

		Building3DTO dto = new Building3DTO();

		try {

			bsql = "select buildingNum, buildingName, buildingLoc, buildingDesc, ";
			bsql += "buildingKW, buildingKind, buildingStar, buildingCI, buildingCO ";
			bsql += "from building where buildingNum = ?";

			bpstmt = conn.prepareStatement(bsql);
			bpstmt.setInt(1, buildingNum);
			
			brs = bpstmt.executeQuery();

			if (brs.next()) {

				dto.setBuildingNum(brs.getInt("buildingNum"));
				dto.setBuildingName(brs.getString("buildingName"));
				dto.setBuildingLoc(brs.getString("buildingLoc"));
				dto.setBuildingDesc(brs.getString("buildingDesc"));
				dto.setBuildingKW(brs.getString("buildingKW"));
				dto.setBuildingKind(brs.getInt("buildingKind"));
				dto.setBuildingStar(brs.getInt("buildingStar"));
				dto.setBuildingCI(brs.getString("buildingCI"));
				dto.setBuildingCO(brs.getString("buildingCO"));

			}
			brs.close();

			bpstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}
	
}

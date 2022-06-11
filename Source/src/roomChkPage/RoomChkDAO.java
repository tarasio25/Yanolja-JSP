package roomChkPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import building2Page.Building2DTO;

public class RoomChkDAO {

	private Connection conn;

	public RoomChkDAO(Connection conn) {
		this.conn = conn;
	}

	public RoomChkDTO getRoomLists(int num) {

		RoomChkDTO dto = new RoomChkDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "select roomName, roomPrice, roomPeople, buildingNum from room where roomNum = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setRoomName(rs.getString("roomName"));
				dto.setRoomPrice(rs.getInt("roomPrice"));
				dto.setRoomPeople(rs.getInt("roomPeople"));
				dto.setBuildingNum(rs.getInt("buildingNum"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}

	
	public RoomChkDTO getBuildingLists(int num) {

		RoomChkDTO dto = new RoomChkDTO();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select buildingCI, buildingCO from building where buildingNum = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setBuildingCI(rs.getString("buildingCI"));
				dto.setBuildingCO(rs.getString("buildingCO"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return dto;
	}
	
	public int insertBuy(RoomChkDTO dto) {

		int result = 0;

		PreparedStatement pstmt = null;
		String sql;

		try {

			sql = "insert into buy (buyNum, guestNum, buildingNum, roomNum) ";
			sql += "values (?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getBuyNum());
			pstmt.setInt(2, dto.getGuestNum());
			pstmt.setInt(3, dto.getBuildingNum());
			pstmt.setInt(4, dto.getRoomNum());

			result = pstmt.executeUpdate();

			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	

}

package guestPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBConn;

public class GuestDAO {
	
	Connection conn = null;
	
	public GuestDAO(Connection conn) {
		this.conn = conn;
	}
	
// ���� ȸ�������� �ҷ����� �޼ҵ常 �ϴ� ����
	
	// ȸ�� ���� ��ȣ 
	public int getMaxNum() {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql = "select nvl(max(guestNum),0) from guest";	
			// sql ���� 
			pstmt = conn.prepareStatement(sql);	
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1); // ù��° ���� �÷��� �޴´�
			}		
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum; // num�� �ִ밪���ϴ� �޼ҵ� 
	}
	
	// �̸� ������� -> 
	public GuestDTO getSearchData(String guestName,String guestBirth) {
		GuestDTO dto = null;
		String sql;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// ���� ���̵�� select
			sql ="select guestNum,guestId,guestPwd,guestName,guestGender,guestBirth,";
			sql += "guestTel,guestEmail from guest where guestName=? and guestBirth=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, guestName);
			pstmt.setString(2, guestBirth);
			
			rs = pstmt.executeQuery();
		
			// Ű���� �����Ͱ� ������	
			if(rs.next()) {
				dto = new GuestDTO();
				dto.setGuestNum(rs.getInt("guestNum"));
				dto.setGuestId(rs.getString("guestId"));
				dto.setGuestPwd(rs.getString("guestPwd"));
				dto.setGuestName(rs.getString("guestName"));
				dto.setGuestGender(rs.getString("guestGender"));
				dto.setGuestBirth(rs.getString("guestBirth"));
				dto.setGuestTel(rs.getString("guestTel"));
				dto.setGuestEmail(rs.getString("guestEmail"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		return dto;
	}
	
	public GuestDTO getReadData(int guestNum) {
		GuestDTO dto = null;
		String sql;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// ���� ���̵�� select
			sql ="select guestNum, guestId, guestPwd, guestName, guestBirth, guestTel, guestEmail, guestGender from guest where guestNum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, guestNum);
			
			rs = pstmt.executeQuery();
		
			// Ű���� �����Ͱ� ������	
			if(rs.next()) {
				dto = new GuestDTO();
				
				dto.setGuestNum(rs.getInt("guestNum"));
				dto.setGuestId(rs.getString("guestId"));
				dto.setGuestPwd(rs.getString("guestPwd"));
				dto.setGuestName(rs.getString("guestName"));
				dto.setGuestBirth(rs.getString("guestBirth"));
				dto.setGuestTel(rs.getString("guestTel"));
				dto.setGuestEmail(rs.getString("guestEmail"));
				dto.setGuestGender(rs.getString("guestGender"));
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		return dto;
	}
	
	// ��ȸ
	public GuestDTO getLists(GuestDTO dto) {
		ArrayList<GuestDTO> lists = new ArrayList<GuestDTO>();
		String sql;
		conn = DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			sql = "select * from guest where guestNum = ? ";
			pstmt.setInt(1,dto.getGuestNum());
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setGuestNum(rs.getInt("guestNum"));
				dto.setGuestId(rs.getString("guestId"));
				dto.setGuestPwd(rs.getString("guestPwd"));
				dto.setGuestName(rs.getString("guestName"));
				dto.setGuestEmail(rs.getString("guestEmail"));
				dto.setGuestTel(rs.getString("guestTel"));
				dto.setGuestGender(rs.getString("guestGender"));
				dto.setGuestBirth(rs.getString("guestBirth"));
				dto.setGuestNum(rs.getInt("guestNum"));
			}	
			lists.add(dto);
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}	
	
	// ����
	public int insert(GuestDTO dto) {
		int result = 0;
		String sql;
		PreparedStatement pstmt = null;
		try {
			// ���� 4�� 
			sql = "insert into guest (guestNum,guestId,guestPwd,";
			sql += "guestName,guestGender,guestBirth,guestTel,guestEmail) values(?,?,?,?,?,?,?,?)";
		
			// ���������� db Ʋ�ȳ� 
			pstmt = conn.prepareStatement(sql);
			// ������ ����ǥ�� ���� 	
			
			pstmt.setInt(1, dto.getGuestNum());
			pstmt.setString(2, dto.getGuestId());
			pstmt.setString(3, dto.getGuestPwd());
			pstmt.setString(4, dto.getGuestName());
			pstmt.setString(5, dto.getGuestGender());
			pstmt.setString(6, dto.getGuestBirth());
			pstmt.setString(7, dto.getGuestTel());
			pstmt.setString(8, dto.getGuestEmail());
					
			// �Ϻ��� insert���� ���� 
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	// ��й�ȣ+��ȭ��ȣ ����
	public int updateData(int num, String updatedPwd, String updatedTel) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "update guest set guestPwd=?,guestTel=?";
			sql += " where guestnum=?";
	
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,  updatedPwd);
			pstmt.setString(2,  updatedTel);
			pstmt.setInt(3, num);
			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	// ����
	public int deleteData(int num) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "delete guest where guestNum=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}	
		
		return result;
	}
}

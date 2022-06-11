package reviewPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import reviewPage.ReviewDTO;

public class ReviewDAO {
	
	private Connection conn;
	
	public ReviewDAO(Connection conn) {
		this.conn = conn;
	}
	
	//buildingName��������
		public String searchBuilding(int buildingNum) {
			ReviewDTO dto = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			String result = "";
			try {
				
				sql = "select buildingName from building ";
				sql+= "where buildingNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, buildingNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getString("buildingName");
				
				}
				rs.close();
				pstmt.close();
					
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
		}
		
		//guestID��������
		
		public String searchGuest(int guestNum) {
			ReviewDTO dto = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			String result = "";
			try {
				
				sql = "select guestId from guest ";
				sql+= "where guestNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, guestNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getString("guestId");
				
				}
				rs.close();
				pstmt.close();
					
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return result;
		}
		
		// ���䵥����
		public List<ReviewDTO> getList() {

			List<ReviewDTO> list = new ArrayList<ReviewDTO>();
			PreparedStatement bpstmt = null;
			ResultSet brs = null;
			String bsql;

		
			try {
				
				bsql = "select guestNum, buildingNum, reviewCreated, reviewStar, reviewComment ";
				bsql += "from review";
			

				bpstmt = conn.prepareStatement(bsql);
				brs = bpstmt.executeQuery();

				while (brs.next()) {

					ReviewDTO dto = new ReviewDTO();
				
					dto.setGuestNum(brs.getInt("guestNum"));
					dto.setBuildingNum(brs.getInt("buildingNum"));
					dto.setReviewCreated(brs.getString("reviewCreated"));
					dto.setReviewStar(brs.getInt("reviewStar"));
					dto.setReviewComment(brs.getString("reviewComment"));

					
					
					list.add(dto);
				}
				brs.close();
				bpstmt.close();

			} catch (Exception e) {
				System.out.println(e.toString());
			}

			return list;
		}
		
		//�ı� �� ����
	public int getMaxNum() {
			
			int maxNum = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select nvl(max(reviewNum),0) from review";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					maxNum = rs.getInt(1); //�÷��� �ϳ� ���Դµ� �װ� �Ļ��÷��̸� �÷��� ���Ұ�.. �׳� 1 �ᵵ ��
				}
				
				rs.close();
				pstmt.close();
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return maxNum;
		}
		
		
		
}

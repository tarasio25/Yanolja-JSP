package basketPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

// dao 
public class BasketDAO {
	
	Connection conn = null;
	
	public BasketDAO(Connection conn) {
		this.conn = conn;
	}
	
	public int getMaxNum() {
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select nvl(max(basketNum), 0) from basket";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return maxNum;
	}
	
	// 장바구니의 한 데이터 불러오기(basketNum)
	public BasketDTO getCartList(int basketnum) {
		BasketDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from basket where basketNum = ? ";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basketnum);
			rs = pstmt.executeQuery();
			int cnt = 0;
			if(rs.next()) {
				
				dto = new BasketDTO();
				
				dto.setGuestNum(rs.getInt("guestnum"));
				dto.setRoomNum(rs.getInt("roomnum"));
				dto.setBuildingNum(rs.getInt("buildingnum"));
				dto.setRoomStartDate(rs.getString("startdate"));
				dto.setRoomEndDate(rs.getString("enddate"));
				dto.setGuestNum(rs.getInt("totalprice"));
				
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	//장바구니 총액 
	 /*public int getTotalItemPrice(int basketnum, int diffDate){ 		 
	 	int maxNum = 0; 
 		PreparedStatement pstmt =null; 
		ResultSet rs = null; 
		String sql; 	 
	 		try { 
				sql = "select 최종값 from basket where basketnum = ?"; 
				pstmt = conn.prepareStatement(sql); 
	 			pstmt.setInt(1, basketnum); 
				rs = pstmt.executeQuery(); 
				 
				if(rs.next()){ 
	 				rP = rs.getInt(1); 
				} 
				rs.close(); 
	 			pstmt.close(); 
			} catch (Exception e) { 
	 			System.out.println(e.toString()); 
	 		} 
	 		return rP*diffDate; 
	 	} */
	 
	 	//장바구니 총상품개수(동일상품) 
	 	public int getCartItemCount(int guestnum){ 
	 
			int maxNum = 0; 
			PreparedStatement pstmt =null; 
			ResultSet rs = null; 
			String sql; 
			 
	 		try { 
			sql = "select count(*) from basket where guestnum = ?"; 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, guestnum);
	 		rs = pstmt.executeQuery(); 
			 
			if(rs.next()){ 
				maxNum = rs.getInt(1); 
			} 
			rs.close(); 
			pstmt.close(); 
			 
	 		} catch (Exception e) { 
	 			System.out.println(e.toString()); 
			} 
			return maxNum; 
		} 
	 	
	 	/*//장바구니 총상품개수(사용자별) 
		public int getTotalItemCountYes(int guestnum){ 
	  
	 	int maxNum = 0; 
	 	PreparedStatement pstmt =null; 
	    ResultSet rs = null; 
	 	String sql; 
	 	
	 	try { 
	 	sql = "select sum(amount) from cart where guestnum = ?"; 
	 		pstmt = conn.prepareStatement(sql); 
	 		pstmt.setInt(1, guestnum); 
	 		rs = pstmt.executeQuery(); 
	 	if(rs.next()){ 
	 		maxNum = rs.getInt(1); 
	 	} 
	 	rs.close(); 
	 	pstmt.close(); 
	
	 	} catch (Exception e) { 
	 		System.out.println(e.toString()); 
	 	} 
	 		return maxNum;  	
		} */
	 	
		//장바구니 상품추가 
		public void insertCartItem(BasketDTO dto) { 
		
		PreparedStatement pstmt = null; 
		String sql; 
		 
		try { 
			sql = "insert into basket (basketNum, guestNum, roomNum, buildingNum, StartDate,EndDate,totalprice) "; 
			sql += "values (?,?,?,?,?,?,?)"; 
		    
			pstmt = conn.prepareStatement(sql); 
			
			pstmt.setInt(1, dto.getBasketNum()); 
		    pstmt.setInt(2, dto.getGuestNum()); 
			pstmt.setInt(3, dto.getRoomNum()); 
			pstmt.setInt(4, dto.getBuildingNum()); 
			pstmt.setString(5, dto.getRoomStartDate()); 
			pstmt.setString(6, dto.getRoomEndDate()); 
			pstmt.setLong(7, dto.getTotalPrice()); 
			
			
			pstmt.executeUpdate(); 
			
			pstmt.close(); 

		} catch (Exception e) { 
			System.out.println(e.toString()); 
			} 
		} 

		//장바구니 조회 - 
		public List<BasketDTO> getReadData(int guestnum) { 
		
			List<BasketDTO> lists = new ArrayList<BasketDTO>(); 
			BasketDTO dto = null; 
			PreparedStatement pstmt = null; 
			ResultSet rs = null; 
			String sql; 
			try { 
	
				sql = "select basketNum, guestNum, buildingNum, roomNum, StartDate, EndDate, totalprice from basket where guestNum=?";
			
				pstmt = conn.prepareStatement(sql); 
				pstmt.setInt(1, guestnum); 
				
				rs = pstmt.executeQuery(); 
	 			
				while (rs.next()) { 		
		 			dto = new BasketDTO(); 
					
		 			dto.setBasketNum(rs.getInt("basketNum"));
		 			dto.setGuestNum(rs.getInt("guestNum"));
		 			dto.setBuildingNum(rs.getInt("buildingNum"));
		 			dto.setRoomNum(rs.getInt("roomNum"));
		 			dto.setRoomStartDate(rs.getString("StartDate"));
		 			dto.setRoomEndDate(rs.getString("EndDate"));
		 			dto.setTotalPrice(rs.getInt("totalprice"));

		 			lists.add(dto);
				} 
					rs.close(); 
					pstmt.close(); 
				} catch (Exception e) { 
		 		System.out.println(e.toString()); 
			} 
		 	return lists; 
	 	} 

	//장바구니 아이템 삭제 
	public int deleteCartItem(int basketnum) { 
		//단일상품옵션삭제시 productId 
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql; 
		try { 
			sql= "delete basket where basketnum=?"; 
				pstmt = conn.prepareStatement(sql); 
				pstmt.setInt(1, basketnum); 
				result = pstmt.executeUpdate(); 
				pstmt.close(); 
				 
			} catch (Exception e) { 
				System.out.println(e.toString()); 
			} 
			return result; 
	} 
	/*
	//주문완료 후 장바구니 아이템 삭제 
	public int deleteCartItem(int guestnum) { 
			 
		//주문완료시 userId 
		int result = 0; 
		PreparedStatement pstmt = null; 
		String sql; 

		try { 
			sql= "delete basket where guestnum = ?"; 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setInt(1, guestnum); 
			result = pstmt.executeUpdate(); 
			pstmt.close(); 
		} catch (Exception e) { 
			System.out.println(e.toString()); 
	 	} 
	 	return result; 
	} */
	
	
	//주문진행 orderSelect = 'yes'
	
	// 바스켓안에 내용이 있나 
	/*public void changeOrderSelectYes(int buildingnum, int guestgnum){
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				sql = "update basket set orderSelect='yes' where buildingnum=? and guestgnum=?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, buildingnum);
				pstmt.setInt(2, guestgnum);
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		
		//주문하지않음 orderSelect = 'no'
		public void changeOrderSelectNo(int buildingnum, int guestgnum){
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql = "update basket set orderSelect='no' where buildingnum=? and guestgnum=?"; 
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, buildingnum);
				pstmt.setInt(2, guestgnum);
				result = pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}*/
		
//		//장바구니 총상품개수(사용자별)
//		public int getTotalItemCountYes(int guestnum){
//		
//			int maxNum = 0;
//			PreparedStatement pstmt =null;
//			ResultSet rs = null;
//			String sql;
//			
//			try {
//				sql = "select sum(amount) from basket where guestnum = ? and orderSelect='yes'" ;
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, guestnum);
//				rs = pstmt.executeQuery();
//				
//				if(rs.next()){
//					maxNum = rs.getInt(1);
//				}
//				rs.close();
//				pstmt.close();
//			} catch (Exception e) {
//				System.out.println(e.toString());
//			}
//			return maxNum;
//		}
		//장바구니 총상품개수(사용자별)
		public int getTotalItemCount(int guestnum){
			
			int maxNum = 0;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			String sql;
			
			try {
				sql = "select count(*) from basket where guestnum = ? " ;
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, guestnum);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					maxNum = rs.getInt(1);
				}
				rs.close();
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			return maxNum;
		}
	}

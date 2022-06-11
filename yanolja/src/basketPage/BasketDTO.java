package basketPage;

public class BasketDTO {
	
	private int basketNum;
	private int guestNum;
	private int roomNum;
	private int buildingNum;
	private String roomStartDate;
	private String roomEndDate;
	private long totalPrice;
	
	public int getBasketNum() {
		return basketNum;
	}
	public void setBasketNum(int basketNum) {
		this.basketNum = basketNum;
	}
	public int getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(int guestNum) {
		this.guestNum = guestNum;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public int getBuildingNum() {
		return buildingNum;
	}
	public void setBuildingNum(int buildingNum) {
		this.buildingNum = buildingNum;
	}
	public String getRoomStartDate() {
		return roomStartDate;
	}
	public void setRoomStartDate(String roomStartDate) {
		this.roomStartDate = roomStartDate;
	}
	public String getRoomEndDate() {
		return roomEndDate;
	}
	public void setRoomEndDate(String roomEndDate) {
		this.roomEndDate = roomEndDate;
	}
	public long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@Override
	public String toString() {
		return "BasketDTO [basketNum=" + basketNum + ", guestNum=" + guestNum + ", roomNum=" + roomNum
				+ ", buildingNum=" + buildingNum + ", roomStartDate=" + roomStartDate + ", roomEndDate=" + roomEndDate
				+ ", totalPrice=" + totalPrice + "]";
	}
}

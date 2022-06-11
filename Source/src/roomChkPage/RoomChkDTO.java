package roomChkPage;

public class RoomChkDTO {

	private int roomNum;
	private String roomName;
	private int roomPrice;
	private int roomPeople;
	
	private int buildingNum;
	private String buildingCI;
	private String buildingCO;
	
	private int guestNum;
	
	private int buyNum;
	
	private int basketNum;
	
	public int getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(int guestNum) {
		this.guestNum = guestNum;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public int getBasketNum() {
		return basketNum;
	}
	public void setBasketNum(int basketNum) {
		this.basketNum = basketNum;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	public int getBuildingNum() {
		return buildingNum;
	}
	public void setBuildingNum(int buildingNum) {
		this.buildingNum = buildingNum;
	}
	public String getBuildingCI() {
		return buildingCI;
	}
	public void setBuildingCI(String buildingCI) {
		this.buildingCI = buildingCI;
	}
	public String getBuildingCO() {
		return buildingCO;
	}
	public void setBuildingCO(String buildingCO) {
		this.buildingCO = buildingCO;
	}
	public int getRoomPeople() {
		return roomPeople;
	}
	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}
	
}

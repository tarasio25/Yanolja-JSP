package buyPage;



public class BuyDTO {
	
	private int buynum;
	private String buycase;
	private int guestnum;
	private int roomnum;
	private int buildingnum;
	private String startdate;
	private String enddate;
	private int totalprice;
	
	
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
	public String getBuycase() {
		return buycase;
	}
	public void setBuycase(String buycase) {
		this.buycase = buycase;
	}
	public int getGuestnum() {
		return guestnum;
	}
	public void setGuestnum(int guestnum) {
		this.guestnum = guestnum;
	}
	public int getRoomnum() {
		return roomnum;
	}
	public void setRoomnum(int roomnum) {
		this.roomnum = roomnum;
	}
	public int getBuildingnum() {
		return buildingnum;
	}
	public void setBuildingnum(int buildingnum) {
		this.buildingnum = buildingnum;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}	
}

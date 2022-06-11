package reviewPage;


public class ReviewDTO {
	private int reviewNum;
	private String reviewCreated;
	private String reviewComment;
	private int reviewStar;

	private int guestNum;
	private String guestId;
	
	private int buildingNum;
	private String buildingName;
	
	
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewCreated() {
		return reviewCreated;
	}
	public void setReviewCreated(String reviewCreated) {
		this.reviewCreated = reviewCreated;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public int getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(int guestNum) {
		this.guestNum = guestNum;
	}
	public String getGuestId() {
		return guestId;
	}
	public void setGuestId(String guestId) {
		this.guestId = guestId;
	}
	public int getBuildingNum() {
		return buildingNum;
	}
	public void setBuildingNum(int buildingNum) {
		this.buildingNum = buildingNum;
	}
	public String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}
	
	
}

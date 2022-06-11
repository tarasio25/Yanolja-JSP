package building1Page;

import java.util.ArrayList;
import java.util.List;

public class BuildingDTO {
	private List<String> locLists = new ArrayList<>();
	

	public List<String> getLocLists() {
		return locLists;
	}

	public void setLocLists(String loc) {
		switch(loc) {
		
		case "서울":
			locLists.add("강남");
			locLists.add("역삼");
			locLists.add("서초");
			locLists.add("신사");
			locLists.add("잠실");
			locLists.add("신천");
			locLists.add("영등포");
			locLists.add("여의도");
			break;
		
		case "경기":
			locLists.add("인계");
			locLists.add("영통");
			locLists.add("권선");
			locLists.add("수원역");
			locLists.add("안양");
			locLists.add("평촌");
			locLists.add("인덕원");
			locLists.add("과천");
			break;
		
		case "부산":
			locLists.add("해운대");
			locLists.add("센텀시티");
			locLists.add("재송");
			locLists.add("송정");
			locLists.add("광안리");
			locLists.add("수영");
			locLists.add("서면");
			locLists.add("양정");
			break;
		
		case "제주":
			locLists.add("제주시");
			locLists.add("제주공항");
			locLists.add("서귀포시");
		
		}
			
	}

	
}

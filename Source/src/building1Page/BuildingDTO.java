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
		
		case "����":
			locLists.add("����");
			locLists.add("����");
			locLists.add("����");
			locLists.add("�Ż�");
			locLists.add("���");
			locLists.add("��õ");
			locLists.add("������");
			locLists.add("���ǵ�");
			break;
		
		case "���":
			locLists.add("�ΰ�");
			locLists.add("����");
			locLists.add("�Ǽ�");
			locLists.add("������");
			locLists.add("�Ⱦ�");
			locLists.add("����");
			locLists.add("�δ���");
			locLists.add("��õ");
			break;
		
		case "�λ�":
			locLists.add("�ؿ��");
			locLists.add("���ҽ�Ƽ");
			locLists.add("���");
			locLists.add("����");
			locLists.add("���ȸ�");
			locLists.add("����");
			locLists.add("����");
			locLists.add("����");
			break;
		
		case "����":
			locLists.add("���ֽ�");
			locLists.add("���ְ���");
			locLists.add("��������");
		
		}
			
	}

	
}

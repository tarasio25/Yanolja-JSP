package servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basketPage.BasketDAO;
import basketPage.BasketDTO;
import building1Page.BuildingDTO;
import building2Page.Building2DAO;
import building2Page.Building2DTO;
import building3Page.Building3DAO;
import building3Page.Building3DTO;
import guestPage.GuestDAO;
import guestPage.GuestDTO;
import loginPage.LoginDAO;
import loginPage.LoginDTO;
import mainPage.MainDAO;
import mainPage.MainDTO;
import reviewPage.ReviewDAO;
import reviewPage.ReviewDTO;
import roomChkPage.RoomChkDAO;
import roomChkPage.RoomChkDTO;
import roomRsvPage.RoomRsvDAO;
import roomRsvPage.RoomRsvDTO;
import util.DBConn;
import util.MyUtil;

public class YanoljaServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);

		rd.forward(req, resp);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");

		Connection conn = DBConn.getConnection();

		MyUtil myUtil = new MyUtil();

		String cp = req.getContextPath(); // -> /yanolja
		String uri = req.getRequestURI(); // -> /yanolja/project/main.yanolja
		HttpSession session = req.getSession();
		String url;

		if(uri.indexOf("main.do") != -1) {
			MainDAO dao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";
			
			System.out.println("session: "+session.getAttribute("guestNum"));

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = dao.searchUserName(userNum);

			}
			
			
			req.setAttribute("userNum", userNum);
			req.setAttribute("userName", userName);
			url = "/mainPage/mainPage.jsp";
			forward(req, resp, url);
		}

		else if(uri.indexOf("login.do")!= -1){
			url = "/loginPage/loginPage.jsp";
			forward(req, resp, url);
		}

		else if(uri.indexOf("login_ok.do") != -1) {
			
			String id, pwd;
			LoginDTO dto = null;
			LoginDAO dao = new LoginDAO(conn);
			int flag = 0;
			
			id = req.getParameter("guestId");
			pwd = req.getParameter("guestPwd");

			dto = dao.searchInfo(id, pwd);


			if(dto == null) { // 해당 정보가 없는경우 loginPage 유지
				url = "/project/login.do";
				flag = 1;
				req.setAttribute("flag", flag);
				forward(req, resp, url);

			}
			else { // 정보가 있는경우 mainPage로 이동
				url = "/project/main.do";
				session.setAttribute("guestNum", dto.getGuestNum());
				forward(req, resp, url);
			}

		}

		else if(uri.indexOf("logout.do")!= -1){
			session.removeAttribute("userNum");
			session.invalidate();
			url= "/project/main.do";
			forward(req, resp, url);
		}

		
		// 회원가입 
		else if(uri.indexOf("created.do")!=-1) {
			url = "/joinPage/join.jsp";
			// 포워딩은 실제주소로 찾아가게 한다.
			forward(req, resp, url);	

		} 
		
		else if (uri.indexOf("basketlist.do") != -1) {
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";
			
			System.out.println("session: "+session.getAttribute("guestNum"));

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);

			}
			
			BasketDAO BSdao = new BasketDAO(conn);
			BasketDTO BSdto = new BasketDTO();
			Building3DAO B3dao = new Building3DAO(conn);
			Building3DTO buildingInfo = null;
			Building3DTO roomInfo = null;
			
			List<BasketDTO> BSlists = BSdao.getReadData(userNum);
			List<Building3DTO> BuildingLists = new ArrayList<>();
			List<Building3DTO> RoomLists = new ArrayList<>();
			
			for(int i = 0; i<BSlists.size(); i++) {
				
				buildingInfo = new Building3DTO();
				roomInfo = new Building3DTO();
				
				buildingInfo = B3dao.getBuildingData(BSlists.get(i).getBuildingNum());
				roomInfo = B3dao.getRoomData(BSlists.get(i).getRoomNum());
				
				BuildingLists.add(buildingInfo);
				RoomLists.add(roomInfo);
				
			}
			
			req.setAttribute("userNum", userNum);
			req.setAttribute("userName", userName);
			
			req.setAttribute("bslists", BSlists);
			req.setAttribute("blists", BuildingLists);
			req.setAttribute("rlists", RoomLists);
			
			
			url = "/basketPage/basketlist.jsp";
			forward(req, resp, url);
			
		} 
		
		else if (uri.indexOf("BasketAdd_ok.do") != -1){
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";
			
			System.out.println("session: "+session.getAttribute("guestNum"));

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);

			}
			
			int basketNum = 0;
			int buildingNum = Integer.parseInt(req.getParameter("buildingNum"));
			int roomNum = Integer.parseInt(req.getParameter("roomNum"));
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			
			BasketDAO dao = new BasketDAO(conn);
			BasketDTO dto = new BasketDTO();
			
			basketNum = dao.getMaxNum() + 1;
			dto.setBasketNum(basketNum);
			dto.setBuildingNum(buildingNum);
			dto.setGuestNum(userNum);
			dto.setRoomNum(roomNum);
			dto.setRoomStartDate(start);
			dto.setRoomEndDate(end);
			
			
			System.out.println(dto.getBasketNum());
			System.out.println(dto.getBuildingNum());
			System.out.println(dto.getGuestNum());
			System.out.println(dto.getRoomNum());
			System.out.println(dto.getRoomStartDate());
			System.out.println(dto.getRoomEndDate());
			
			RoomRsvDAO rdao = new RoomRsvDAO(conn);
			long price = rdao.getPrice(roomNum);
			
			long totalPrice = 0;
			// 두 날짜 빼기
			 try{ 
				// String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 try catch 오류 처리를 해줍니다
				SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		        
				// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환합니다
				Date FirstDate = format.parse(start);
				Date SecondDate = format.parse(end);
		        
				// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화합니다
				long calDate = FirstDate.getTime() - SecondDate.getTime(); 
		        
				// Date.getTime() 은 해당날짜를 기준으로 몇 초가 흘렀는지를 반환해줍니다 
				// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나옵니다
				long calDateDays = calDate / (24*60*60*1000); 
		 
				calDateDays = Math.abs(calDateDays);
				System.out.println("calDateDays: " + calDateDays);
				totalPrice = calDateDays*price;
		        
			}catch (Exception e) {
				// TODO: handle exception
			}
			dto.setTotalPrice(totalPrice);
			System.out.println(dto.getTotalPrice());
			dao.insertCartItem(dto);
			
			url = "/project/basketlist.do"; // + "/index.jsp";	
			forward(req, resp, url);	
			
		} 
		
		else if(uri.indexOf("join_ok.do")!=-1) {
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";
			
			System.out.println("session: "+session.getAttribute("guestNum"));

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);

			}
			
			GuestDTO dto = new GuestDTO();
			GuestDAO dao = new GuestDAO(conn);
			GuestDAO dao2 = new GuestDAO(conn);
			int maxNum = dao2.getMaxNum();
			// 폼 post방식으로 넘어오니까 dto.setUserId(req.getParameter("userId")로 가져온다.
			dto.setGuestNum(maxNum+1);
			dto.setGuestId(req.getParameter("guestId"));
			dto.setGuestPwd(req.getParameter("guestPwd"));
			dto.setGuestName(req.getParameter("guestName"));
			dto.setGuestGender(req.getParameter("guestGender"));
			dto.setGuestBirth(req.getParameter("guestBirth"));
			dto.setGuestTel(req.getParameter("guestTel"));
			dto.setGuestEmail(req.getParameter("guestEmail"));		
			dao.insert(dto);
			
			// 사진15
			// index.jsp 안적어줘도 index.jsp로 이동함
			// web.xml 에서 index.html를 위에서부터 찾으니까	
			url = "/yanolja/loginPage/loginPage.jsp"; // + "/index.jsp";	
			resp.sendRedirect(url);	
			// 로그인창을 띄운다.
			// 사진17	
			// 로그인하기	
		} 
		
		else if(uri.indexOf("idpwdSearch.do") != -1) {	
			url = "/searchPage/idpwdSearch.jsp";
			// 포워딩은 실제주소로 찾아가게 한다.
			forward(req, resp, url);		 	
			// id,패스워드는 기본키가 아니다 guestNum이 기본키라서 그걸 먼저 찾아야함
		} 
		
		else if(uri.indexOf("idpwdSearch_ok.do") != -1) {
			
			GuestDAO dao = new GuestDAO(conn);
			String guestName = req.getParameter("guestName");
			String guestBirth = req.getParameter("guestBirth");	
			
			int flag = 1;

			//guestName = URLDecoder.decode(guestName, "UTF-8");
			System.out.println(guestName);
			System.out.println(guestBirth);
			
			GuestDTO dto = dao.getSearchData(guestName,guestBirth);	

			if (dto == null || (!dto.getGuestBirth().equals(guestBirth))) {	
				flag = 0;
				req.setAttribute("flag", flag);
				req.setAttribute("msg2","회원정보가 존재하지 않습니다.");
				
				url = "/searchPage/idpwdSearch_ok.jsp";
				forward(req, resp, url);
				return;
			}
			if(guestName.equals(dto.getGuestName()) && guestBirth.equals(dto.getGuestBirth())){ 
				req.setAttribute("flag", flag);
				req.setAttribute("msg1","아이디는 [ " + dto.getGuestId() + "] 비밀번호는 [ " + dto.getGuestPwd() + " ] 입니다.");
				
				url = "/searchPage/idpwdSearch_ok.jsp";
				
				forward(req, resp, url);
				return;
			} 	

		}
				
		//--------------------------------------------------------------------------------------------
		
		

		else if(uri.indexOf("building1.do")!= -1) {
			
			int userNum = 0;
			String userName = "";
			MainDAO main_dao = new MainDAO(conn);
			BuildingDTO building_dto = new BuildingDTO();
			List<String> locLists = new ArrayList<>();
			
			String kind;
			String loc = "";
			String locDetail = "";
			String open;

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = main_dao.searchUserName(userNum);

				System.out.println("userNum: " + userNum);
				System.out.println("userName: " + userName);
			}

			kind = req.getParameter("kind");
			String kind_H ="";
			
			if(kind != null) {
			switch(kind) {
			
			case "1":
				kind_H = "모텔"; break;
			
			case "2":
				kind_H = "호텔"; break;
			
			case "3":
				kind_H = "펜션"; break;
			
			case "4":
				kind_H = "게스트하우스"; break;
				
			}
			}
			
			loc = req.getParameter("loc");
			locDetail = req.getParameter("locDetail");
			if(loc == null) {
				loc = "";
			}
			else {
				building_dto.setLocLists(loc);
				locLists = building_dto.getLocLists();
			}

			open = req.getParameter("open");
			kind = req.getParameter("kind");
			
			System.out.println(kind);
			
			req.setAttribute("kind", kind);
			req.setAttribute("kind_H", kind_H);
			req.setAttribute("userNum", userNum);
			req.setAttribute("userName", userName);
			req.setAttribute("open", open);
			req.setAttribute("loc", loc);
			req.setAttribute("locDetail", locDetail);
			req.setAttribute("locLists", locLists);


			url = "/building1Page/building1Page.jsp";
			forward(req, resp, url);

		}
		
		else if (uri.indexOf("building2.do") != -1) {
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";

			String kind = req.getParameter("kind");
			String loc = req.getParameter("loc");
			String locDetail = req.getParameter("locDetail");
			String kind_H = "";
			
			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);

			}
			switch(kind) {
			
			case "1":
				kind_H = "모텔"; break;
			
			case "2":
				kind_H = "호텔"; break;
			
			case "3":
				kind_H = "펜션"; break;
			
			case "4":
				kind_H = "게스트하우스"; break;
				
			}
			
			System.out.println(kind_H);
			System.out.println(kind);
			req.setAttribute("kind_H", kind_H);
			req.setAttribute("kind", kind);
			req.setAttribute("loc", loc);
			req.setAttribute("locDetail", locDetail);
			
			req.setAttribute("userNum", userNum);
			req.setAttribute("userName", userName);
			url = "/building2Page/building2.jsp";
			forward(req, resp, url);
		}
		
		else if (uri.indexOf("building2_ok.do") != -1) {

			
			Building2DAO dao = new Building2DAO(conn);
			String kind = req.getParameter("kind");
			String loc = req.getParameter("loc");
			String locDetail = req.getParameter("locDetail");
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			
			int kindValue = Integer.parseInt(kind);
			String locValue = URLDecoder.decode(loc, "UTF-8");
			String locDetailValue = URLDecoder.decode(locDetail, "UTF-8");
			
			//int kindValue = 5;
			//String locValue = "서울";

			List<Building2DTO> lists = dao.getBuildingLists(kindValue, locValue, locDetailValue);
			System.out.println("size: " + lists.size());

			for(int i = 0 ; i<lists.size();i++) {
				int num = lists.get(i).getBuildingNum();

				int roomMinPrice = dao.getRoomLists(num);
				lists.get(i).setRoomPrice(roomMinPrice);

			}
			
			String kind_H ="";
			switch(kind) {
			
			case "1":
				kind_H = "모텔"; break;
			
			case "2":
				kind_H = "호텔"; break;
			
			case "3":
				kind_H = "펜션"; break;
			
			case "4":
				kind_H = "게스트하우스"; break;
				
			}
			req.setAttribute("kind_H", kind_H);
			req.setAttribute("kind", kind);
			req.setAttribute("loc", loc);
			req.setAttribute("locDetail", locDetail);
			req.setAttribute("lists", lists);
			req.setAttribute("start", start);
			req.setAttribute("end", end);
			
			url = "/building2Page/building2.jsp";
			forward(req, resp, url);
		}
		
		else if (uri.indexOf("building3.do") != -1) {
			// Session 가져오기
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);
			}
			
			Building3DAO dao = new Building3DAO(conn);
			Building3DTO buildingInfo = new Building3DTO();
			List<Building3DTO> roomLists = null;
			
			int maxNum = 0;
			int buildingNum = 0;
			buildingNum = (Integer.parseInt(req.getParameter("buildingNum")));
			String kind = req.getParameter("kind");
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			
			buildingInfo = dao.getBuildingData(buildingNum);
			roomLists = dao.getLists(buildingNum);
			maxNum = dao.getMaxNum();
			
			req.setAttribute("userNum", userNum);
			req.setAttribute("userName", userName);
			
			req.setAttribute("kind", kind);
			req.setAttribute("maxNum", maxNum);
			
			req.setAttribute("Bdto", buildingInfo);
			req.setAttribute("roomLists", roomLists);
			
			
			req.setAttribute("start", start);
			req.setAttribute("end", end);
			
			url = "/building3Page/building3Page.jsp";
			forward(req, resp, url);
		} 
		
		else if (uri.indexOf("reviewPage.do") != -1) {
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";
			
			System.out.println("session: "+session.getAttribute("guestNum"));

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);

			}
			
			ReviewDAO rdao = new ReviewDAO(conn);
			ReviewDTO dto = new ReviewDTO();

			dto.setBuildingNum(Integer.parseInt(req.getParameter("bulidingnum")));
			dto.setBuildingName(req.getParameter("bulidingname"));

			dto.setGuestNum(Integer.parseInt(req.getParameter("guestnum")));
			dto.setGuestId(req.getParameter("guestid"));

			dto.setReviewNum(Integer.parseInt(req.getParameter("reviewnum")));
			dto.setReviewCreated(req.getParameter("reviewcreated"));
			dto.setReviewComment(req.getParameter("reviewcomment"));
			dto.setReviewStar(Integer.parseInt(req.getParameter("reviewstar")));

			rdao.getList();

			req.setAttribute("userName", userName);
			req.setAttribute("userNum", userNum);
			
			url = cp + "/review/reviewPage.jsp";
			resp.sendRedirect(url);
		}
		
		else if (uri.indexOf("roomRsv.do") != -1) {
			// Session 가져오기
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);
			}
			int buildingNum = 0, roomNum = 0;
			
			buildingNum = Integer.parseInt(req.getParameter("buildingNum"));
			roomNum = Integer.parseInt(req.getParameter("roomNum"));
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			String buyCase = req.getParameter("visitCase");
			
			Building3DAO B3dao = new Building3DAO(conn);
			GuestDAO Gdao = new GuestDAO(conn);
			
			Building3DTO buildingInfo = new Building3DTO();
			Building3DTO roomInfo = new Building3DTO();
			GuestDTO guestInfo = new GuestDTO();
			
			buildingInfo = B3dao.getBuildingData(buildingNum);
			roomInfo = B3dao.getRoomData(roomNum);
			guestInfo = Gdao.getReadData(userNum);
					
			req.setAttribute("userNum", userNum);
			req.setAttribute("userName", userName);
			
			req.setAttribute("Bdto", buildingInfo);
			req.setAttribute("Rdto", roomInfo);
			req.setAttribute("Gdto", guestInfo);
			
			req.setAttribute("start", start);
			req.setAttribute("end", end);
			
			url = "/roomRsvPage/roomRsv.jsp";
			forward(req, resp, url);
		}
		else if (uri.indexOf("roomRsv_ok.do") != -1) {
			
			int buyNum = 0;
			String visitCase = req.getParameter("visitCase");
			int guestNum = Integer.parseInt(req.getParameter("guestNum"));
			int roomNum = Integer.parseInt(req.getParameter("roomNum"));
			int buildingNum = Integer.parseInt(req.getParameter("buildingNum"));
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			int totalPrice = 0;
			int price = 0;
			
			RoomRsvDTO dto = new RoomRsvDTO();
			RoomRsvDAO dao = new RoomRsvDAO(conn);
			price = dao.getPrice(roomNum);
			
			buyNum = dao.getMaxNum() + 1;
			// 두 날짜 빼기
			
			 try{ 
				// String Type을 Date Type으로 캐스팅하면서 생기는 예외로 인해 try catch 오류 처리를 해줍니다
				SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		        
				// date1, date2 두 날짜를 parse()를 통해 Date형으로 변환합니다
				Date FirstDate = format.parse(start);
				Date SecondDate = format.parse(end);
		        
				// Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화합니다
				long calDate = FirstDate.getTime() - SecondDate.getTime(); 
		        
				// Date.getTime() 은 해당날짜를 기준으로 몇 초가 흘렀는지를 반환해줍니다 
				// 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나옵니다
				long calDateDays = calDate / (24*60*60*1000); 
		 
				calDateDays = Math.abs(calDateDays);
				System.out.println("calDateDays: " + calDateDays);
				totalPrice = (int) (calDateDays*price);
		        
			}
			catch(ParseException e){
				e.printStackTrace();
			}
			
			 System.out.println(buyNum);
			 System.out.println(totalPrice);
			 System.out.println(visitCase);
			 System.out.println(guestNum);
			 System.out.println(roomNum);
			 System.out.println(buildingNum);
			 System.out.println(start);
			 System.out.println(end);
			 
			 
			 
			 dto.setBuyNum(buyNum);
			 dto.setTotalPrice(totalPrice);
			 dto.setBuyCase(visitCase);
			 dto.setGuestNum(guestNum);
			 dto.setRoomNum(roomNum);
			 dto.setBuildingNum(buildingNum);
			 dto.setStartDate(start);
			 dto.setEndDate(end);
			 
			 dao.insert(dto);
			 
			url="/project/main.do";
			forward(req,resp,url);
			
		}
		else if (uri.indexOf("roomChk.do") != -1) {
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";
			
			System.out.println("session: "+session.getAttribute("guestNum"));

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);

			}
			
			RoomChkDAO dao = new RoomChkDAO(conn);

			int rnum = Integer.parseInt(req.getParameter("roomNum"));
			//int rnum = 2;
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			
			RoomChkDTO dto = dao.getRoomLists(rnum);
			
			int bnum = dto.getBuildingNum();
			String bCI = dao.getBuildingLists(bnum).getBuildingCI();
			String bCO = dao.getBuildingLists(bnum).getBuildingCO();
			System.out.println(bCI);
			
			dto.setBuildingCI(bCI);
			dto.setBuildingCO(bCO);

			System.out.println("Building");
			System.out.println(bnum);
			System.out.println(bCI);
			System.out.println(bCO);
			
			req.setAttribute("userName", userName);
			req.setAttribute("userNum", userNum);
			
			
			req.setAttribute("dto", dto);
			req.setAttribute("start", start);
			req.setAttribute("end", end);
			
			req.setAttribute("buildingNum", bnum);
			req.setAttribute("roomNum", rnum);
			
			url = "/roomChkPage/roomChk.jsp";
			forward(req, resp, url);
		}
		
		else if(uri.indexOf("myPage.do")!= -1){
			// Session 가져오기
			MainDAO mdao = new MainDAO(conn);
			int userNum = 0;
			String userName = "";

			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
				userName = mdao.searchUserName(userNum);
			}
			req.setAttribute("userName", userName);
			req.setAttribute("userNum", userNum);
			
			
			url = "/myPage/myPage.jsp";
			forward(req, resp, url);
		}
		
		else if(uri.indexOf("pwdMapping.do")!= -1){
			
			url = "/pwdMappingPage/pwdMappingPage.jsp";
			forward(req, resp, url);
		}
		
		else if(uri.indexOf("updated.do")!=-1) {
			GuestDTO gdto = new GuestDTO();
			GuestDAO gdao = new GuestDAO(conn);
			
			session = req.getSession();
			int userNum = 0;
			
			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
			}
			
			gdto = gdao.getReadData(userNum);
			
			req.setAttribute("userNum", userNum);
			
			req.setAttribute("dto", gdto);
			url = "/updatedPage/update.jsp";
			forward(req, resp, url);

		} 
		
		else if(uri.indexOf("updated_ok.do")!=-1) {
			GuestDAO dao = new GuestDAO(conn);
			GuestDTO dto = new GuestDTO();
			session = req.getSession();
			int userNum = 0;
			
			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
			}
			
			String updatedPwd = req.getParameter("guestPwd");
			String updatedTel = req.getParameter("guestTel");
			System.out.println(updatedPwd);
			System.out.println(updatedTel);
			
			dao.updateData(userNum, updatedPwd, updatedTel);
			
			req.setAttribute("userNum", userNum);
			
			
			url = "/project/main.do";
			forward(req, resp, url);
		
		}
		else if(uri.indexOf("pwdMapping2.do")!=-1) {
			url = "/pwdMappingPage2/pwdMappingPage2.jsp";
			forward(req, resp, url);
		}
		else if(uri.indexOf("deleted_ok.do")!=-1) {
			
			session = req.getSession();
			int userNum = 0;
			String userPwd = req.getParameter("guestPwd");
			
			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
			}
			
			GuestDAO dao = new GuestDAO(conn);
			GuestDTO dto = new GuestDTO();
			
			dto = dao.getReadData(userNum);
			System.out.println(userPwd);
			if(dto.getGuestPwd().equals(userPwd)) {
				dao.deleteData(userNum);
				System.out.println("!!!");
				url = "/project/logout.do";
			}
			else {
				System.out.println("??");
				url = "/project/pwdMapping2.do";
			}
			
			forward(req, resp, url);
		}
		// 결제 내역 페이지로 이동
		else if(uri.indexOf("payment.do")!=-1) {
			
			session = req.getSession();
			int userNum = 0;
			
			if(session.getAttribute("guestNum") != null) {
				userNum = (Integer)session.getAttribute("guestNum");
			}	
			// 해당사용자로 조회한다.
			// buydto를 구함 그것을 총 사용자 테이블의 내용을 부름
			
			
			url = cp + "/paymentPage/paymentlist.jsp?userNum="+userNum;
			
			resp.sendRedirect(url);
			
		}
		
	}//doPost

}




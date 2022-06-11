<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>야놀자 | 여행의 모든 것</title>

<script type="text/javascript">

function sendIt() {

		var f = document.rsvForm;
		
		
		f.action= "<%=cp%>/project/roomRsv_ok.do";
		f.submit();
	}
	
</script>	

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css" />

</head>
<body>
	<center>
		<!-- 로고 -->
		<header>
<table width="100%">
<tr height="50">
	<td width="20%"></td>
	<td width="60%" align="center"><a href="<%=cp %>/project/main.do">
		<img src="<%=cp%>/css/img/logo.svg">
	</a></td>
	
	<td width="20%" align="right" style="padding-right: 20px">
	
		<c:if test="${userNum == 0}">
			<a href="<%=cp%>/project/login.do">로그인/회원가입</a>
		</c:if>
		<c:if test="${userNum != 0 }">
			${userName }님 환영합니다.<br/>
			<a  href="<%=cp %>/project/myPage.do">이동</a>
			<a href="<%=cp%>/project/basketlist.do">
			<img src="<%=cp%>/css/img/icon-cart-black-line-2.svg"></a> &nbsp;&nbsp;
			
			<a href="logout.do"> 로그아웃</a>
		</c:if>
		
		
	</td>
</tr>
</table>
</header>

		<form action="" method="post" name="rsvForm">
		<!-- 회색박스 -->
		<table bgcolor="#eee" background="#eee">
			<tr height="20">
				<td></td>
			</tr>
		</table>

		<!-- 상품 정보 하얀칸 -->
		<table class="section">

			<tr height="5">
				<td></td>
			</tr>

			<tr>
				<td style="font-size: 25px" align="left"><b>&nbsp;상품 정보</b></td>
			</tr>

			<tr height="1"><td bgcolor="#dbdbdb"></td></tr>

			<tr>
				<td>
					<!-- 숙소정보박스 -->
					<table cellpadding="5px" width="100%">
						<tr>
							<td></td>
							<td width="300px" rowspan="9">
							<img height="200px" width="300px" src="<%=cp %>/building2/img/${dto.buildingNum}.png" /></td>
						</tr>
						<tr height="5px">
							<td></td>
						</tr>
						<tr style="font-size: 25px" height="50px">
							<td><b>${Bdto.getBuildingName() }</b>&nbsp;${Rdto.getRoomName() }</td>
						</tr>
						<tr style="font-size: 20px" height="30px">
							<td></td>
						</tr>
						<tr style="font-size: 15px;">
							<td>${start} ${Bdto.getBuildingCI() } ~ ${end}${Bdto.getBuildingCO() }</td>
						</tr>
						<tr style="font-size: 15px;">
							<td>${Bdto.getBuildingLoc()} #${Bdto.getBuildingKW() }</td>
						</tr>
						<tr>
							<td>수용인원 기준 ${Rdto.getRoomPeople() }명</td>
						</tr>	
						<tr style="font-size: 20px;" align="right">
							<td>가격 ${Rdto.getRoomPrice() } &nbsp;&nbsp;&nbsp;</td>
						</tr>
						<tr style="font-size: 20px" height="15px">
							<td></td>
						</tr>
						
					</table>
				</td>
			</tr>
		</table>
		
		
		
		<!-- 고객 정보 하얀칸 -->
		<table class="section">

			<tr height="5">
				<td></td>
			</tr>

			<tr>
				<td style="font-size: 25px" align="left"><b>&nbsp;예약자 정보</b></td>
			</tr>

			<tr height="1"><td bgcolor="#dbdbdb"></td></tr>

			<tr>
				<td>
					<!-- 개인정보박스 -->
					<table cellpadding="30px">
						<tr>
						<td>이 름</td>
						<td><input type="text" class="text"  value="${Gdto.getGuestName() }" readonly>
						</td>
						</tr>
						<td>전화번호</td>
						<td><input type="text" class="text" value="${Gdto.getGuestTel() }" readonly>
						</td>
					</table>
					
					
				</td>
			</tr>
		</table>
		
		
		<table class="section">
		<tr>
			<td style="font-size: 25px" align="left"><b>&nbsp;숙소 방문 수단</b></td>
			<td align="right" style="font-size: 17px">
			<input type="radio" name="visitCase" value="차량"> &nbsp;&nbsp;차&nbsp;&nbsp;량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="visitCase" value="도보"> &nbsp;&nbsp;도&nbsp;&nbsp;보&nbsp;&nbsp;
			</td>
		</tr>
		</table>
		
		<table class="section" cellpadding="5px">
		<tr>
			<td style="font-size: 15px" align="left"><b>결제 유의 사항</b></td>
		</tr>
		<tr>
		<td>
		실시간 예약의 특성상 동일한 객실에 중복 예약이 발생할 수 있으며, 이 경우 먼저 결제완료된 예약 건에 우선권이 있으므로 이후 중복 예약 건은 취소될 수 있습니다.<br/>
성수기 요금의 확정 전, 또는 잘못 등록된 요금으로 고객센터를 통한 안내 후, 예약 취소가 진행될 수 있습니다.<br/>
예약 시 표시된 시설정보와 상이하거나 계약내용과 다르게 이행된 점이 확인될 경우, 이용 고객 또는 숙박시설의 요청에 따라 예약취소가 진행될 수 있습니다.<br/>
호텔 예약은 각 호텔의 취소규정에 의해 취소 및 환불이 진행됩니다.<br/>
현장에서 발생된 숙박시설과의 분쟁으로 인한 취소/환불 요청 시, 당사는 중개플랫폼사로 취소 및 환불처리에 관여하지 않습니다.<br/>
(주)야놀자는 예약 중개업자로서 천재지변, 숙박업체의 파업, 항공사사정, 내란 등 여러 사유로 발생한 직, 간접적인 예약 고객님의 피해에 대하여 배상의 책임을 지지 않습니다.<br/>
		</td>
		</tr>
		<tr><td><input type="radio" name="check">상기 내용을 확인하였습니다.</td>
		</tr>
		<tr>
		<td><input type="button" class="pb" value="예    약     하    기" onclick="sendIt()" />
		</td>
		</tr>
		</table>
		
		<input type="hidden" value="${Gdto.getGuestNum() }" name="guestNum"/>
		<input type="hidden" value="${Rdto.getRoomNum() }" name="roomNum"/>
		<input type="hidden" value="${Bdto.getBuildingNum() }" name="buildingNum"/>
		<input type="hidden" value="${start }" name="start"/>
		<input type="hidden" value="${end }" name="end"/>
		
		</form>
		
		
		<!-- 회사 사항 + 링크페이지 -->
		<br /> <br />
		<table width="60%" style="background-color: #eee;">
			<tr>
				<td><img src="<%=cp%>/css/img//ico-logo-gray.svg" alt="야놀자">
				</td>
			</tr>
			<tr>
				<td><b>(주)야놀자</b> | 대표이사 : 이수진 | 사업자 등록번호 : 220-87-42885 |
					통신판매업신고 : 강남-14211호 | 메일 : help@yanolja.com<br> 관광사업자 등록번호 :
					제2016-31호 | 주소 : 서울 강남구 테헤란로 108길 42 | 호스팅서비스 제공자 : 주식회사 야놀자<br>
					고객센터 : 1644-1346 (오전 9시 - 익일 새벽 3시)</td>
			</tr>
			<tr>
				<td><a href="https://yanolja.in/ko/companyinfo/"
					target="_blank">회사소개</a> <a
					href="https://business.yanolja.com/web/kr/index" target="_blank">광고제휴문의</a>
					<a href="https://careers.yanolja.co/" target="_blank">인재채용</a> <a
					href="http://m.policy.yanolja.com/?t=privacy&amp;d=m"
					target="_blank"><strong>개인정보처리방침</strong></a></td>
			</tr>
			<tr>
				<td><a href="https://policy.yanolja.com/?t=youth"
					target="_blank">청소년 보호 정책</a> <a
					href="http://m.policy.yanolja.com/?t=service&amp;d=m"
					target="_blank">서비스 이용약관</a> <a
					href="http://m.policy.yanolja.com/?t=location&amp;d=m"
					target="_blank">위치정보이용약관</a> <a
					href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2208742885"
					target="_blank">사업자 정보확인</a></td>
			</tr>
		</table>
		<br /> <br />
	</center>
</body>
</html>
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

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css" />

<script type="text/javascript">

	function sendBasket() {
		
		var f = document.ChkForm;
		
		f.action= "<%=cp%>/project/BasketAdd_ok.do"; /* 장바구니 페이지 */
		f.submit();
	}

	function sendBuy() {

		var f = document.ChkForm;
		
		f.action= "<%=cp%>/project/roomRsv.do"; /* 결제 페이지 */
		f.submit();
	}
	
</script>
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


		<form action="" name="ChkForm">
		<table class="section">
			<tr>
				<td colspan="2">


					<table width="100%" cellpadding="1px" cellspacing="10px">

						<tr height="50">
							<td></td>
						</tr>
						<tr style="font-size: 40px;">
							<td><b>&nbsp;${dto.roomName }</b></td>
						</tr>
						<tr style="font-size: 20px; color: #dbdbdb">
							<td>&nbsp;&nbsp;&nbsp;기 준 : ${dto.getRoomPeople() } 명</td>
						</tr>

					</table>

					<table width="100%" cellpadding="1px" cellspacing="10px"
						bgcolor="#eee" style="border-radius: 20px">
						<tr height="1">
							<td width="10px"></td>
							<td colspan="3" bgcolor="#dbdbdb"></td>
							<td width="10px"></td>
						</tr>

						<tr height="10px">
							<td width="10px"></td>
							<td colspan="1" width="40%" align="center" height="10">체크인</td>
							<td rowspan="2" width="20%" align="center">/</td>
							<td colspan="1" width="40%" align="center" height="10">체크아웃
							</td>
							<td width="10px"></td>
						</tr>

						<tr height="10px">
							<td width="10px"></td>
							<td colspan="1" width="40%" align="center" height="30"
								style="font-size: 20px"><b>${start } ${dto.getBuildingCI() }</b></td>

							<td colspan="1" width="40%" align="center" height="30"
								style="font-size: 20px"><b> ${end } ${dto.getBuildingCO() }</b></td>
							<td width="10px"></td>
						</tr>


						<tr height="1">
							<td width="10px"></td>
							<td colspan="3" bgcolor="#dbdbdb"></td>
							<td width="10px"></td>
						</tr>

					</table>

				</td>
			</tr>

			<tr>
				<td colspan="2" style="padding: 20px;"><strong>취소규정</strong><br />
					▷ 당일 체크인 상품으로 취소 및 환불 불가합니다.<br /> ▷ 단, 호텔의 경우 예약 완료 시점부터 10분 이내 전액
					취소가 가능합니다. (MY야놀자 → 예약 내역)<br /> ▷ 예약완료 후 10분 이내라도 입실 시간이 경과된 경우,
					취소 및 환불 불가합니다.<br /> ▷ 상세한 취소 규정은 '자세히 보기'에서 확인하실 수 있습니다.<br /></td>
			</tr>

			<tr height="200">
				<td colspan="2"></td>
			</tr>

			<tr>
				<td><input type="button" width="50%" class="wb" value="장바구니"
					onclick="sendBasket();" /></td>
				<td><input type="button" width="50%" class="pb" value="바로예약"
					onclick="sendBuy();" /></td>
			</tr>
		</table>
		<input type="hidden" value="${roomNum }" name="roomNum"/>
		<input type="hidden" value="${buildingNum }" name="buildingNum"/>
		<input type="hidden" value="${start }" name="start"/>
		<input type="hidden" value="${end }" name="end"/>
		</form>
		
		<!-- 회사 사항 + 링크페이지 -->
		<br />
		<br />
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
		<br />
		<br />
	</center>
</body>
</html>
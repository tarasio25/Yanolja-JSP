<%@page import="java.util.List"%>
<%@page import="util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="building3Page.Building3DAO"%>
<%@page import="util.MyUtil"%>
<%@page import="building3Page.Building3DTO"%>
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
<title>방정보</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css" />

<!-- 달력	 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$.datepicker.setDefaults($.datepicker.regional['ko']);
				$("#startDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yymmdd",
									maxDate : 0, // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										//시작일(startDate) datepicker가 닫힐때
										//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
										$("#endDate").datepicker("option",
												"minDate", selectedDate);
									}

								});
				$("#endDate")
						.datepicker(
								{
									changeMonth : true,
									changeYear : true,
									nextText : '다음 달',
									prevText : '이전 달',
									dayNames : [ '일요일', '월요일', '화요일', '수요일',
											'목요일', '금요일', '토요일' ],
									dayNamesMin : [ '일', '월', '화', '수', '목',
											'금', '토' ],
									monthNamesShort : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									monthNames : [ '1월', '2월', '3월', '4월',
											'5월', '6월', '7월', '8월', '9월',
											'10월', '11월', '12월' ],
									dateFormat : "yymmdd",
									maxDate : 0, // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
									onClose : function(selectedDate) {
										// 종료일(endDate) datepicker가 닫힐때
										// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
										$("#startDate").datepicker("option",
												"maxDate", selectedDate);
									}

								});
			});
</script>
<!-- 달력 -->

<style>
	/* 브라우저 마진과 패딩 리셋 */
	* {margin:0;padding:0;}

	/* INPUT 가리기 */
	.section [id*="slide"] {display:none;}
	
	/* 슬라이드 영역 - max-width 크기를 조절해주면 됩니다*/
	.section .slidewrap {max-width:600px;margin:0 auto;overflow:hidden;position:relative;}
	.section .slidelist {white-space:nowrap;font-size:0;}
	.section .slidelist > li {display:inline-block;vertical-align:middle;width:100%;transition:all .5s;}
	.section .slidelist > li > a {display:block;position:relative;}

	/* 좌우로 넘기는 LABEL버튼에 대한 스타일 */
	.section .slide-control {position:absolute;top:0;left:0;z-index:10;width:100%;height:100%;}
	.section .slide-control label {position:absolute;z-index:1;top:50%;transform:translateY(-50%);padding:50px;cursor:pointer;}
	.section .slide-control .left {left:30px;background:url('./img/left.png') center center / 100% no-repeat;}
	.section .slide-control .right {right:30px;background:url('./img/right.png') center center / 100% no-repeat;}
	.section .slide-control [class*="control"] {display:none;}

	/* INPUT이 체크되면 변화값이 li까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
	.section [id="slide02"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
	.section [id="slide03"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}
	.section [id="slide04"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-300%);}
	.section [id="slide05"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-400%);}
	
	/*  INPUT이 체크되면 변화값이 좌우 슬라이드 버튼을 담고 있는 div 까지 전달되는 스타일 */
	.section [id="slide01"]:checked ~ .slidewrap .control01 {display:block;}
	.section [id="slide02"]:checked ~ .slidewrap .control02 {display:block;}
	.section [id="slide03"]:checked ~ .slidewrap .control03 {display:block;}
	.section [id="slide04"]:checked ~ .slidewrap .control04 {display:block;}
	.section [id="slide05"]:checked ~ .slidewrap .control05 {display:block;}
</style>

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
			<a href="<%=cp%>/project/basketlist.do">
			<img src="<%=cp%>/css/img/icon-cart-black-line-2.svg"></a> &nbsp;&nbsp;
			
			<a href="logout.do"> 로그아웃</a>
		</c:if>
		
		
	</td>
</tr>
</table>
</header>




<!-- 숙소 이름, 위치 -->

<table id="lists" width="100%" class="section"
			style="font-size: 22pt;">

			<tr height="50">



			</tr>


			<%-- <% 	String guestId = dao.searchGuest(dto.getGuestNum());
			%> --%>

			<tr height="500px" align="center">

				<td colspan="5" align="center"><div class="section">
	<input type="radio" name="slide" id="slide01" checked>
	<input type="radio" name="slide" id="slide02">
	<input type="radio" name="slide" id="slide03">
	<input type="radio" name="slide" id="slide04">
	<input type="radio" name="slide" id="slide05">
	<div class="slidewrap">
		<ul class="slidelist">
		
			<%for(int i=1;i<=5;i++){ %>
		
			<li>
				<a>
					<img src="<%=cp %>/image/${kind }/${Bdto.getBuildingNum() }/<%=i %>.jpg">
				</a>
			</li>
			
			<%} %>
			
			
		</ul>

		<div class="slide-control">
			<div class="control01">
				<label for="slide05" class="left"></label>
				<label for="slide02" class="right"></label>
			</div>
			<div class="control02">
				<label for="slide01" class="left"></label>
				<label for="slide03" class="right"></label>
			</div>
			<div class="control03">
				<label for="slide02" class="left"></label>
				<label for="slide04" class="right"></label>
			</div>
			<div class="control04">
				<label for="slide03" class="left"></label>
				<label for="slide05" class="right"></label>
			</div>
			<div class="control05">
				<label for="slide04" class="left"></label>
				<label for="slide01" class="right"></label>
			</div>
		</div>
	</div>
</div></td>

			</tr>

<tr style="font-size: 13pt;">
	<td width="10px"></td>
	<td align="left">&nbsp;&nbsp;대표사진</td>
	<td align="center" width="5%">1/5</td>
	<td align="right">전체사진</td>
	<td width="10px"></td>
</tr>

<tr>
	<td colspan="5"><font size=10pt><b>&nbsp;&nbsp;${Bdto.getBuildingName() }</b></font></td>
</tr>

<tr>
	<td colspan="5">★${Bdto.getBuildingStar() }/5 &nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=cp%>/review/reviewPage.jsp" style="text-decoration: none"> 후기 ${maxNum}개</a><br> ${Bdto.getBuildingLoc()}
	</td>
</tr>

<!-- 체크인 / 체크아웃 -->


<tr height="1">
	<td width="10px"></td>
	<td colspan="3" bgcolor="#dbdbdb"></td>
	<td width="10px"></td>
</tr>


<tr height="10px">
	<td width="10px"></td>
	<td colspan="1" width="40%" align="center" height="10">체크인<br />
		<input type="text" id="startDate" value="${start }" >${Bdto.getBuildingCI()}
	</td>
	<td width="20%" align="center">/</td>
	<td colspan="1" width="40%" align="center" height="10">체크아웃<br />
		<input type="text" id="endDate" value="${end }" >${Bdto.getBuildingCO() }
	</td>
	<td width="10px"></td>

</tr>


<tr height="1">
	<td width="10px"></td>
	<td colspan="3" bgcolor="#dbdbdb"></td>
	<td width="10px"></td>
</tr>


<!-- 방 정보(for문) -->
<c:set var="i" value="1"/>
<c:forEach var="dto" items="${roomLists }">
<tr>
	<td rowspan="4"></td>
	<td rowspan="4" width="30%"><a href="<%=cp %>/project/roomChk.do?roomNum=${dto.roomNum}&start=${start}&end=${end}">
		<img src="<%=cp%>/image/${kind }/${Bdto.getBuildingNum() }/room/${i }.jpg" width="90%">
	</a></td>

	<td colspan="2" width="50%" align="center">${dto.roomName }룸</td>
	<td rowspan="4"></td>
</tr>

<tr>
	<td colspan="2" align="center">${dto.roomPeople }명 (기준인원)</td>
</tr>

<tr>
	<td colspan="2" align="center">입실: ${Bdto.getBuildingCI() } / 퇴실: ${Bdto.getBuildingCO()}</td>
</tr>

<tr>
	<td colspan="2" align="center">${dto.roomPrice }원 (가 격)</td>
</tr>

<tr height="1">
	<td width="10px"></td>
	<td colspan="3" bgcolor="#dbdbdb"></td>
	<td width="10px"></td>
</tr>

<tr>
	<td rowspan="3"></td>
	<td><b>숙소 옵션</b></td>
</tr>

<tr>
	<td>${dto.roomOption}</td>
</tr>


<tr height="1">
	<td colspan="3" bgcolor="#dbdbdb"></td>
	<td></td>
	<td width="10px"></td>
</tr>
<c:set var="i" value="${i+1}"/>
</c:forEach>


<tr>
	<td></td>
	<td><b>숙소 소개</b></td>
</tr>

<tr>
	<td colspan="4">${Bdto.getBuildingDesc() }</td>
</tr>

</table>


<!-- 숙소 별점, 후기 for문 -->
<table width="100%" class="section" style="font-size: 12pt;">
	<tr>
		<td width="10px"></td>
		<td colspan="2" align="left"><b>후기 (총 ${maxNum}개)</b></td>
	</tr>

	<tr>
		<td></td>
		<td style="font-size: 40pt">★${Bdto.getBuildingStar() }/5</td>
	</tr>


	<tr height="1">
		<td width="10px"></td>
		<td colspan="3" bgcolor="#dbdbdb"></td>
		<td width="10px"></td>
	</tr>

	<tr>
		<td rowspan="2" width="5%"></td>
		<td rowspan="2" width="10%" align="center"><img
			src="<%=cp%>/building3/img/ico-emoji-5.svg"></td>
		<td align="left">${Bdto.getReviewStar() }</td>
	</tr>

	<tr>
		<td>${Bdto.getGuestId() }</td>
	</tr>

	<tr>
		<td width="10px"></td>
		<td colspan="2" style="font-size: 16pt;">${Bdto.getReviewComment() }</td>
		<td></td>
	</tr>

	<tr height="1">
		<td width="10px"></td>
		<td colspan="3" bgcolor="#dbdbdb"></td>
		<td width="10px"></td>
	</tr>

	<tr>
		<td colspan="5" align="center"><a
			href="<%=cp%>/project/reviewPage.do" style="text-decoration: none">전체 후기 보기</a></td>
	</tr>

	<tr>
		<td colspan="5" align="center" style="font-size: 14pt;">후기(총 ${maxNum }개)</td>
	</tr>
</table>




<!-- 회사 사항 + 링크페이지 -->
<br /> <br />
<table width="60%" style="background-color: #eee;">

	<tr>
		<td><img src="<%=cp%>/css/img//ico-logo-gray.svg" alt="야놀자"></td>
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
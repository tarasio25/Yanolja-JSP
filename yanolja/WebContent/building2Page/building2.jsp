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
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css" />

<script type="text/javascript">

	function sendIt() {
		
		var f = document.building2Form;
		
		if(!f.people.value){
			alert("인원수 선택");
			f.people.focus();
			return;
		}
		
		if(!f.start.value){
			alert("체크인 입력");
			f.start.focus();
			return;
		}
		
		if(!f.end.value){
			alert("체크아웃 입력");
			f.end.focus();
			return;
		}
		
		f.action= "<%=cp%>/project/building2_ok.do";
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


<form action="" name="building2Form">
<table class="section">
<tr >
	<td>
	<table width="100%" cellpadding="1px" cellspacing="10px">
			
		<tr height="50">
			<td colspan="5"></td>
		</tr>
		<!-- kind > loc : 호텔 > 서울 -->
		<tr height="50">
			<td colspan="5" style="font-size: 30px "><b>&nbsp;&nbsp;&nbsp;${kind_H } > ${loc }</b></td>
		</tr>
		
		<tr height="5">
			<td colspan="5"></td>
		</tr>
		
		<!-- 검색창 -->
		<tr height="1">
			<td width="10px"></td>
			<td colspan="3" bgcolor="#dbdbdb"></td>
			<td width="10px"></td>
		</tr>
		
		<tr align="center">
			<td width="10px"></td>
			<td width="40%">인원</td>
			<td width="20%" >:</td>
			<td width="40%" ><select name="people">
					<option value="">인원선택</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
			</select> 명</td>
			<td width="10px"></td>
		</tr>

		
		<tr height="1">
			<td width="10px"></td>
			<td colspan="3" bgcolor="#dbdbdb"></td>
			<td width="10px"></td>
		</tr>

		<tr height="10px">
			<td width="10px"></td>
			<td colspan="1" width="40%" align="center" height="10">체크인<br />
				<input type="date" id="start" name="start" value="" min="sysdate" max="2023-12-31">
			</td>
			<td width="20%" align="center">/</td>
			<td colspan="1" width="40%" align="center" height="10">체크아웃<br />
				<input type="date" id="end" name="end" value="" min="sysdate" max="2023-12-31">
			</td>
			<td width="10px"></td>
		</tr>

		<tr height="1">
			<td width="10px"></td>
			<td colspan="3" bgcolor="#dbdbdb"></td>
			<td width="10px"></td>
		</tr>

		<tr height="30">
			<td colspan="5"></td>
		</tr>
			
		</table> <input type="button" class="pb" value="검   색" onclick="sendIt();" />

	</td>
</tr>
</table>
<input type="hidden" value="${kind_H }" name="kind_H"/>
<input type="hidden" value="${kind }" name="kind"/>
<input type="hidden" value="${loc }" name="loc"/>
<input type="hidden" value="${locDetail }" name="locDetail"/>
</form>

<!-- 모든 숙소 정보 -->
<c:forEach var="dto" items="${lists}">
<table class="section">
<tr>
	<td>
		<table width="100%">
			<tr>
				<td width="300px" rowspan="8"><img  height="200px" width="300px" src="<%=cp %>/image/${kind }/${dto.buildingNum}/1.jpg"/></td>
				<td width="50px" rowspan="8"></td>
				<td></td>
			</tr>
			<tr height="20px"><td></td></tr>
			<tr style="font-size: 30px" height="50px"><td><a href="<%=cp %>/project/building3.do?kind=${kind }&buildingNum=${dto.buildingNum}&start=${start}&end=${end}">
			
			<b>${dto.buildingName }</b>
			
			</a></td></tr>
			<tr height="10px"><td></td></tr>
			<tr style="font-size: 15px; text-align: right; font "><td>#${dto.buildingKW }</td></tr>
			<tr style="font-size: 15px; text-align: right; font "><td>${dto.buildingCI } ~ ${dto.buildingCI }</td></tr>
			
			<tr style="font-size: 15px; text-align: right; font "><td>가격 ${dto.roomPrice }</td></tr>
			
			<tr ><td></td></tr>
		</table>
	</td>
</tr>
</table>
</c:forEach>



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
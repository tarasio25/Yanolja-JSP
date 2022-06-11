<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 해당 아이디의 정보 List를 반환
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css"/>

<style>
	.close {
  	float: right;
  	cursor: pointer;
	
	}
</style>
<script type="text/javascript">

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


<!-- 연관상품(키워드가 같은 것) -->
<br/><br/><br/><br/><br/><br/>
<form action="" method="post" name="myForm">
<table class="section">

<tr height="300" align="left">	<td></td>  </tr>
<c:forEach var="i" begin="0" end="${bslists.size()-1 }">
<tr height="20"><td></td></tr>

<tr>
	<td><strong>${blists.get(i).getBuildingName() }</strong>
			숙소&nbsp;|&nbsp;${blists.get(i).getBuildingLoc() }
	</td>
</tr>
	
<tr height="10"><td></td></tr>
	
<tr><td width="100%"><hr size="1"></td></tr>
	
<tr height="20"><td></td></tr>
		
<tr>
	<td>
		<img src="<%=cp %>/image/${blists.get(i).getBuildingKind() }/${blists.get(i).getBuildingNum() }/1.jpg" align="left" alt="호텔 사진"/>
		
		<b>방이름${rlists.get(i).getRoomName() }(방 옵션${rlists.get(i).getRoomOption() })</b><br/>
			체크인 체크인날짜${blists.get(i).getBuildingCI() }&nbsp;&nbsp;체크아웃&nbsp;체크아웃날짜${blists.get(i).getBuildingCO() }
			기준 방 인원${rlists.get(i).getRoomPeople() }명<br/><br/><br/><br/><br/><br/><br/><br/>
			<div style=float: right;> 숙박 <b>결제 금액${bslists.get(i).getTotalPrice() }원</b></div>
	</td>
</tr>
</c:forEach>
	
</table>


<table width="60%">
	<tr>
		<td colspan="2" align="center"><br/>
		
		</br>
		<input type="button" class="pb" name="idpwdSearch" value="장바구니 예약하기" onclick="sendIt();"/>
		</td></tr><tr><td>
		<input type="button" class="wb" name="join_ok" value=" 뒤로가기 " onclick="location.href='<%=cp %>/project/main.do';"/>
		</td>
	</tr>
	<tr height="20"><td></td></tr>
</table>
</form>

<!-- 회사 사항 + 링크페이지 -->
<br/><br/>
<table width="60%" style="background-color: #eee;">
	<tr> <td> <img src="<%=cp %>/mainPage/img//ico-logo-gray.svg" alt="야놀자"> </td> </tr>
	<tr>
		<td>
		<b>(주)야놀자</b> | 대표이사 : 이수진 | 사업자 등록번호 : 220-87-42885 | 통신판매업신고 : 강남-14211호 | 메일 : help@yanolja.com<br>
		관광사업자 등록번호 : 제2016-31호 | 주소 : 서울 강남구 테헤란로 108길 42 | 호스팅서비스 제공자 : 주식회사 야놀자<br>
		고객센터 : 1644-1346 (오전 9시 - 익일 새벽 3시)
		</td>
	</tr>
	<tr>
		<td>
		<a href="https://yanolja.in/ko/companyinfo/" target="_blank">회사소개</a>
		<a href="https://business.yanolja.com/web/kr/index" target="_blank">광고제휴문의</a>
		<a href="https://careers.yanolja.co/" target="_blank">인재채용</a>
		<a href="http://m.policy.yanolja.com/?t=privacy&amp;d=m" target="_blank"><strong>개인정보처리방침</strong></a>
		</td>
	</tr>
	<tr>
		<td><a href="https://policy.yanolja.com/?t=youth" target="_blank">청소년 보호 정책</a>
		<a href="http://m.policy.yanolja.com/?t=service&amp;d=m" target="_blank">서비스 이용약관</a>
		<a href="http://m.policy.yanolja.com/?t=location&amp;d=m" target="_blank">위치정보이용약관</a>
		<a href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=2208742885" target="_blank">사업자 정보확인</a>
		</td>
	</tr>
</table>
<br/><br/>
</center>

</body>
</html>
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

</head>
<body>
	<center>
		<!-- 로고 -->
		<header>
		<table width="100%">
			<tr height="30" >
				<td width="20%" ></td>
				<td width="60%" align="center">
				<img src="<%=cp%>/css/img/logo.svg"></td>
				<td width="20%" align="right" style="padding-right: 20px">로그인/회원가입</td>
			</tr>
		</table>
		</header>



<!-- 여기에 코딩 하면 됩니다~!~! -->
<!-- 


* 적용되는 위치 : class이름

테이블 중 화이트 박스 창 : section

텍스트 아래 회색 밑줄 : text

핑크버튼 : pb
하양버튼 : wb


 -->

		<!-- 회사 사항 + 링크페이지 -->
		<br /><br />
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
					target="_blank">회사소개</a> 
					<a href="https://business.yanolja.com/web/kr/index" target="_blank">광고제휴문의</a>
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
		<br /><br />
	</center>
</body>
</html>
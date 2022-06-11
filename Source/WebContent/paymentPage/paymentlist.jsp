<%@page import="buyPage.BuyDTO"%>
<%@page import="buyPage.BuyDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@page import="java.util.List"%>

<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	Connection conn = DBConn.getConnection();
	BuyDAO dao = new BuyDAO(conn);
	
	int usernum = Integer.parseInt(request.getParameter("userNum"));
	List<BuyDTO> lists = dao.getList(usernum);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결제내역 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css"/>

<style>
	.close {
  	float: right;
  	cursor: pointer;
	
	}
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

<!-- 연관상품(키워드가 같은 것) -->
<br/><br/><br/><br/><br/><br/>
<form action="" method="post" name="myForm">
<table class="section">

<tr height="300" align="left">
	<td>	
	<table>
	<tr height="10"><td></td></tr>
	<tr height="20"><td></td></tr>
	
	<%for(BuyDTO  dto : lists) { %> 

	<tr>
	</tr>

	<tr height="30"><td></td></tr>
	
	<tr height="30"><td></td></tr>
	
	<tr height="10"><td></td></tr>
	<tr>
		<td width="100%">
			<hr size="1">
		</td>
	</tr>
	<tr height="20"><td></td></tr>
	<tr align="left">
		<td>
		
		</td>
	</tr>		
	<tr>
		<td>
			<img src="<%=cp %>/basketPage/img/hotel.JPG" align="left" alt="호텔 사진"/>
			<b>숙소정보</b><br><%= dto.getBuildingnum() %><br/>&nbsp;&nbsp;
			<%= dto.getStartdate() %>&nbsp;&nbsp;<%= dto.getEnddate() %>&nbsp;
			기준 2명/최대2명<br/><br/><br/><br/><br/><br/><br/><br/>
			숙박 <b><%= dto.getTotalprice() %></b>
		</td> 
	</tr>
	</table>
	</td>
	<% } %> 
</table>
<table width="60%">
	<tr>

		<td colspan="2" align="center"><br/>
		
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
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>야놀자 | 여행의 모든 것</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css"/>

<style type="text/css">


#rcorners1{
border-radius: 8px;
}

.d{
box-shadow: 1px 1px 1px 1px #D5D5D5;
}

div{
text-align: left;
}

tr.space {
  border-bottom: 10px solid #fff;
}


</style>

</head>
<body>
<center>

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

<br/><br/>

<table border="1" bordercolor="#F6F6F6"  width="670" height="120" 
	cellspacing="0" cellpadding="1" bgcolor="#ffffff" id="rcorners1" class="section">

<colgroup>
	<col style="width:50%">
	<col style="width:50%">
</colgroup>

<tr>

	<td colspan="2" height="70" align="left">아이디불러오기
	<a href="<%=cp %>/project/pwdMapping.do">
	<img src="<%=cp %>/css/img/img-my-profile-50.svg" align="left" width="45" height="45"/><br/>&nbsp;내정보 관리 &gt;</a></td>
	</tr>
	
	<tr>
	    <td><a href="<%=cp %>/project/payment.do">
	    <img src="<%=cp %>/css/img/ic-my-point-18.svg" align="left" width="20" height="20"></a>&nbsp;결제 내역
	    </td>
	    <td><img src="<%=cp %>/css/img/ic-system-review-18.svg" align="left" width="20" height="20">&nbsp;나의후기</td>
	</tr>
</table>
<br/>
<img src="<%=cp %>/css/img/yahetak.png" align="center" width="670" height="55">

<br/><br/>
<h3>예약 내역</h3>
<table border="1" bordercolor="#F6F6F6" width="670" height="40" 
	cellspacing="0" cellpadding="1" bgcolor="#ffffff" id="rcorners1" class="section">
	<tr>
	<td colspan="2" height="40" align="left">
	&nbsp;&nbsp;국내여행 통합예약</td>
	</tr>
</table>



<table border="1" bordercolor="#F6F6F6" width="670" height="40" 
	cellspacing="0" cellpadding="1" bgcolor="#ffffff" id="rcorners1" class="section">
<tr>
	<td colspan="2" height="40" align="left">
	&nbsp;&nbsp;해외 예약 내역</td>
	</tr>
</table>
<br/>



<td><img src="<%=cp %>/css/img/sozung.png" align="center" width="670" height="55"></td>
<table border="1" bordercolor="#F6F6F6" width="670" height="75" 
	cellspacing="0" cellpadding="1" bgcolor="#ffffff" class="section">
	
<colgroup>
	<col style="width:33%">
	<col style="width:33%">
	<col style="width:33%">
</colgroup>

<tr>
	<td><img src="<%=cp %>/css/img/ic-system-event-36.svg" align="top"  width="40" height="40">
	<a href="https://www.yanolja.com/event/18860" target="_blank"><br/>&nbsp;이벤트</a></td>
	
	<td><img src="<%=cp %>/css/img/ic-system-exhibitions-36.svg" align="center" width="40" height="40">
	<a href="https://www.yanolja.com/exhibition" target="_blank"><br/>&nbsp;기획전</a></td>
	
	<td><img src="<%=cp %>/css/img/ic-system-winner-36.svg" align="center" width="40" height="40">
	<a href="https://www.yanolja.com/exhibition" target="_blank"><br/>&nbsp;당첨자 발표</a></td>
	</tr>
</table>
<br/>


<table border="1" bordercolor="#F6F6F6" width="670" height="75" 
   cellspacing="0" cellpadding="1" bgcolor="#ffffff" class="section">
   
<colgroup>
	<col style="width:50%">
	<col style="width:50%">
</colgroup>
	
   
   
   
<tr>
    <td colspan="2">
    <img src="<%=cp %>/css/img/ico-customer.svg" align="left" width="20" height="20">
    고객센터</td>
</tr>
<tr>
    <td><a href="https://pf.kakao.com/_xexnXed" target="_blank">카카오톡 1:1 문의</a></td>
    <td>&nbsp;&nbsp;상담원 전화 문의: 02-1644-1346</td>
</tr>
</table>

<br/>
   
<table border="1" bordercolor="#F6F6F6" width="670" height="75" 
   cellspacing="0" cellpadding="1" bgcolor="#ffffff" class="section">
   
<colgroup>
	<col style="width:50%">
	<col style="width:50%">
</colgroup>
	   
   
   
<tr>
    <td>&nbsp;&nbsp;자주 묻는 질문 FAQ</td>
    <td>&nbsp;&nbsp;공지사항</td>
</tr>
<tr>
    <td>&nbsp;&nbsp;야놀자 정보</td>
    <td>&nbsp;&nbsp;설정</td>
</tr>
</table>
   
<br/><br/>


</center>
</body>
</html>
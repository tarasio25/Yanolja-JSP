<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css"/>

<script type="text/javascript">

	function sendIt(){
		
		var f = document.loginForm;
		
		f.action = "<%=cp%>/project/login_ok.do";
		f.submit();
	}

</script>

<c:if test="${flag == 1}">
<script>
alert("ID 혹은 PW가 잘못되었습니다.");
</script>

</c:if>


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
	
		
		
		
	</td>
</tr>
</table>
</header>

<!-- login -->
<br/><br/><br/><br/><br/><br/>
<form action="" method="post" name="loginForm">
<table class="section">
<tr height="300" align="left">
	<td>
	
	
	<table width="100%">
	<tr><td>아이디</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="text" name="guestId" class="text" style="width: 95%;"/></td>
	</tr>
	<tr height="20"><td></td></tr>
	<tr><td>비밀번호</td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><input type="password" name="guestPwd" class="text" style="width: 95%;"/></td>
	</tr>
	
	<tr height="20"><td></td></tr>
	
	<tr>
		<td colspan="2" align="center">
		<input type="button" class="pb" name="idpwdSearch_ok" value=" ID/PW 찾기 " onclick="location.href='<%=cp %>/project/idpwdSearch.do';"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="wb" name="join_ok" value=" 회원가입 " onclick="location.href='<%=cp %>/project/created.do';"/>
		</td>
	</tr>
	
	<tr height="20"><td></td></tr>
	
	<tr>
		<td colspan="2" align="center"><input type="button" class="pb" name="login_ok" value=" 로그인 " onclick="sendIt();"/></td>
	</tr>
	</table>

	</td>
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
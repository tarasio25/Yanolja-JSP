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

<title>회원 수정 페이지</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css"/>
<style>

span {
    display: block;
    padding: 15px 30px;
    background: #fff;
    z-index: 100;
    position: relative;
    transition: all .35s ease-in-out .35s;
  }
  
</style>

<script type="text/javascript">
	
	function sendIt() {
		var f = document.loginForm;
		f.action = "<%=cp%>/project/updated_ok.do";
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
	<td width="60%" align="center" style="font-size: 30px"><b>내&nbsp;정보&nbsp;관리</b></td>
	<td width="20%" align="right" style="padding-right: 20px">
		<a href="<%=cp%>/basketPage/basketlist.jsp">
			<img src="<%=cp%>/mainPage/img/basket.jpg">
		</a>
		<a href="<%=cp%>/mainPage/loginPage.jsp">로그인/회원가입</a>
	</td>
</tr>
</table>
</header>
<!-- 연관상품(키워드가 같은 것) -->
<br/><br/><br/>

<form action="" method="post" name="loginForm">

	<table width="100%" class="section">
		<tr>
			<td align="center"><img src="<%=cp %>/updatePage/img/user.jpg"/></td>
		</tr>
		<tr>
			<td align="center" style="font-size: 15px"><b>${dto.guestName }</b></td>
		</tr>
		<tr>
			<td align="center" style="font-size: 15px"><b>${dto.guestEmail }</b></td>
		</tr>
	<tr height="50" align="center">
	</table>
<table class="section">
<tr height="300" align="left">
	<td>
	<table border="0" width="100%">
	<tr><td><b>개인정보</b></td></tr>
	<tr height="10"><td></td></tr>
	<tr>
		<td><hr size = "1"/></td> 
	</tr>
	<tr height="30"><td></td></tr>
	<tr>
		<td>아이디&nbsp;&nbsp;&nbsp;${dto.guestId }</td>
	</tr>
	<tr height="30"><td></td></tr>
	<tr>
		<td>이메일&nbsp;&nbsp;&nbsp;${dto.guestEmail }</td>
	<tr>
	<tr height="30"><td></td></tr>
	<tr>
		<td>생년월일&nbsp;&nbsp;&nbsp;${dto.guestBirth }</td>
	<tr>
	
	<tr height="30"><td></td></tr>
	<tr>
		<td>비밀번호&nbsp;&nbsp;&nbsp;${dto.guestPwd }</td>
		<td align="right">수정하기</td> <!--  get방식으로 넘겨주기  -->
	<tr>
	
	<tr>
		<td><input tyep="text" name="guestPwd"/>
	</tr>
	
	<tr height="30"><td></td></tr>
	<tr>
		<td>휴대폰번호&nbsp;&nbsp;&nbsp;${dto.guestTel }</td><td align="right">수정하기</td> <!--  get방식으로 넘겨주기  -->
	<tr>
	<tr height="20"><td></td></tr>
	<tr>
		<td><input tyep="text" name="guestTel"/>
	</tr>
	<tr height="10"><td></td></tr>

	<tr>
		<td colspan="2" align="center"><input type="button" class="pb" name="login_ok" value=" 정보 수정 완료 " onclick="sendIt();"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" class="wb" name="login_ok" value=" 뒤로 가기 " onclick="javascript:location.href='<%=cp%>/project/maine.do';"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><input type="button" class="pb" name="deleted_ok" value=" 회원탈퇴 " onclick="javascript:location.href='<%=cp%>/project/pwdMapping2.do';"/></td>
	</tr>
	
	
	</table>
	</td>
</table>
<table></table>

</form>
<!-- 회사 사항 + 링크페이지 -->

	
<br/><br/>






<center>
<table width="60%" style="background-color: #eee;">
	<tr> <td> <img src="<%=cp %>/mainPage/img/ico-logo-gray.svg" alt="야놀자"> </td> </tr>
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
</center>
<br/><br/>
</center>
</body>
</html>
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
<table class="section" cellpadding="0" cellspacing="0">
<tr height="50" align="left"> <td colspan="4"> <h3>${kind_H }</h3> </td> </tr>
<tr height="50" align="left"> <td colspan="4"> <b>지역선택</b> </td> </tr>
<tr height="2" bgcolor="black"> <td colspan="4"> </td></tr>
<tr>
	<td width="40%" align="left" style="padding-left: 10px;">서울</td>
	
	<c:if test="${open eq 'n' || open eq null || ! (loc eq '서울')}">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=y&loc=서울">▼</a></td>
	</c:if>
	
	<c:if test="${open eq 'y' && loc eq '서울' }">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=n&loc=서울">▲</a></td>
	</c:if>
	
	<td width="40%" align="left" style="padding-left: 10px;">인천</td>
	
	<c:if test="${open eq 'n' || open eq null || ! (loc eq '인천')}">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=y&loc=인천">▼</a></td>
	</c:if>
	
	<c:if test="${open eq 'y' && loc eq '인천' }">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=n&loc=인천">▲</a></td>
	</c:if>
	
<tr height="1" bgcolor="#eee"> <td colspan="2"></td> <td colspan="2"></td> </tr>
<tr>
	<td colspan="4">
	<table width="100%">
	
	<c:if test="${open eq 'y' && (loc eq '서울' || loc eq '인천')}">
	<c:set var="i" value="1"/>
	<c:forEach var="locDetail" items="${locLists}">
		<c:if test="${i%2==1 }"><tr></c:if>
			<td width="50%"><a href="<%=cp%>/project/building2.do?kind=${kind}&loc=${loc}&locDetail=${locDetail}">
			${locDetail }
			</a></td>
		<c:if test="${i%2==0 }"></tr></c:if>
		<c:set var="i" value="${i+1}"/>
	</c:forEach>
	<tr height="1" bgcolor="#eee"> <td colspan="2"></td> </tr>
	</c:if>
	
	
	</table>
	</td>
</tr>

<tr>
	<td width="40%" align="left" style="padding-left: 10px;">부산</td>
	
	<c:if test="${open eq 'n' || open eq null || ! (loc eq '부산')}">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=y&loc=부산">▼</a></td>
	</c:if>
	
	<c:if test="${open eq 'y' && loc eq '부산' }">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=n&loc=부산">▲</a></td>
	</c:if>
	
	<td width="40%" align="left" style="padding-left: 10px;">제주</td>
	
	<c:if test="${open eq 'n' || open eq null || ! (loc eq '제주')}">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=y&loc=제주">▼</a></td>
	</c:if>
	
	<c:if test="${open eq 'y' && loc eq '제주' }">
	<td width="10%" align="right"><a href="building1.do?kind=${kind }&open=n&loc=제주">▲</a></td>
	</c:if>
	
<tr height="1" bgcolor="#eee"> <td colspan="2"></td> <td colspan="2"></td> </tr>
<tr>
	<td colspan="4">
	<table width="100%">
	
	<c:if test="${open eq 'y' && (loc eq '부산' || loc eq '제주')}">
	<c:set var="i" value="1"/>
	<c:forEach var="locDetail" items="${locLists}">
		<c:if test="${i%2==1 }"><tr></c:if>
			<td width="50%"><a href="<%=cp%>/project/building2.do?kind=${kind}&loc=${loc}&locDetail=${locDetail}">
			${locDetail }
			</a></td>
		<c:if test="${i%2==0 }"></tr></c:if>
		<c:set var="i" value="${i+1}"/>
	</c:forEach>
	</c:if>
	
	</table>
	</td>
</tr>

</table>


<br/><br/>
<table class="section" border="1" cellpadding="0" cellspacing="0">
<tr height="300">
<td> 해당 숙소의 상위 3개 숙소</td>
</tr>
</table>




</center>
</body>
</html>